//
//  UIStepper+FormManager.m
//  BIFormManagerKit
//
//  Created by Renaud BUISINE on 28/07/16.
//  Copyright © 2016 Renaud Buisine. All rights reserved.
//

#import "UIStepper+FormManager.h"

@implementation UIStepper (FormManager)

/**
 *  Is data of control valid and not Nil
 *  Ex : UItextfield, is there text AND with correct format
 *
 *  @return Valid and not nil ?
 */
- (BOOL)isDataValid{
    // if switch is required, must be turned on
    return YES;
}
/**
 *  Get data object from control
 *
 *  @return Data object (String, number,...)
 */
- (id)contentData{
    return @(self.value);
}

/**
 *  Set data into control object
 *
 *  @param data Data to insert
 */
- (void)setContentData:(id)data{
    if([data isKindOfClass:NSNumber.class]){
        self.value = [data doubleValue];
    }
    else{
        LOG_WARNING(@"Expected data of kind NSNumber!");
    }
}


@end
