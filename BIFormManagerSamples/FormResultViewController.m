//
//  FormResultViewController.m
//  BIFormManagerKit
//
//  Created by Renaud BUISINE on 27/07/16.
//  Copyright © 2016 Renaud Buisine. All rights reserved.
//

#import "FormResultViewController.h"

@interface FormResultViewController(){
    
    __weak IBOutlet UITextView *_contentTextView;
}

@end

@implementation FormResultViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    _contentTextView.text = _content;
}

@end
