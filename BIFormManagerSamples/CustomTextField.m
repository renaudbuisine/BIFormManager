//
//  CustomTextField.m
//  BIFormManagerKit
//
//  Created by Renaud BUISINE on 27/07/16.
//  Copyright © 2016 Renaud Buisine. All rights reserved.
//

#import "CustomTextField.h"
#import "UIControl+FormManager.h"

@interface CustomTextField(){
    UIColor *_defaultColor;
}

@end

@implementation CustomTextField

- (void)setValid{
    self.textColor = _defaultColor;
    self.layer.borderColor =[[UIColor whiteColor]CGColor];
}

- (void)setUnvalid{
    _defaultColor = self.textColor;
    self.textColor = [UIColor redColor];
    self.layer.borderColor =[[UIColor redColor]CGColor];
}

@end
