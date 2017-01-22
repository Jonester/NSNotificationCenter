//
//  SecondViewController.m
//  NSNotificationCenter
//
//  Created by Chris Jones on 2017-01-21.
//  Copyright © 2017 Jonescr. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UILabel *stepperValueLabel;

@end

@implementation SecondViewController

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidLoad {
    
    [super viewDidLoad];
    NSNotificationCenter *nsNotificationCenter = [NSNotificationCenter defaultCenter];
    [nsNotificationCenter addObserver:self selector:@selector(incrementCounter:) name:@"Stepper Notify" object:nil];
}

- (void)incrementCounter:(NSNotification *)notification {
    
    NSDictionary *stepperDict = notification.userInfo;
    NSNumber *stepperValue = stepperDict[@"Stepper Notification"];
    self.stepperValueLabel.text = [NSString stringWithFormat:@"%@", stepperValue];
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
