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
 *  Array to stack all required fields in view of current form
 */
@property (nonatomic, strong, readonly) NSSet *_Nullable requiredControls;
/**
 *  Array of all optional fields
 */
@property (nonatomic, strong, readonly) NSSet *_Nullable optionalControls;
/**
 *  All fields of form
 */
@property (nonatomic, weak, readonly) NSSet *_Nullable formControls;
/**
 *  List of fields whose content is unvalid
 */
@property (nonatomic, weak, readonly) NSSet *_Nullable unvalidControls;

/**
 *  When specific control went unvalid
 *
 *  @param control Concerned control
 */
- (void)controlFailedValidating:(nonnull id)control;
/**
 *  When specific control went valid
 *
 *  @param control Concerned control
 */
- (void)controlSucceededValidating:(nonnull id)control;
/**
 *  When form went valid
 */
- (void)succeededValidating;
/**
 *  When form went unvalid
 */
- (void)failedValidating;
/**
 *  Is provided control required for form
 *
 *  @param control        Concerned control
 */
- (BOOL)isControlRequired:(nonnull id)control;
/**
 *  Is procided control valid for form
 *
 *  @param control        Concerned control
 */
- (BOOL)isControlValid:(nonnull id)control;
/**
 *  Called to indicate if form should be submitted even if fields are correct (use for additional tests)
 *
 *  @return Should or not
 */
- (BOOL)shouldSubmitForm;
/**
 *  When form is going to be submitted
 */
- (void)willSubmitForm;
/**
 *  Called to apply necessary action for form submission
 */
- (void)submitForm;
/**
 *  After form is submitted
 */
- (void)didSubmitForm;
/**
 *  Try submit form (does not considere valid information of controls)
 */
- (void)trySubmit;
/**
 *  Submit  (does not considere valid information of controls)
 */
- (void)forceSubmit;
/**
 *  Build dictionary based on controls of form
 *
 *  @return Form key/value dictionary
 */
- (nonnull NSDictionary *)dictionaryFromForm;
/**
 *  Update form contents from data in dictionary
 *
 *  @param formDictionary Dictionary with content
 */
- (void)updateWithDictionary:(nonnull NSDictionary *)formDictionary;

@end
