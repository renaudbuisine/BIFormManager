//
//  UIButton+FormManager.m
//  BIFormManagerKit
//
//  Created by Renaud Buisine on 21/03/16.
//  Copyright © 2016 Renaud Buisine. All rights reserved.
//

#import "UIButton+FormManager.h"
#import "UIControl+FormManager.h"

@implementation UIButton (FormManager)

/**
 *  Override because a button cannot be required
 *
 *  @param required required value
 */
- (void)setRequired:(BOOL)required{
}

/**
 *  Override to return always NO
 *
 *  @return NO
 */
- (BOOL)required{
    return NO;
}

@end
