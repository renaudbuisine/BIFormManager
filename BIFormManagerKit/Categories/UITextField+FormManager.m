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
 *  Add key target on control
 *
 *  @param target Target object
 *  @param action Selector to call
 */
- (void)addTarget:(NSObject *)target action:(nonnull SEL)action{
    // do nothing
    [self addTarget:target action:action forControlEvents:UIControlEventEditingChanged];
}

/**
 *  Is current control filled for form
 *  Examples :
 *      TextField => is there a text inside?
 *      ...
 *
 *  @return Is current control filled?
 */
- (BOOL)isControlFilled{
    if([self.text length] == 0){
        return NO;
    }
    // is email keyboard, lets check format of text
    if(self.keyboardType == UIKeyboardTypeEmailAddress){
        return [self.text isValidEmail];
    }
    return YES;
}

@end
