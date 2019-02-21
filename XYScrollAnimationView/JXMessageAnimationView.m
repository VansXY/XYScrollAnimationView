//
//  JXMessageAnimationView.m
//  XYDemo
//
//  Created by 肖扬 on 2019/1/17.
//  Copyright © 2019 肖扬. All rights reserved.
//

#import "JXMessageAnimationView.h"

@interface JXMessageAnimationView () {
    NSInteger currentCount;
}
/// button1
@property (nonatomic, strong) UIButton *button1;
/// button2
@property (nonatomic, strong) UIButton *button2;
/// button3
@property (nonatomic, strong) UIButton *button3;
/// button4
@property (nonatomic, strong) UIButton *button4;
/// tempButton
@property (nonatomic, strong) UIButton *tempButton;
/// backImage
@property (nonatomic, strong) UIImage *backImage;

@end

@implementation JXMessageAnimationView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.clipsToBounds = YES;
        [self setUI];
    }
    return self;
}

- (void)setUI {
    UIImage *image = [UIImage imageNamed:@"live_say"];
    UIEdgeInsets insets = UIEdgeInsetsMake(10.5, 10.5, 10.5, 10.5);
    _backImage = [image resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];

    for (int i = 0 ; i < 4; i++) {
        UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
        button.frame = CGRectMake(10, 30 + 30 * i, 30, 21);
        button.titleLabel.font = [UIFont systemFontOfSize:11];
        [button setTitleColor:[UIColor purpleColor] forState:(UIControlStateNormal)];
        [button setBackgroundImage:_backImage forState:(UIControlStateNormal)];
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10.5, 0, 10.5);
        button.tag = 100 + i;
        button.userInteractionEnabled = NO;
        [self addSubview:button];
    }
    self.button1 = [self viewWithTag:100];
    self.button2 = [self viewWithTag:101];
    self.button3 = [self viewWithTag:102];
    self.button4 = [self viewWithTag:103];
    [self.button1 setTitle:@"1" forState:(UIControlStateNormal)];
    [self.button2 setTitle:@"2" forState:(UIControlStateNormal)];
    [self.button3 setTitle:@"3" forState:(UIControlStateNormal)];
    [self.button4 setTitle:@"4" forState:(UIControlStateNormal)];
    currentCount = 4;
    [self addAnimation];
}

- (void)addAnimation {
    [UIView animateWithDuration:1 animations:^{
        [self animationIng];
    } completion:^(BOOL finished) {
        sleep(1);
        [self animationEnd];
    }];
}

- (void)animationIng {
    self.button1.frame = CGRectMake(10, 10, self.button1.frame.size.width, 21);
    self.button2.frame = CGRectMake(10, 40, self.button2.frame.size.width, 21);
    self.button3.frame = CGRectMake(10, 70, self.button3.frame.size.width, 21);
    self.button4.frame = CGRectMake(10, 100, self.button4.frame.size.width, 21);
    self.button1.alpha = 0;
    self.button2.alpha = 0.5;
    self.button4.alpha = 1;
}

- (void)animationEnd {
    currentCount += 1;
    [self addButton];
    [self.button1 removeFromSuperview];
    self.button1 = self.button2;
    self.button2 = self.button3;
    self.button3 = self.button4;
    self.button4 = _tempButton;
    [self addAnimation];
}

- (void)addButton {
    if (currentCount >= _dataArray.count) {
        currentCount = 1;
    }
    NSString *text = _dataArray[currentCount];
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    style.lineBreakMode = NSLineBreakByWordWrapping;
    style.alignment = NSTextAlignmentLeft;
    NSAttributedString *string = [[NSAttributedString alloc]initWithString:text attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:11], NSParagraphStyleAttributeName:style}];
    CGSize size =  [string boundingRectWithSize:CGSizeMake(MAXFLOAT, 21) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil].size;
    CGFloat wid = size.width + 21;
    
    _tempButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    _tempButton.frame = CGRectMake(10, 130, wid, 21);
    _tempButton.titleLabel.font = [UIFont systemFontOfSize:11];
    _tempButton.titleEdgeInsets = UIEdgeInsetsMake(0, 10.5, 0, 10.5);
    [_tempButton setTitleColor:[UIColor purpleColor] forState:(UIControlStateNormal)];
    [_tempButton setBackgroundImage:_backImage forState:(UIControlStateNormal)];
    [_tempButton setTitle:text forState:(UIControlStateNormal)];
    _tempButton.userInteractionEnabled = NO;
    [self sendSubviewToBack:_tempButton];
    [self addSubview:_tempButton];
}

@end
