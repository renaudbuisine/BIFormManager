//
//  UISwitch+FormManager.m
//  BIFormManagerKit
//
//  Created by Renaud Buisine on 21/03/16.
//  Copyright © 2016 Renaud Buisine. All rights reserved.
//

#import "UISwitch+FormManager.h"

@implementation UISwitch (FormManager)


/**
 *  Add key target on control
 *
 *  @param target Target object
 *  @param action Selector to call
 */
- (void)addTarget:(NSObject *)target action:(nonnull SEL)action{
    [self addTarget:target action:action forControlEvents:UIControlEventValueChanged];
}

@end
