//
//  ViewController.m
//  UICollectionViewExperiment
//
//  Created by Tian, Di on 7/21/16.
//  Copyright © 2016 Tian, Di. All rights reserved.
//

#import "ViewController.h"
#import "CVCell.h"

@interface ViewController ()

@property (nonatomic, strong) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *mutableArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < 5; ++i) {
        [mutableArray addObject:[NSString stringWithFormat:@"Cell %d", i]];
    }
    self.dataArray = [NSArray arrayWithObjects:mutableArray, nil];
    
    //self.collectionView.frame = [[UIScreen mainScreen] bounds];
    [self.collectionView registerClass:[CVCell class] forCellWithReuseIdentifier:@"cvCell"];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setItemSize:CGSizeMake(160, 160)];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    [flowLayout setMinimumLineSpacing:0.0f];
    [flowLayout setMinimumInteritemSpacing:0.0f];
    
    [self.collectionView setCollectionViewLayout:flowLayout];
    
    [self.collectionView setShowsVerticalScrollIndicator:NO];
    [self.collectionView setShowsHorizontalScrollIndicator:NO];
}

#pragma mark - UICollectionViewDataSource methods
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
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
    CVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier
                                                            forIndexPath:indexPath];
    [cell.titleLabel setText:cellData];
    return cell;
}

@end
