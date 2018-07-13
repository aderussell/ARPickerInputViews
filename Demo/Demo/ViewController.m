//
//  ViewController.m
//  Demo
//
//  Created by Adrian Russell on 24/11/2016.
//  Copyright © 2016 Adrian Russell. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // initialise the date picker input view
    self.datePickerInputView = [[ARDatePickerInputView alloc] initAsInputForTextField:self.datePickerTextField];
    self.datePickerInputView.showClearButton = YES;
    
    self.numberPickerInputView = [[ARNumberPickerInputView alloc] initAsInputForTextField:self.numberPickerTextField];
    self.numberPickerInputView.showClearButton = YES;
    self.numberPickerInputView.numberOfColumns = 4;
    self.numberPickerInputView.selectedValue = 4390;
    
    self.listPickerInputView = [[ARListPickerInputView alloc] initAsInputForTextField:self.listPickerTextField];
    self.listPickerInputView.showClearButton = YES;
    self.listPickerInputView.contents = @[ @"Object A", @"Object B", @"Object C" ];
}


@end
