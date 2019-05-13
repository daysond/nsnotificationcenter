//
//  FourthViewController.m
//  NSNotificationCenter
//
//  Created by Dayson Dong on 2019-05-12.
//  Copyright © 2019 Dayson Dong. All rights reserved.
//

#import "FourthViewController.h"
#import "CustomeView.h"

@interface FourthViewController ()
@property (weak, nonatomic) IBOutlet UIView *whiteView;
@property (weak, nonatomic) IBOutlet CustomeView *blackView;

@end

@implementation FourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.blackView addObserver:self forKeyPath:@"point" options:(NSKeyValueObservingOptionNew) context:nil];
    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    if (object == self.blackView && [keyPath isEqualToString:@"point"]) {
        CGPoint translation = [change[@"new"] CGPointValue];
        CGPoint newCenter = CGPointMake(self.whiteView.center.x + translation.x, self.whiteView.center.y + translation.y);
        self.whiteView.center = newCenter;
        
    }
    
}



@end
