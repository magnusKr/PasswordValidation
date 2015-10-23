//
//  ViewController.m
//  PasswordValidation
//
//  Created by Magnus Kraepelien on 23/10/15.
//  Copyright © 2015 Magnus Kraepelien. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)vaidateButton:(id)sender {
    
    Validation *validationObject = [[Validation alloc]init];
    
    [validationObject passwordValidate:self.passwordField.text];
    
    if(validationObject.validation)
    {
        self.messageBox.text = validationObject.validationMessage;
    
    }
    else
    {
        self.messageBox.text = validationObject.validationMessage;
        self.passwordField.text = @"";
    }
    
    
}
@end
