//
//  JFViewController.m
//  iOS Challenge #1 - Sample Interview Challenge
//
//  Created by Joel Fischer on 07/08/14.
//  Copyright (c) 2014 Joel Fischer. All rights reserved.
//

#import "JFViewController.h"
#import "NSString+JFNSStringTest.h"
#import "JFAnotherViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface JFViewController ( )
@property (weak, nonatomic) IBOutlet UITextField *passwordTextfield;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextfield;
@property (weak, nonatomic) IBOutlet UIButton *signinButton;

@property BOOL usernameTextFieldisOk;
@property BOOL passwordTextFieldisOK;

@end

@implementation JFViewController

- (void)viewWillAppear:(BOOL)animated {
        
        [super viewWillAppear];

        self.passwordTextfield.text = @"";
        self.usernameTextfield.text = @"";
        
        [self changeColorOfUITextField:self.usernameTextfield toColor:[UIColor grayColor]];
        [self changeColorOfUITextField:self.passwordTextfield toColor:[UIColor grayColor]];
}

- (void)viewDidLoad {
        
        [super viewDidLoad];
        // Do any additional setup after loading the view, typically from a nib.

        self.passwordTextfield.delegate = self;
        self.usernameTextfield.delegate = self;
        
}

- (void)didReceiveMemoryWarning {
        
        [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
        
}

- (IBAction)signinButtonWasPressed:(id)sender {

        [self.view endEditing:YES];

        if (self.usernameTextFieldisOk && self.passwordTextFieldisOK) {

                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];

                JFAnotherViewController *viewController = (JFAnotherViewController *)
                        [storyboard instantiateViewControllerWithIdentifier:@"JFAnotherViewController"];

                [self.navigationController pushViewController:viewController animated:YES];
        } else {

                if (self.usernameTextFieldisOk == NO) {

                        UIAlertView *alert = [[UIAlertView alloc]
                                    initWithTitle:@"Username"
                                          message:@"Your username contains less than 8 or non alphabetic characters"
                                         delegate:self
                                cancelButtonTitle:@"ok"
                                otherButtonTitles:nil];

                        alert.tag = 1;
                        [alert show];

                        return;
                }

                if (self.passwordTextFieldisOK == NO) {

                        UIAlertView *alert =
                                [[UIAlertView alloc] initWithTitle:@"Password"
                                                           message:@"Your password is less than 8 characters long."
                                                          delegate:self
                                                 cancelButtonTitle:@"ok"
                                                 otherButtonTitles:nil];

                        alert.tag = 2;
                        [alert show];
                }
        }
}

- (BOOL)textField:(UITextField *)textField
        shouldChangeCharactersInRange:(NSRange)range
                    replacementString:(NSString *)string {
        
        [self checkTextField:textField];

        return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {

        NSLog(@"Textfield should return");

        [textField resignFirstResponder];

        if (textField == self.usernameTextfield) {

                [self.passwordTextfield becomeFirstResponder];

                return NO;
        }

        return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {

        NSLog(@"DidEndEditing");

        [self checkTextField:textField];
}

- (void)checkTextField:(UITextField *)textField {

        UIColor *color1 = [UIColor colorWithRed:76 / 255.0f green:217 / 255.0f blue:100 / 255.0f alpha:1.0f];
        UIColor *color2 = [UIColor colorWithRed:255 / 255.0f green:58 / 255.0f blue:45 / 255.0f alpha:1.0f];

        if (textField == self.usernameTextfield) {

                NSLog(@"%@", textField.text);

                if ([textField.text isAlphaNumeric] && [textField.text isAtLeastEightCharactersLong]) {

                        [self changeColorOfUITextField:textField toColor:color1];

                        self.usernameTextFieldisOk = YES;

                } else {

                        [self changeColorOfUITextField:textField toColor:color2];

                        self.usernameTextFieldisOk = NO;
                }
        }

        if (textField == self.passwordTextfield) {

                if ([textField.text isAtLeastEightCharactersLong]) {

                        [self changeColorOfUITextField:textField toColor:color1];

                        self.passwordTextFieldisOK = YES;

                } else {

                        [self changeColorOfUITextField:textField toColor:color2];

                        self.passwordTextFieldisOK = NO;
                }
        }
}

- (void)changeColorOfUITextField:(UITextField *)textField toColor:(UIColor *)color {

        textField.layer.cornerRadius = 8.0f;
        textField.layer.masksToBounds = YES;
        textField.layer.borderColor = [color CGColor];
        textField.layer.borderWidth = 1.0f;
}

@end
