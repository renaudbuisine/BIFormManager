//
//  UIView+Extended.h
//  BIFormManagerKit
//
//  Created by Renaud Buisine on 20/03/16.
//  Copyright © 2016 Renaud Buisine. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (FormManager)

/**
 *  Find all subviews of provided kind
 *
 *  @param aClass    Kind of subviews we're looking for
 *  @param recursive Is research recursive ?
 *
 *  @return List of subviews with matching kind
 */
- (NSArray *)viewsKindOfClass:(Class)aClass recursively:(BOOL)recursive;

@end
