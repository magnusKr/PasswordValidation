//
//  Validation.m
//  PasswordValidation
//
//  Created by Magnus Kraepelien on 23/10/15.
//  Copyright © 2015 Magnus Kraepelien. All rights reserved.
//

#import "Validation.h"

@implementation Validation


-(Validation*)passwordValidate :(NSString*)userPassword
{
    NSCharacterSet* symbols = [NSCharacterSet characterSetWithCharactersInString:@"#@$%&!"];
    
    NSRange rang;
    
    
    if([userPassword length]<8 || [userPassword length]>16)
    {
        self.validation = false;
        self.validationMessage = @"Password must be betwwen 8-16 char";
        return self;
        
    }
    
    rang = [userPassword rangeOfCharacterFromSet:[NSCharacterSet decimalDigitCharacterSet]];
    if(!rang.length)
    {
        self.validation = false;
        self.validationMessage = @"Password must have at least one number";
        return self;
    
    }
    
    rang = [userPassword rangeOfCharacterFromSet:symbols];
    if(!rang.length)
    {
        self.validation = false;
        self.validationMessage = @"Password must have at least one symbol out of #,@,$,%,&, !";
        return self;
    }
    
    rang = [userPassword rangeOfCharacterFromSet:[NSCharacterSet whitespaceCharacterSet]];
    if(rang.length)
    {
        self.validation = false;
        self.validationMessage = @"Password must not have a space";
        return self;
    }
    
    NSString* firstChar=[userPassword substringToIndex:1];
    rang = [firstChar rangeOfCharacterFromSet:[NSCharacterSet letterCharacterSet]];
    if(!rang.length)
    {
        self.validation = false;
        self.validationMessage = @"Password must begin with an alphabet";
        return self;
    }
    
    rang = [userPassword rangeOfCharacterFromSet:[NSCharacterSet lowercaseLetterCharacterSet]];
    if(!rang.length)
    {
        self.validation = false;
        self.validationMessage = @"Password must have at least one lowercase letter";
        return self;
    }
    
    rang = [userPassword rangeOfCharacterFromSet:[NSCharacterSet uppercaseLetterCharacterSet]];
    if(!rang.length)
    {
        self.validation = false;
        self.validationMessage = @"Password must have at least one uppercase letter";
        return self;
    }

    if ([self readBlackList:userPassword])
    {
        self.validation = false;
        self.validationMessage = @"Banned word";
        return self;
    }
    
    
    if ([self repeatingCheck:userPassword])
    {
        self.validation = false;
        self.validationMessage = @"Password must not have any repeating characters";
        return self;
    }

    
    else
    {
        self.validation = true;
        self.validationMessage = @"Password ok!";
        return self;
    
    }
  


}

-(BOOL)readBlackList:(NSString*)password
{
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"blacklist" ofType:@"txt"];
    NSString *stringContent = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    
    NSArray *items = [stringContent componentsSeparatedByString:@"\n"];
    
    for(int i=0; i< [items count]; i++)
    {
        if([password isEqualToString: [items objectAtIndex:i]])
        {
            return true;
        }
    
    }
    
    return false;
}

-(BOOL)repeatingCheck:(NSString*)password
{

    for(int i=0; i< (password.length-1) ; i++)
    {
        if([password characterAtIndex:i] == [password characterAtIndex:i+1])
        {
            return true;
        }
        
    }
    
    return false;
}

@end
