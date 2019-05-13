//
//  CustomeView.m
//  NSNotificationCenter
//
//  Created by Dayson Dong on 2019-05-12.
//  Copyright © 2019 Dayson Dong. All rights reserved.
//

#import "CustomeView.h"

@implementation CustomeView

-(instancetype)initWithFrame:(CGRect)frame {
    
    if ([super initWithFrame:frame]) {
        [self setupGestureRecognizer];
    }
    
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    if ([super initWithCoder:aDecoder]) {
        [self setupGestureRecognizer];
    }
    return self;
}

-(void)setupGestureRecognizer{
    UIPanGestureRecognizer *recog = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(move:)];
    [self addGestureRecognizer:recog];
}

-(void)move: (UIPanGestureRecognizer*) sender {
    
    CGPoint translation = [sender translationInView:sender.view];
    self.point = translation;
    [sender setTranslation:CGPointZero inView:sender.view];

}

@end
