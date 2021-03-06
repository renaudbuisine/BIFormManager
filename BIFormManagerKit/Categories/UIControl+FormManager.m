//
//  UIControl+Extended.m
//  BIFormManagerKit
//
//  Created by Renaud Buisine on 20/03/16.
//  Copyright © 2016 Renaud Buisine. All rights reserved.
//

#import "UIControl+FormManager.h"
#import <objc/runtime.h>

@implementation UIControl (FormManager)

static char UIControl_requiredPropertyKey;
static char UIControl_controlIdentifierPropertyKey;

- (BOOL)required{
    NSNumber *required = objc_getAssociatedObject(self, &UIControl_requiredPropertyKey);
    return [required boolValue];
}

- (void)setRequired:(BOOL)required{
    objc_setAssociatedObject(self, &UIControl_requiredPropertyKey, @(required), OBJC_ASSOCIATION_ASSIGN);
}

- (NSString *)controlIdentifier{
    return objc_getAssociatedObject(self, &UIControl_controlIdentifierPropertyKey);
}

- (void)setControlIdentifier:(NSString *)controlIdentifier{
    objc_setAssociatedObject(self, &UIControl_controlIdentifierPropertyKey, controlIdentifier, OBJC_ASSOCIATION_RETAIN);
}

/**
 *  Is data of control valid and not Nil
 *  Ex : UItextfield, is there text AND with correct format
 *
 *  @return Valid and not nil ?
 */
- (BOOL)isDataValid{
    // default
    return NO;
}
/**
 *  Is data of control valid or Nil
 *  Ex : UItextfield, is there correct format or just no text
 *
 *  @return Valid or nil ?
 */
- (BOOL)isDataValidOrNil{
    // detault
    return !self.contentData || [self isDataValid];
}


/**
 *  Display control as valid
 */
- (void)setValid{
    // do nothing
}
/**
 *  Display control as unvalid
 */
- (void)setUnvalid{
    // do nothing
}

/**
 *  Get data object from control
 *
 *  @return Data object (String, number,...)
 */
- (id)contentData{
    // default
    return nil;
}
/**
 *  Set data into control object
 *
 *  @param data Data to insert
 */
- (void)setContentData:(id)data{
    // do nothing
}

/**
 *  Event to test to trigger control's value changed
 */
- (UIControlEvents)valueChangedEvent{
    return UIControlEventValueChanged;
}

@end
