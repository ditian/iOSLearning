//
//  BNRDrawViewController.m
//  TouchTracker
//
//  Created by Tian, Di on 6/15/16.
//  Copyright © 2016 Tian, Di. All rights reserved.
//

#import "BNRDrawViewController.h"
#import "BNRDrawView.h"

@interface BNRDrawViewController ()

@end

@implementation BNRDrawViewController

- (void)loadView
{
    self.view = [[BNRDrawView alloc] initWithFrame:CGRectZero];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

@end
