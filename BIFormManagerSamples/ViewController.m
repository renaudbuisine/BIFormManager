//
//  ViewController.m
//  BIFormManagerSamples
//
//  Created by Renaud Buisine on 20/03/16.
//  Copyright © 2016 Renaud Buisine. All rights reserved.
//

#import "ViewController.h"
#import "FormResultViewController.h"

@interface ViewController (){
    __weak IBOutlet UIButton *_submitButton;
    __weak IBOutlet UILabel *_stepperValueLabel;
}

@end

@implementation ViewController

#pragma mark BIFormManagerViewController

- (void)controlFailedValidating:(UIControl *)control{
    
}

- (void)controlSucceededValidating:(UIControl *)control{
    
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    NSDictionary *formDictionary = @{@"email":@"mail@mail.com",@"lastname":@"NAME"};
    [self updateWithDictionary:formDictionary];
}

- (void)succeededValidating{
    [super succeededValidating];
    
    _submitButton.enabled = YES;
}

- (void)failedValidating{
    [super failedValidating];
    
    _submitButton.enabled = NO;
}

#pragma mark IBAction

- (IBAction)_submit:(id)sender {
    NSLog(@"SUBMITTED !!!!");
}
- (IBAction)_updateStepperValue:(UIStepper *)sender {
    _stepperValueLabel.text = [NSString stringWithFormat:@"%@", sender.contentData];
}

#pragma mark Segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"formSubmission"]){
        FormResultViewController *vc = segue.destinationViewController;
        vc.content = [NSString stringWithFormat:@"%@",[self dictionaryFromForm]];
    }
}

@end
