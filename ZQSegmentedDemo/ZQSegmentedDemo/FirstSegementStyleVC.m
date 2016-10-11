//
//  FirstSegementStyleVC.m
//  ZQSegmentedDemo
//
//  Created by 三海 on 16/10/11.
//  Copyright © 2016年 seven. All rights reserved.
//

#import "FirstSegementStyleVC.h"
#import "UIColor+ZQ.h"

#define SYSFont(a) [UIFont systemFontOfSize:a]
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface FirstSegementStyleVC ()

@end

@implementation FirstSegementStyleVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor randomColor];
    
    [self setNav];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    for(int i=0;i<2;i++)
    {
        UIButton *btn=(UIButton*)[self.navigationController.view viewWithTag:2222+i];
        [btn removeFromSuperview];
    }
    UIView *view=(UIView*)[self.navigationController.view viewWithTag:2224];
    [view removeFromSuperview];
    
}

- (void)setNav
{
    self.automaticallyAdjustsScrollViewInsets=NO;
    

    UIView *backView=[[UIView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-126)/2, 26, 126, 32)];
    backView.layer.borderWidth=1;
    backView.layer.cornerRadius=16;
    backView.tag=2224;
    backView.layer.borderColor=[UIColor whiteColor].CGColor;
    [self.navigationController.view addSubview:backView];
    
    UIButton *segLeftBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [segLeftBtn setTitle:@"One" forState:UIControlStateNormal];
    [segLeftBtn setTitleColor:[UIColor colorWithHexString:@"fcb314"] forState:UIControlStateNormal];
    segLeftBtn.backgroundColor=[UIColor whiteColor];
    segLeftBtn.frame=CGRectMake(1, 1, 62, 30);
    segLeftBtn.titleLabel.font=SYSFont(12);
    segLeftBtn.tag=2222;
    
    UIBezierPath *maskPath=[UIBezierPath bezierPathWithRoundedRect:segLeftBtn.bounds byRoundingCorners:UIRectCornerBottomLeft|UIRectCornerTopLeft cornerRadii:CGSizeMake(15, 15)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = segLeftBtn.bounds;
    maskLayer.path = maskPath.CGPath;
    segLeftBtn.layer.mask = maskLayer;
    [segLeftBtn addTarget:self action:@selector(segmentedControlBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:segLeftBtn];
    
    UIButton *segRightBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [segRightBtn setTitle:@"Two" forState:UIControlStateNormal];
    [segRightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    segRightBtn.backgroundColor=[UIColor clearColor];
    segRightBtn.frame=CGRectMake(1+62, 1, 62, 30);
    segRightBtn.titleLabel.font=SYSFont(12);
    segRightBtn.tag=2223;
    UIBezierPath *maskPath1=[UIBezierPath bezierPathWithRoundedRect:segRightBtn.bounds byRoundingCorners:UIRectCornerBottomRight|UIRectCornerTopRight cornerRadii:CGSizeMake(15, 15)];
    CAShapeLayer *maskLayer1 = [[CAShapeLayer alloc] init];
    maskLayer1.borderColor=[UIColor whiteColor].CGColor;
    maskLayer1.frame = segRightBtn.bounds;
    maskLayer1.path = maskPath1.CGPath;
    segRightBtn.layer.mask = maskLayer1;
    
    [segRightBtn addTarget:self action:@selector(segmentedControlBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:segRightBtn];

    [self segmentedControlBtnClick:segLeftBtn];

}

- (void)segmentedControlBtnClick:(UIButton *)btn {
    UIImageView *image1=(UIImageView*)[self.view viewWithTag:222222];
    [image1 removeFromSuperview];
    UIImageView *image=(UIImageView*)[self.view viewWithTag:111111];
    [image removeFromSuperview];
    
    UIButton *segLeftBtn=(UIButton*)[self.navigationController.view viewWithTag:2223];
    UIButton *segRightBtn=(UIButton*)[self.navigationController.view viewWithTag:2222];
    if (btn.tag==2222)
    {

        [segLeftBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        segLeftBtn.backgroundColor=[UIColor clearColor];
        [segRightBtn setTitleColor:[UIColor colorWithHexString:@"fcb314"] forState:UIControlStateNormal];
        segRightBtn.backgroundColor=[UIColor whiteColor];
    }
    else
    {
        [segRightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        segRightBtn.backgroundColor=[UIColor clearColor];
        [segLeftBtn setTitleColor:[UIColor colorWithHexString:@"fcb314"] forState:UIControlStateNormal];
        segLeftBtn.backgroundColor=[UIColor whiteColor];
    }
    self.view.backgroundColor = [UIColor randomColor];
}

- (void)backBtnClick {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
