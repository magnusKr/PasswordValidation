//
//  Validation.h
//  PasswordValidation
//
//  Created by Magnus Kraepelien on 23/10/15.
//  Copyright © 2015 Magnus Kraepelien. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Validation : NSObject

@property (nonatomic,strong)NSString* passwordString;

@property BOOL validation;
@property (nonatomic,strong)NSString* validationMessage;

-(Validation*)passwordValidate :(NSString*)userPassword;

-(BOOL)readBlackList:(NSString*)password;


@end
