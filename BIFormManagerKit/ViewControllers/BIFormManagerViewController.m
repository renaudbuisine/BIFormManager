//
//  BIFormManagerViewController.m
//  BIFormManagerKit
//
//  Created by Renaud Buisine on 20/03/16.
//  Copyright © 2016 Renaud Buisine. All rights reserved.
//

#import "BIFormManagerViewController.h"
#import "UIControl+FormManager.h"
#import "UIView+FormManager.h"
#import "UITextField+FormManager.h"
#import "UISwitch+FormManager.h"
#import "UIButton+FormManager.h"

@interface BIFormManagerViewController() {
    // Set of all controls which are unvalid
    NSMutableSet *_unvalidFields;
}

@end

@implementation BIFormManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _initFields];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    // add targets on required controls
    [self.formControls enumerateObjectsUsingBlock:^(id _Nonnull elt, BOOL * _Nonnull stop) {
        if([elt isKindOfClass:UITextView.class]){
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_didControlValueChanged:) name:UITextViewTextDidChangeNotification object:elt];
        }
        else{
            UIControl *control = (UIControl *)elt;
            [control addTarget:self action:@selector(_didUpdateRequiredField:) forControlEvents:control.valueChangedEvent];
        }
    }];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    // remove targets on required controls
    [self.formControls enumerateObjectsUsingBlock:^(id _Nonnull elt, BOOL * _Nonnull stop) {
        if([elt isKindOfClass:UITextView.class]){
            [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextViewTextDidChangeNotification object:elt];
        }
        else{
            UIControl *control = (UIControl *)elt;
            [control removeTarget:self action:@selector(_didUpdateRequiredField:) forControlEvents:control.valueChangedEvent];
        }
    }];
}

#pragma mark BEHAVIOR FUNCTIONS

/**
 *  Called to indicate if form should be submitted even if fields are correct (use for additional tests)
 *
 *  @return Should or not
 */
- (BOOL)shouldSubmitForm{
    // default
    return NO;
}

/**
 *  When specific control went unvalid
 *
 *  @param control Concerned control
 */
- (void)controlFailedValidating:(id)control{
    // do nothing
}

/**
 *  When specific control went valid
 *
 *  @param control Concerned control
 */
- (void)controlSucceededValidating:(id)control{
    // do nothing
}

/**
 *  When form went valid
 */
- (void)succeededValidating{
    [self trySubmit];
}

/**
 *  When form went unvalid
 */
- (void)failedValidating{
    // do nothing
}

/**
 *  Is provided control required for form
 *
 *  @param control        Concerned control
 */
- (BOOL)isControlRequired:(id)control{
    return ((UIControl *)control).required;// default
}
/**
 *  Is control's content valid for form
 *
 *  @param control        Concerned control
 */
- (BOOL)isControlValid:(id)control{
    if([_requiredControls containsObject:control]){
        return [(UIControl *)control isDataValid];
    }
    else{
        return [(UIControl *)control isDataValidOrNil];
    }
}

/**
 *  When form is going to be submitted
 */
- (void)willSubmitForm{
    // do nothing
}
/**
 *  Called to apply necessary action for form submission
 */
- (void)submitForm{
    // do nothing
}
/**
 *  After form is submitted
 */
- (void)didSubmitForm{
    // do nothing
}

#pragma mark INSPECT VIEW

/**
 *  Find all subviews of controller which are required to valid form
 */
- (void)_initFields{
    // find controls and textviews
    NSMutableArray *fields = [[NSMutableArray alloc] initWithArray:[self.view viewsKindOfClass:UIControl.self recursively:YES]];
    [fields addObjectsFromArray:[self.view viewsKindOfClass:UITextView.self recursively:YES]];
    
    NSMutableSet *requiredFields = [NSMutableSet new];
    NSMutableSet *optionalFields = [NSMutableSet new];
    _unvalidFields = [NSMutableSet new];

    [fields enumerateObjectsUsingBlock:^(id _Nonnull elt, NSUInteger idx, BOOL * _Nonnull stop) {
        // if required, add control to list and add its observer to detect main value changes
        if([self isControlRequired:elt]){
            // add observer on value changes
            [requiredFields addObject:elt];
        }
        else{
            [optionalFields addObject:elt];
        }
        
        if(![self isControlValid:elt]){
            [_unvalidFields addObject:elt];
            [self controlFailedValidating:elt];
        }
        else{
            [self controlSucceededValidating:elt];
        }
    }];
    
    _requiredControls = requiredFields;
    _optionalControls = optionalFields;
    
    // default checking
    if(_unvalidFields.count){
        [self failedValidating];
    }
    else{
        [self succeededValidating];
    }
}

#pragma makr CONTROLS MANAGEMENT

/**
 *  Getter of all controls of form (merge optional and required controls)
 *
 *  @return List of controls
 */
- (NSSet *)formControls{
    return [_requiredControls setByAddingObjectsFromSet:_optionalControls];
}

/**
 *  Getter for set of unvalid controls
 *
 *  @return Set of unvalid controls
 */
- (NSSet *)unvalidControls{
    return _unvalidFields;
}

#pragma mark CONTROLS EVENT

/**
 *  Called when required field is updated
 *
 *  @param control updated control
 */
- (void)_didUpdateRequiredField:(UIControl *)control{
//    LOG(@"%@",control.contentData);
    
    BOOL wasValid = ![self.unvalidControls containsObject:control];
    BOOL valid = [self isControlValid:control];
    if(valid){
        if(!wasValid){
            [control setValid];
            
            [_unvalidFields removeObject:control];
            // notify status changed from unvalid to valid
            [self controlSucceededValidating:control];
            
            //was the control the last unvalid one ?
            if(!_unvalidFields.count){
                [self succeededValidating];
            }
        }
    }
    else{
        if(wasValid){
            [control setUnvalid];
            
            [_unvalidFields addObject:control];
            // notify status changed from valid to unvalid
            [self controlFailedValidating:control];
            
            //if first unvalid control, notify form went unvalid
            if(_unvalidFields.count == 1){
                [self failedValidating];
            }
        }
    }
}

/**
 *  Called by notifiation center on update of textviews
 *
 *  @param notification Notification sent
 */
- (void)_didControlValueChanged:(NSNotification *)notification{
    id object = notification.object;
    if([object isKindOfClass:UITextView.class] && [self.formControls containsObject:object]){
        [self _didUpdateRequiredField:object];
    }
}

#pragma mark CHECK FORM

/**
 *  Try submit form
 */
- (void)trySubmit{
    // shoud submit form?
    if(!_unvalidFields.count){
        if([self shouldSubmitForm]){
            [self forceSubmit];
        }
    }
}

/**
 *  Submit  (does not considere valid information of controls)
 */
- (void)forceSubmit{
    [self willSubmitForm];
    [self submitForm];
    [self didSubmitForm];
}

#pragma mark FORM KEY/VALUE CONTENT


/**
 *  Build dictionary based on controls of form
 *
 *  @return Form key/value dictionary
 */
- (NSDictionary *)dictionaryFromForm{
    NSMutableDictionary *contentDictionary = [NSMutableDictionary new];
    [self.formControls enumerateObjectsUsingBlock:^(UIControl *_Nonnull control, BOOL * _Nonnull stop) {
        NSString *key = control.controlIdentifier;
        id value = control.contentData;
        if(key && value){
            [contentDictionary setValue:value forKey:key];
        }
    }];
    return contentDictionary;
}

/**
 *  Update form contents from data in dictionary
 *
 *  @param formDictionary Dictionary with content
 */
- (void)updateWithDictionary:(NSDictionary *)formDictionary{
    [self.formControls enumerateObjectsUsingBlock:^(UIControl *_Nonnull control, BOOL * _Nonnull stop) {
        NSString *key = control.controlIdentifier;
        if(key){
            id value = [formDictionary objectForKey:key];
            if(value){
                [control setContentData:value];
            }
        }
    }];
}

@end
