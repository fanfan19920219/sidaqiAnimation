//
//  revolView.m
//  sidaqi
//
//  Created by M-SJ077 on 2016/10/17.
//  Copyright © 2016年 zhangzhihua. All rights reserved.
//

#import "revolView.h"


#define ANIMATIONVIEW_SIZE 15.f
#define SELF_SIZE  self.frame.size.width
#define CONTRACT_R (SELF_SIZE/2)/1.4142
#define ANIMATION_DURATION 0.3f
@interface revolView ()


@property (nonatomic , strong)UIView *animationView1;

@property (nonatomic , strong)UIView *animationView2;

@property (nonatomic , strong)UIView *animationView3;

@property (nonatomic , strong)UIView *animationView4;

@end


@implementation revolView

revolView *selfView;
-(instancetype)initWithFrame:(CGRect)frame{
    if(selfView==nil){
        selfView = [super initWithFrame:frame];
    }
    [self create_View];
    return selfView;
}

-(void)create_View{
    self.animationView1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ANIMATIONVIEW_SIZE, ANIMATIONVIEW_SIZE)];
    self.animationView1.layer.cornerRadius = ANIMATIONVIEW_SIZE/2;
    self.animationView1.backgroundColor = [UIColor redColor];
    
    self.animationView2 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ANIMATIONVIEW_SIZE, ANIMATIONVIEW_SIZE)];
    self.animationView2.layer.cornerRadius = ANIMATIONVIEW_SIZE/2;
    self.animationView2.backgroundColor = [UIColor redColor];
    
    self.animationView3 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ANIMATIONVIEW_SIZE, ANIMATIONVIEW_SIZE)];
    self.animationView3.layer.cornerRadius = ANIMATIONVIEW_SIZE/2;
    self.animationView3.backgroundColor = [UIColor redColor];
    
    self.animationView4 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ANIMATIONVIEW_SIZE, ANIMATIONVIEW_SIZE)];
    self.animationView4.layer.cornerRadius = ANIMATIONVIEW_SIZE/2;
    self.animationView4.backgroundColor = [UIColor redColor];
    
    // 设置初始坐标
    self.animationView1.center = CGPointMake(ANIMATIONVIEW_SIZE/2, ANIMATIONVIEW_SIZE/2);
    self.animationView1.tag = 0;
    self.animationView2.center = CGPointMake(SELF_SIZE -ANIMATIONVIEW_SIZE/2, ANIMATIONVIEW_SIZE/2);
    self.animationView2.tag = 1;
    self.animationView3.center = CGPointMake(SELF_SIZE -ANIMATIONVIEW_SIZE/2, SELF_SIZE -ANIMATIONVIEW_SIZE/2);
    self.animationView3.tag = 3;
    self.animationView4.center = CGPointMake(ANIMATIONVIEW_SIZE/2 , SELF_SIZE -ANIMATIONVIEW_SIZE/2);
    self.animationView4.tag = 2;
    
    [self addSubview:self.animationView1];
    [self addSubview:self.animationView2];
    [self addSubview:self.animationView3];
    [self addSubview:self.animationView4];
}

-(void)contractAnimation:(UIView*)aniamtionView{
    NSValue *defaultValue;
    NSValue *toValue;
    NSString *animationString = @"position";
    
    defaultValue = [NSValue valueWithCGPoint:CGPointMake(aniamtionView.center.x , aniamtionView.center.y)];
//    toValue =[NSValue valueWithCGPoint:CGPointMake((SELF_SIZE/2)+(SELF_SIZE/4)*(int)pow(-1, aniamtionView.tag) , (SELF_SIZE/2)-(SELF_SIZE/4)*(int)pow(-1, aniamtionView.tag+1))];
    
    switch (aniamtionView.tag) {
            //(int)pow(2, 3)
        case 0:
            toValue = [NSValue valueWithCGPoint:CGPointMake((SELF_SIZE/2)-(SELF_SIZE/4) , (SELF_SIZE/2)-(SELF_SIZE/4))];
            break;
            
        case 1:
            toValue = [NSValue valueWithCGPoint:CGPointMake((SELF_SIZE/2)+(SELF_SIZE/4) , (SELF_SIZE/2)-(SELF_SIZE/4))];
            break;
            
        case 2:
            toValue = [NSValue valueWithCGPoint:CGPointMake((SELF_SIZE/2)-(SELF_SIZE/4) , (SELF_SIZE/2)+(SELF_SIZE/4))];
            
            break;
            
        case 3:
            toValue = [NSValue valueWithCGPoint:CGPointMake((SELF_SIZE/2)+(SELF_SIZE/4) , (SELF_SIZE/2)+(SELF_SIZE/4))];
            break;
            
            
        default:
            break;
    }
    
    CAKeyframeAnimation* keyframeAnimation = [CAKeyframeAnimation animationWithKeyPath:animationString];
    keyframeAnimation.values = @[defaultValue,toValue,defaultValue];
    keyframeAnimation.keyTimes = @[[NSNumber numberWithFloat:0.0f], [NSNumber numberWithFloat:0.5f], [NSNumber numberWithFloat:1]];
    keyframeAnimation.removedOnCompletion = true;
    keyframeAnimation.duration = ANIMATION_DURATION;
    
    [aniamtionView.layer addAnimation:keyframeAnimation forKey:@""];
    
}


-(void)rotatView{
    
    //旋转动画
    self.layer.anchorPoint = CGPointMake(0.5, 0.5);
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = @(M_PI *0.5);
    rotationAnimation.removedOnCompletion = true;
    rotationAnimation.duration = ANIMATION_DURATION;
    //animationGroup.fillMode = kCAFillModeForwards;
    [self.layer addAnimation:rotationAnimation forKey:nil];

}

-(void)addAnimation{
    [self contractAnimation:self.animationView1];
    [self contractAnimation:self.animationView2];
    [self contractAnimation:self.animationView3];
    [self contractAnimation:self.animationView4];
    [self rotatView];
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
