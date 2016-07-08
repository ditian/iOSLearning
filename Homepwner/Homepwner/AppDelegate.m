//
//  AppDelegate.m
//  Homepwner
//
//  Created by Tian, Di on 6/9/16.
//  Copyright © 2016 Tian, Di. All rights reserved.
//

#import "AppDelegate.h"
#import "BNRItemsViewController.h"
#import "BNRItemStore.h"

NSString * const BNRNextItemValuePrefsKey = @"NextItemValue";
NSString * const BNRNextItemNamePrefsKey = @"NextItemName";

@interface AppDelegate ()

@end

@implementation AppDelegate
+ (void)initialize
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *factorySettings = @{BNRNextItemValuePrefsKey : @75,
                                      BNRNextItemNamePrefsKey : @"Coffee Cup"};
    [defaults registerDefaults:factorySettings];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    
    // If state restoration did not occur, set up the view controller hierarchy
    if (!self.window.rootViewController) {
        // Create a BNRItemsViewController
        BNRItemsViewController *itemsViewController = [[BNRItemsViewController alloc] init];
    
        // Create an instance of a UINavigationController, its stack contains only itemsViewController
        UINavigationController *navController = [[UINavigationController alloc]
                                                 initWithRootViewController:itemsViewController];
    
        // Give the navigation controller a restoration identifier that is the same name as the class
        navController.restorationIdentifier = NSStringFromClass([navController class]);
    
        // Place BNRItemsViewController's table view in the window hierarchy
        self.window.rootViewController = navController;
    }
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    
    BOOL success = [[BNRItemStore sharedStore] saveChanges];
    if (success) {
        NSLog(@"Saved all of the Items.");
    } else {
        NSLog(@"Could not save any of the Items.");
    }
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)applicationWillTerminate:(UIApplication *)application {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (BOOL)application:(UIApplication *)application
willFinishLaunchingWithOptions:(nullable NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    return YES;
}

- (BOOL)application:(UIApplication *)app shouldSaveApplicationState:(nonnull NSCoder *)coder
{
    return YES;
}

- (BOOL)application:(UIApplication *)application shouldRestoreApplicationState:(NSCoder *)coder
{
    return YES;
}

- (UIViewController *)application:(UIApplication *)application
viewControllerWithRestorationIdentifierPath:(NSArray *)identifierComponents
                            coder:(NSCoder *)coder
{
    // Create a new navigation controller
    UIViewController *vc = [[UINavigationController alloc] init];
    
    // The last object in the path array is the restoration identifier for this view controller
    vc.restorationIdentifier = [identifierComponents lastObject];
    
    if ([identifierComponents count] == 1) {
        // If there is only 1 identifier component, then this is the root view controller
        self.window.rootViewController = vc;
    } else {
        // Else, it is the navigation controller for a new item,
        // so you need to set its modal presentation style.
        vc.modalPresentationStyle = UIModalPresentationFormSheet;
    }
    
    return vc;
}

@end
