//
//  FirstViewController.m
//  NSNotificationCenter
//
//  Created by Chris Jones on 2017-01-21.
//  Copyright © 2017 Jonescr. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@property (nonatomic) NSDictionary *stepperDict;
@property (weak, nonatomic) IBOutlet UIStepper *stepper;

@end

@implementation FirstViewController

-(void)viewDidDisappear:(BOOL)animated {
    
    self.stepperDict = @{@"Stepper Notification": @(self.stepper.value)};
    
    NSNotificationCenter *nsNotificationCenter = [NSNotificationCenter defaultCenter];
    NSNotification *notification = [[NSNotification alloc]initWithName:@"Stepper Notify" object:self userInfo:self.stepperDict];
    [nsNotificationCenter postNotification:notification];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)stepper:(UIStepper *)sender {
    
    
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
