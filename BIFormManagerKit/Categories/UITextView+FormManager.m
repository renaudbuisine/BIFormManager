//
//  UITextView+FormManager.m
//  BIFormManagerKit
//
//  Created by Renaud BUISINE on 28/07/16.
//  Copyright © 2016 Renaud Buisine. All rights reserved.
//

#import "UITextView+FormManager.h"
#import <objc/runtime.h>
#import "BIFormManagerLogging.h"

@implementation UITextView (FormManager)

static char UITextView_requiredPropertyKey;
static char UITextView_controlIdentifierPropertyKey;

- (BOOL)required{
    NSNumber *required = objc_getAssociatedObject(self, &UITextView_requiredPropertyKey);
    return [required boolValue];
}

- (void)setRequired:(BOOL)required{
    objc_setAssociatedObject(self, &UITextView_requiredPropertyKey, @(required), OBJC_ASSOCIATION_ASSIGN);
}

- (NSString *)controlIdentifier{
    return objc_getAssociatedObject(self, &UITextView_controlIdentifierPropertyKey);
}

- (void)setControlIdentifier:(NSString *)controlIdentifier{
    objc_setAssociatedObject(self, &UITextView_controlIdentifierPropertyKey, controlIdentifier, OBJC_ASSOCIATION_RETAIN);
}

/**
 *  Is data of control valid and not Nil
 *  Ex : UItextfield, is there text AND with correct format
 *
 *  @return Valid and not nil ?
 */
- (BOOL)isDataValid{
    // default
    return self.contentData;
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
    return self.text;
}
/**
 *  Set data into control object
 *
 *  @param data Data to insert
 */
- (void)setContentData:(id)data{
    if([data isKindOfClass:NSString.class]){
        self.text = data;
    }
    else{
        self.text = nil;
        LOG_WARNING(@"Expected data of kind NSString!");
    }
}

@end
