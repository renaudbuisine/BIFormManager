//
//  UIControl+Extended.h
//  BIFormManagerKit
//
//  Created by Renaud Buisine on 20/03/16.
//  Copyright © 2016 Renaud Buisine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BIFormManagerLogging.h"

@interface UIControl (FormManager)

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
 *  Event to test to trigger control's value changed
 */
@property (nonatomic, assign, readonly) UIControlEvents valueChangedEvent;


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
