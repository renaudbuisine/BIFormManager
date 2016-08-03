//
//  NSString+FormManager.m
//  BIFormManagerKit
//
//  Created by Renaud Buisine on 20/03/16.
//  Copyright © 2016 Renaud Buisine. All rights reserved.
//

#import "NSString+FormManager.h"

@implementation NSString (FormManager)

/**
 *  Is string a valid email?
 *
 *  @return Valid email format?
 */
- (BOOL)isValidEmail{
    NSString *emailRegex = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    return [self matchRegex:emailRegex];
}

/**
 *  Is string valid phone number?
 *
 *  @return Valid phone number format?
 */
- (BOOL)isValidPhoneNumber{
    NSString *phoneNumberRegex = @"^\\+?(?:[0-9] ?){6,14}[0-9]$";
    return [self matchRegex:phoneNumberRegex];
}

/**
 *  Does string match regex
 *
 *  @param regex Regex string used to check
 *
 *  @return String does match or not
 */
- (BOOL)matchRegex:(nonnull NSString *)regex{
    NSPredicate *regexTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [regexTest evaluateWithObject:self];
}

@end
