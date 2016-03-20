//
//  ViewController.m
//  BIFormManagerSamples
//
//  Created by Renaud Buisine on 20/03/16.
//  Copyright © 2016 Renaud Buisine. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    
    __weak IBOutlet UITextView *_aboutTextView;
    __weak IBOutlet UITextField *_emailTextField;
    __weak IBOutlet UITextField *_lastNameTextField;
    __weak IBOutlet UITextField *_fistNameTextField;
    __weak IBOutlet UISwitch *_conditionsSwitch;
    __weak IBOutlet UIButton *_submitButton;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark BIFormManagerViewController

- (void)didValidForm{
    _submitButton.enabled = YES;
}
- (void)didUnvalidForm{
    _submitButton.enabled = NO;
}
- (BOOL)isControlRequired:(UIControl *)control{
    return control.tag == 1;
}
- (BOOL)isControlValid:(UIControl *)control{
    if(control == _conditionsSwitch){
        return _conditionsSwitch.on;
    }
    else{
        return [super isControlValid:control];
    }
}
-(BOOL)isFormValid{
    // let's check textview which is not a control, can do last checkings here !
    return [super isFormValid] && [_aboutTextView.text length] > 0;
}

#pragma mark IBAction

- (IBAction)_submit:(id)sender {
    NSLog(@"SUBMITTED !!!!");
}

@end
