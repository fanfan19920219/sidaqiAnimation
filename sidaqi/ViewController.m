//
//  ViewController.m
//  sidaqi
//
//  Created by M-SJ077 on 2016/10/17.
//  Copyright © 2016年 zhangzhihua. All rights reserved.
//

#import "ViewController.h"
#import "revolView.h"

@interface ViewController (){
    revolView *roView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
     roView= [[revolView alloc]initWithFrame:CGRectMake(100, 100, 40, 40)];
    roView.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    //roView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:roView];
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 20)];
    titleLabel.text = @"点击旋转";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2+40);
    [self.view addSubview:titleLabel];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [roView addAnimation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
