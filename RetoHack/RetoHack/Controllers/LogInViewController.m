//
//  LogInViewController.m
//  RetoHack
//
//  Created by Alejandro Hernandez on 25/08/19.
//  Copyright © 2019 Alejandro Hernandez. All rights reserved.
//

#import "LogInViewController.h"
@import LocalAuthentication;
@interface LogInViewController ()
@property (strong, nonatomic) LAContext *context;

@end

@implementation LogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.context = [[LAContext alloc] init];
    [self.context setLocalizedCancelTitle:@"Enter mail and password"];
      NSError *error = [[NSError alloc] init];
    [self.context canEvaluatePolicy:kLAPolicyDeviceOwnerAuthentication error:&error];
    // Do any additional setup after loading the view.
}

-(IBAction)touchIDLogIn:(id)sender {
    [self.context evaluatePolicy:kLAPolicyDeviceOwnerAuthentication localizedReason:@"Log into your account" reply:^(BOOL success, NSError * _Nullable error) {
        if(success){
            [self performSegueWithIdentifier:@"logIn" sender:self];
            
        }  }];
    
    [[NSUserDefaults standardUserDefaults] setObject:@"12345" forKey:@"mail"];
    [[NSUserDefaults standardUserDefaults] synchronize];
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
