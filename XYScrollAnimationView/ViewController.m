//
//  ViewController.m
//  XYScrollAnimationView
//
//  Created by 肖扬 on 2019/2/21.
//  Copyright © 2019 肖扬. All rights reserved.
//

#import "ViewController.h"
#import "JXMessageAnimationView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor orangeColor];
    [self setUI];
}

- (void)setUI {
    JXMessageAnimationView *animationView = [[JXMessageAnimationView alloc] initWithFrame:CGRectMake(0, 100, 220, 120)];
    animationView.dataArray = @[@"sadasdasdasdas", @"cvzczx", @"seerfweqrsdasdasda", @"asd", @"dasdas", @"sadasdasdasdas", @"cvzczx", @"seerfweqrsdasdasda", @"asd", @"dasdas", @"sadasdasdasdas", @"cvzczx", @"seerfweqrsdasdasda", @"asd", @"dasdas"];
    animationView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:animationView];
}


@end
