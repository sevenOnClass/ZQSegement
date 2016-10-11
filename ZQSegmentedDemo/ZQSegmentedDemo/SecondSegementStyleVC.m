//
//  SecondSegementStyleVC.m
//  ZQSegmentedDemo
//
//  Created by 三海 on 16/10/11.
//  Copyright © 2016年 seven. All rights reserved.
//

#import "SecondSegementStyleVC.h"
#import "UIColor+ZQ.h"

@interface SecondSegementStyleVC ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *segementedControl;
@property (weak, nonatomic) IBOutlet UINavigationItem *navigationItem;

@end

@implementation SecondSegementStyleVC


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor randomColor];
    
    [self.segementedControl setTitle:@"A" forSegmentAtIndex:0];
    [self.segementedControl setTitle:@"B" forSegmentAtIndex:1];
    
    [self.segementedControl setTintColor:[UIColor whiteColor]];
    
}
- (IBAction)segementValueChanged:(UISegmentedControl *)sender {
    NSLog(@"%zd",sender.selectedSegmentIndex);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
