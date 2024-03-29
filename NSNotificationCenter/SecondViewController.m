//
//  SecondViewController.m
//  NSNotificationCenter
//
//  Created by Dayson Dong on 2019-05-12.
//  Copyright © 2019 Dayson Dong. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UILabel *countLabel;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:NO];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateLabel:) name:@"stepperValueDidChange" object:nil];
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)updateLabel:(NSNotification*) notification {
    
    self.countLabel.text =[NSString stringWithFormat:@"%ld",[notification.userInfo[@"stepperValue"] integerValue]];
}


@end
