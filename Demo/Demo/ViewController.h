//
//  ViewController.h
//  Demo
//
//  Created by Adrian Russell on 24/11/2016.
//  Copyright © 2016 Adrian Russell. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ARDatePickerInputView.h"
#import "ARNumberPickerInputView.h"
#import "ARListPickerInputView.h"


@interface ViewController : UIViewController


@property (nonatomic, weak, nullable) IBOutlet UITextField *datePickerTextField;

@property (nonatomic, weak, nullable) IBOutlet UITextField *numberPickerTextField;

@property (nonatomic, weak, nullable) IBOutlet UITextField *listPickerTextField;


@property (nonatomic, strong, nullable) ARDatePickerInputView *datePickerInputView;

@property (nonatomic, strong, nullable) ARNumberPickerInputView *numberPickerInputView;

@property (nonatomic, strong, nullable) ARListPickerInputView *listPickerInputView;


@end

