//
//  BNRImageStore.m
//  Homepwner
//
//  Created by Tian, Di on 6/15/16.
//  Copyright © 2016 Tian, Di. All rights reserved.
//
#import "BNRImageStore.h"

@interface BNRImageStore ()

@property (nonatomic, strong) NSMutableDictionary *dictionary;

@end

@implementation BNRImageStore

// Singleton
+ (instancetype)sharedStore
{
    static BNRImageStore *sharedStore = nil;
    
    // Thread-safe singleton
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedStore = [[self alloc] initPrivate];
    });
    return sharedStore;
}

// No one should call it
- (instancetype)init
{
    [NSException raise:@"Singleton" format:@"Use +[BNRImageStore sharedStore]"];
    return nil;
}

// Secret designated initializer
- (instancetype)initPrivate
{
    self = [super init];
    
    if (self) {
        _dictionary = [[NSMutableDictionary alloc] init];
        
        NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
        [nc addObserver:self
               selector:@selector(clearCache:)
                   name:UIApplicationDidReceiveMemoryWarningNotification
                 object:nil];
    }
    
    return self;
}

- (void)setImage:(id)image forKey:(NSString *)key
{
    self.dictionary[key] = image;
    
    // Create full path for image
    NSString *imagePath = [self imagePathForKey:key];
    
    // Turn image into JPEG data
    NSData *data = UIImageJPEGRepresentation(image, 0.5);
    
    // Write it to full path
    [data writeToFile:imagePath atomically:YES];
}

- (UIImage *)imageForKey:(NSString *)key
{
    // If possible, get it from the dictionary
    UIImage *result = self.dictionary[key];
    
    if (!result) {
        NSString *imagePath = [self imagePathForKey:key];
        
        // Create UIImage object from file
        result = [UIImage imageWithContentsOfFile:imagePath];
        
        // If we found an image on the file system, place it into the cache
        if (result) {
            self.dictionary[key] = result;
        } else {
            NSLog(@"Error: unable to find %@", imagePath);
        }
    }
    return result;
}

- (void)deleteImageForKey:(NSString *)key
{
    if (!key) {
        return;
    }
    [self.dictionary removeObjectForKey:key];
    
    NSString *imagePath = [self imagePathForKey:key];
    [[NSFileManager defaultManager] removeItemAtPath:imagePath error:nil];
}

- (NSString *)imagePathForKey:(NSString *)key
{
    NSArray *documentDirectories =
        NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentDirectory = [documentDirectories firstObject];
    
    return [documentDirectory stringByAppendingPathComponent:key];
}

- (void)clearCache:(NSNotification *)note
{
    NSLog(@"Flushing %lu images out of the cache...", (unsigned long)[self.dictionary count]);
    [self.dictionary removeAllObjects];
}

@end
