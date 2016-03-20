//
//  UIControl+Extended.h
//  BIFormManagerKit
//
//  Created by Renaud Buisine on 20/03/16.
//  Copyright © 2016 Renaud Buisine. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (FormManager)

/**
 *  Is control required in a form?
 *
 *  @return Is control required?
 */
- (BOOL)isRequired;

/**
 *  Is current control filled for form
 *  Examples :
 *      TextField => is there a text inside?
 *      ...
 *
 *  @return Is current control filled?
 */
- (BOOL)isControlFilled;

/**
 *  Add observer on key value of control
 *
 *  @param observer Observer object
 *  @param context  Context
 */
- (void)addObserver:(NSObject *)observer context:(void *)context;
/**
 *  Add key target on control
 *
 *  @param target Target object
 *  @param action Selector to call
 */
- (void)addTarget:(NSObject *)target action:(nonnull SEL)action;

@end
