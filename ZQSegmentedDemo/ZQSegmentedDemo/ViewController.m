//
//  ViewController.m
//  ZQSegmentedDemo
//
//  Created by 三海 on 16/10/11.
//  Copyright © 2016年 seven. All rights reserved.
//

#import "ViewController.h"
#import "UIColor+ZQ.h"
#import "SecondSegementStyleVC.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *listView;
@property (nonatomic, strong) NSArray *dataArr;
@end

@implementation ViewController

- (UITableView *)listView {
    if (!_listView) {
        _listView = [[UITableView alloc] initWithFrame:self.view.bounds];
        _listView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _listView.backgroundColor = [UIColor colorWithHexString:@"f7f7f7"];
        _listView.dataSource = self;
        _listView.delegate = self;
    }
    return _listView;
}
- (NSArray *)dataArr {
    if (!_dataArr) {
        NSString *settingArr = [[NSBundle mainBundle] pathForResource:@"VCSetting" ofType:@"plist"];
        _dataArr = [NSArray arrayWithContentsOfFile:settingArr];
    }
    return _dataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNav];
    [self.view addSubview:self.listView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)setNav {
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithHexString:@"fcb314"];

    // 本界面设置,下个界面显示
    UIBarButtonItem * backButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButtonItem;

    
    // 设置返回键的颜色
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}


#pragma mark tableviewDatasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *indentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:indentifier];
    }
    cell.textLabel.text = self.dataArr[indexPath.row][@"vcStyle"];
    cell.detailTextLabel.text = self.dataArr[indexPath.row][@"subTitle"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark tableviewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    id vc =  [[NSClassFromString(self.dataArr[indexPath.row][@"vcStyle"]) alloc] init];
    if (indexPath.row == 0) {
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
        nav.navigationBar.barTintColor = [UIColor colorWithHexString:@"fcb314"];
    }else if(indexPath.row == 1) {
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"SecondSegementStyleVC" bundle:nil];
        vc = [storyBoard instantiateInitialViewController];
    }
    
   
    [self.navigationController pushViewController:vc animated:YES];
}
@end
