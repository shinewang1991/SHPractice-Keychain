//
//  ViewController.m
//  SHPractice-Keychain
//
//  Created by Shine on 31/03/2018.
//  Copyright © 2018 yixia. All rights reserved.
//

#import "ViewController.h"
#import "SAMKeychain.h"
#define kUserNameKey @"kUserNameKey"
#define kServiceKey @"Shine"

@interface ViewController ()
@property (nonatomic, weak) IBOutlet UITextField *userNameTextField;
@property (nonatomic, weak) IBOutlet UITextField *passwordTextField;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *userName = [[NSUserDefaults standardUserDefaults] objectForKey:kUserNameKey];
    self.userNameTextField.text = userName;
    
    [self getPwd:userName];
}

- (void)getPwd:(NSString *)userName{
    NSLog(@"所有账号:%@",[SAMKeychain allAccounts]);
    NSString *passWord = [SAMKeychain passwordForService:kServiceKey account:userName];
    self.passwordTextField.text = passWord;
}

- (IBAction)loginBtnClicked:(id)sender{
    NSString *userName = self.userNameTextField.text;
    NSString *passWord = self.passwordTextField.text;
    
    [[NSUserDefaults standardUserDefaults] setObject:userName forKey:kUserNameKey];
    [SAMKeychain setPassword:passWord forService:kServiceKey account:userName];
}

@end
