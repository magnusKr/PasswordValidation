//
//  ViewController.h
//  PasswordValidation
//
//  Created by Magnus Kraepelien on 23/10/15.
//  Copyright © 2015 Magnus Kraepelien. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Validation.h"

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *passwordField;

- (IBAction)vaidateButton:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *messageBox;

@end

