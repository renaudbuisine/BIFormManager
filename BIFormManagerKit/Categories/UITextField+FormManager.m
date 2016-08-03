//
//  UITextField+FormManager.m
//  BIFormManagerKit
//
//  Created by Renaud Buisine on 20/03/16.
//  Copyright © 2016 Renaud Buisine. All rights reserved.
//

#import "UITextField+FormManager.h"
#import "UIControl+FormManager.h"
#import "NSString+FormManager.h"

@implementation UITextField (FormManager)

/**
 *  Is data of control valid and not Nil
 *  Ex : UItextfield, is there text AND with correct format
 *
 *  @return Valid and not nil ?
 */
- (BOOL)isDataValid{
    NSString *content = self.contentData;
    if(content){
        if(self.keyboardType == UIKeyboardTypePhonePad){
            return [content isValidPhoneNumber];
        }
        else if(self.keyboardType == UIKeyboardTypeEmailAddress){
            return [content isValidEmail];
        }
        return YES;
    }
    return NO;
}

/**
 *  Get data object from control
 *
 *  @return Data object (String, number,...)
 */
- (id)contentData{
    if(self.text && self.text.length){
        return self.text;
    }
    return nil;
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
        LOG_WARNING(@"Expected data of kind NSString!");
    }
}

#pragma mark EVENTS


/**
 *  Event to test to trigger control's value changed
 */
- (UIControlEvents)valueChangedEvent{
    return UIControlEventEditingChanged;
}

@end
