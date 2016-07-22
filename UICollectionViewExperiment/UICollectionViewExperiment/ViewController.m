//
//  ViewController.m
//  UICollectionViewExperiment
//
//  Created by Tian, Di on 7/21/16.
//  Copyright © 2016 Tian, Di. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *firstSection = [[NSMutableArray alloc] init];
    for (int i = 0; i < 50; ++i) {
        [firstSection addObject:[NSString stringWithFormat:@"Cell %d", i]];
    }
    self.dataArray = [[NSArray alloc] initWithObjects:firstSection, nil];
    
    UINib *cellNib = [UINib nibWithNibName:@"NibCell" bundle:nil];
    [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:@"cvCell"];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setItemSize:CGSizeMake(160, 160)];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    [flowLayout setMinimumLineSpacing:0.0f];
    [flowLayout setMinimumInteritemSpacing:0.0f];
    
    [self.collectionView setCollectionViewLayout:flowLayout];
    
    [self.collectionView setShowsVerticalScrollIndicator:NO];
    [self.collectionView setShowsHorizontalScrollIndicator:NO];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return [self.dataArray count];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    NSMutableArray *sectionArray = [self.dataArray objectAtIndex:section];
    return [sectionArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSMutableArray *data = [self.dataArray objectAtIndex:indexPath.section];
    NSString *cellData = [data objectAtIndex:indexPath.row];
    static NSString *cellIdentifier = @"cvCell";
    UICollectionViewCell *cell = [collectionView
                                  dequeueReusableCellWithReuseIdentifier:cellIdentifier
                                                            forIndexPath:indexPath];
    UILabel *titleLabel = (UILabel *)[cell viewWithTag:100];
    [titleLabel setText:cellData];
    return cell;
}

@end
