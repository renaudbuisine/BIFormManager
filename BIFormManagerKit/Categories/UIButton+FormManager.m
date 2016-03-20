//
//  UIButton+FormManager.m
//  BIFormManagerKit
//
//  Created by Renaud Buisine on 21/03/16.
//  Copyright © 2016 Renaud Buisine. All rights reserved.
//

#import "UIButton+FormManager.h"

@implementation UIButton (FormManager)

/**
 *  Add key target on control
 *
 *  @param target Target object
 *  @param action Selector to call
 */
- (void)addTarget:(NSObject *)target action:(nonnull SEL)action{
    [self addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}

@end
