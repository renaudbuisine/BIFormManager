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

@interface BIFormManagerViewController (){
    /**
     *  Array to stack all required fields in view of current form
     */
    NSArray *_requiredControlsArray;
}

@end

@implementation BIFormManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _initRequiredFields];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark BEHAVIOR FUNCTIONS

/**
 *  When controller is going to check controls values
 */
- (void)willCheckForm{
    // do nothing
}
/**
 *  When form went valid
 */
- (void)didValidForm{
    // do nothing
}
/**
 *  When form went unvalid
 */
- (void)didUnvalidForm{
    // do nothing
}
/**
 *  Is provided control required for form
 *
 *  @param control        Concerned control
 */
- (BOOL)isControlRequired:(UIControl *)control{
    return [control isRequired];// default
}
/**
 *  Is procided control valid for form
 *
 *  @param control        Concerned control
 */
- (BOOL)isControlValid:(UIControl *)control{
    return [control isControlFilled];// default
}

/**
 *  Is form valid
 *  Used to force status by overriding it
 *
 *  @return Is form valid?
 */
- (BOOL)isFormValid{
    return _formValid;
}

#pragma mark INSPECT VIEW

/**
 *  Find all subviews of controller which are required to valid form
 */
- (void)_initRequiredFields{
    NSArray *fields = [self.view viewsKindOfClass:UIControl.self recursively:YES];
    NSMutableArray *requiredFields = [[NSMutableArray alloc]init];
    
    for(UIControl *c in fields){
        // if required, add control to list and add its observer to detect main value changes
        if([self isControlRequired:c]){
            // add observer on value changes
            [c addObserver:self context:nil];
            [c addTarget:self action:@selector(targetAction:)];
            [requiredFields addObject:c];
        }
    }
    _requiredControlsArray = requiredFields;
}

#pragma mark CHECK FORM

/**
 *  Force form checking
 */
- (void)checkValidity{
    [self _checkFormControls];
}

/**
 *  Check each control
 */
- (void)_checkFormControls{
    [self willCheckForm];
    
    // run through controls to check validity
    for(UIControl *c in _requiredControlsArray){
        if(![self isControlValid:c]){
            [self setFormValid:NO];
            return;
        }
    }
    [self setFormValid:YES];
}

/**
 *  Set validity field of form, is status change, tell delegate object
 *
 *  @param formValid New status
 */
- (void)setFormValid:(BOOL)formValid{
    BOOL oldValue = _formValid;
    // apply new value
    _formValid = formValid;
    // check if controller is override
    formValid = [self isFormValid];
    
    // go valid
    if(formValid && !oldValue){
        [self didValidForm];
    }
    // go unvalid
    else if(!formValid && oldValue){
        [self didUnvalidForm];
    }
    _formValid = formValid;
}

#pragma mark OBSERVER

/**
 *  When value of controls are modified
 *
 *  @param keyPath Name of property
 *  @param object  Concerned control object
 *  @param change  Value before and after changes
 *  @param context Context
 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    [self _checkFormControls];
}

/**
 *  When target is called from control
 *
 *  @param sender Concerned control
 */
- (void)targetAction:(id)sender{
    [self _checkFormControls];
}



@end
