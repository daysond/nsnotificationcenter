//
//  ThirdViewController.m
//  NSNotificationCenter
//
//  Created by Dayson Dong on 2019-05-12.
//  Copyright © 2019 Dayson Dong. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (nonatomic) CGFloat oldConstraint;


@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateFrame:) name:@"UIKeyboardWillChangeFrameNotification" object:nil];
    self.oldConstraint = self.bottomConstraint.constant;
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)updateFrame: (NSNotification*) notification {
 
    NSLog(@"%@",notification.userInfo);
    CGRect rect = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    if (rect.origin.y == self.view.bounds.size.height) {
        self.bottomConstraint .constant = self.oldConstraint;
    } else {
        self.bottomConstraint.constant = self.view.bounds.size.height - rect.origin.y;
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
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
