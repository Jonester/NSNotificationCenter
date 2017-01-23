//
//  ThirdViewController.m
//  NSNotificationCenter
//
//  Created by Chris Jones on 2017-01-22.
//  Copyright © 2017 Jonescr. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (nonatomic, readonly) CGFloat oldConstraint;

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSNotificationCenter *notifyCenter = [NSNotificationCenter defaultCenter];
    [notifyCenter addObserver:self selector:@selector(keyboardDidChange:) name:UIKeyboardDidChangeFrameNotification object:nil];
    _oldConstraint = self.bottomConstraint.constant;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)keyboardDidChange:(NSNotification*)notification {
    NSValue *value = notification.userInfo[UIKeyboardFrameEndUserInfoKey];
    CGRect rect = value.CGRectValue;
    CGFloat yPos = rect.origin.y;
    CGFloat viewHeight = self.view.bounds.size.height;
    
    
    
    if (yPos == viewHeight) {
        self.bottomConstraint.constant = self.oldConstraint;
    } else {
        self.bottomConstraint.constant = viewHeight - yPos;
    }
    NSLog(@"%f, %f",yPos, viewHeight);
}

- (IBAction)tapGesture:(UITapGestureRecognizer *)sender {
    [self.textField resignFirstResponder];
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter]removeObserver:self];
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
