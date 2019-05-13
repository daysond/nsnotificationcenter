//
//  FirstViewController.m
//  NSNotificationCenter
//
//  Created by Dayson Dong on 2019-05-12.
//  Copyright © 2019 Dayson Dong. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UIStepper *stepper;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)stepperTapped:(UIStepper *)sender {
    
    NSLog(@"stepper up");
    NSDictionary *userInfo = @{@"stepperValue": [NSNumber numberWithDouble: _stepper.value]};
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"stepperValueDidChange" object:self userInfo:userInfo];
    
}




@end
