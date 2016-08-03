//
//  UITextView+FormManager.h
//  BIFormManagerKit
//
//  Created by Renaud BUISINE on 28/07/16.
//  Copyright © 2016 Renaud Buisine. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (FormManager)

/**
 *  Is control required in a form?
 */
@property (nonatomic, assign) IBInspectable BOOL required;
/**
 *  Name of control (used to build form data dictionary)
 */
@property (nonatomic, weak) IBInspectable NSString *controlIdentifier;

/**
 *  Data of control (NSString for textfields, ...)
 */
@property (nonatomic, weak) id contentData;

/**
 *  Is data of control valid and not Nil
 *  Ex : UItextfield, is there text AND with correct format
 *
 *  @return Valid and not nil ?
 */
- (BOOL)isDataValid;
/**
 *  Is data of control valid or Nil
 *  Ex : UItextfield, is there correct format or just no text
 *
 *  @return Valid or nil ?
 */
- (BOOL)isDataValidOrNil;

/**
 *  Display control as valid
 */
- (void)setValid;
/**
 *  Display control as unvalid
 */
- (void)setUnvalid;


@end
