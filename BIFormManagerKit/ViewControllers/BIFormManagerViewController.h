//
//  BIFormManagerViewController.h
//  BIFormManagerKit
//
//  Created by Renaud Buisine on 20/03/16.
//  Copyright © 2016 Renaud Buisine. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BIFormManagerViewController;


@interface BIFormManagerViewController : UIViewController
/**
 *  Is form valid?
 */
@property (nonatomic,readonly) BOOL formValid;

/**
 *  Force form checking
 */
- (void)checkValidity;
/**
 *  When controller is going to check controls values
 */
- (void)willCheckForm;
/**
 *  When form went valid
 */
- (void)didValidForm;
/**
 *  When form went unvalid
 */
- (void)didUnvalidForm;
/**
 *  Is provided control required for form
 *
 *  @param control        Concerned control
 */
- (BOOL)isControlRequired:(UIControl *)control;
/**
 *  Is procided control valid for form
 *
 *  @param control        Concerned control
 */
- (BOOL)isControlValid:(UIControl *)control;
/**
 *  Is form valid
 *  Used to force status by overriding it
 *
 *  @return Is form valid?
 */
- (BOOL)isFormValid;

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context;
@end
