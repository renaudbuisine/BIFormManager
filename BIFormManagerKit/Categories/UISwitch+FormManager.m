//
//  UISwitch+FormManager.m
//  BIFormManagerKit
//
//  Created by Renaud Buisine on 21/03/16.
//  Copyright © 2016 Renaud Buisine. All rights reserved.
//

#import "UISwitch+FormManager.h"
#import "UIControl+FormManager.h"
#import "BIFormManagerLogging.h"

@implementation UISwitch (FormManager)

/**
 *  Is data of control valid and not Nil
 *  Ex : UItextfield, is there text AND with correct format
 *
 *  @return Valid and not nil ?
 */
- (BOOL)isDataValid{
    // if switch is required, must be turned on
    return self.on;
}
/**
 *  Get data object from control
 *
 *  @return Data object (String, number,...)
 */
- (id)contentData{
    return @(self.on);
}

/**
 *  Set data into control object
 *
 *  @param data Data to insert
 */
- (void)setContentData:(id)data{
    if([data isKindOfClass:NSNumber.class]){
        self.on = [data boolValue];
    }
    else{
        LOG_WARNING(@"Expected data of kind NSNumber!");
    }
}

@end
