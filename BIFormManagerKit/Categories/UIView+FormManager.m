//
//  UIView+Extended.m
//  BIFormManagerKit
//
//  Created by Renaud Buisine on 20/03/16.
//  Copyright © 2016 Renaud Buisine. All rights reserved.
//

#import "UIView+FormManager.h"

@implementation UIView (FormManager)

/**
 *  Find all subviews of provided kind
 *
 *  @param aClass    Kind of subviews we're looking for
 *  @param recursive Is research recursive ?
 *
 *  @return List of subviews with matching kind
 */
- (nonnull NSArray *)viewsKindOfClass:(Class)aClass recursively:(BOOL)recursive{
    NSMutableArray * subviews = [[NSMutableArray alloc] init];
    for(UIView *sv in self.subviews){
        if([sv isKindOfClass:aClass]){
            [subviews addObject:sv];
        }
        else if(recursive){
            [subviews addObjectsFromArray:[sv viewsKindOfClass:aClass recursively:recursive]];
        }
    }
    return subviews;
}


@end