//
//  NSString+FormManager.h
//  BIFormManagerKit
//
//  Created by Renaud Buisine on 20/03/16.
//  Copyright © 2016 Renaud Buisine. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (FormManager)

/**
 *  Is string a valid email?
 *
 *  @return Valid email format?
 */
- (BOOL) isValidEmail;
/**
 *  Is string valid phone number?
 *
 *  @return Valid phone number format?
 */
- (BOOL)isValidPhoneNumber;
/**
 *  Does string match regex
 *
 *  @param regex Regex string used to check
 *
 *  @return String does match or not
 */
- (BOOL)matchRegex:(nonnull NSString *)regex;

@end
