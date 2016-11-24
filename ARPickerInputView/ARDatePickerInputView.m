//
//  ARDatePickerInputView.m
//
//  Created by Adrian Russell on 06/11/2016.
//  Copyright (c) 2016 Adrian Russell. All rights reserved.
//
//  This software is provided 'as-is', without any express or implied
//  warranty. In no event will the authors be held liable for any damages
//  arising from the use of this software. Permission is granted to anyone to
//  use this software for any purpose, including commercial applications, and to
//  alter it and redistribute it freely, subject to the following restrictions:
//
//  1. The origin of this software must not be misrepresented; you must not
//     claim that you wrote the original software. If you use this software
//     in a product, an acknowledgment in the product documentation would be
//     appreciated but is not required.
//  2. Altered source versions must be plainly marked as such, and must not be
//     misrepresented as being the original software.
//  3. This notice may not be removed or altered from any source
//     distribution.
//

#import "ARDateOfBirthInputPicker.h"

@interface ARDatePickerInputView ()

@end

@implementation ARDatePickerInputView

- (instancetype)initAsInputForTextField:(UITextField *)textField
{
    if (self = [super init]) {
        _targetTextField = textField;
        
        _dateFormatter = [NSDateFormatter new];
        self.dateFormatter.dateStyle = NSDateFormatterMediumStyle;
        self.dateFormatter.timeStyle = NSDateFormatterNoStyle;
        
        
        self.datePickerMode = UIDatePickerModeDate;
        self.maximumDate = [NSDate date];
        [self addTarget:self action:@selector(dateDidChange:) forControlEvents:UIControlEventValueChanged];
        
        UIToolbar *toolbar = [[UIToolbar alloc] init];
        toolbar.barStyle = UIBarStyleDefault;
        [toolbar sizeToFit];
        
        UIBarButtonItem *flex = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
        UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dismissDateOfBirthToolbar:)];
        
        toolbar.items = @[flex, rightButton];
        
        textField.inputView = self;
        textField.inputAccessoryView = toolbar;
        
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didStartEditing:) name:@"UITextFieldTextDidBeginEditingNotification" object:textField];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)dateDidChange:(UIDatePicker *)picker
{
    [self updateDate];
}

- (void)updateDate
{
    self.targetTextField.text = [self.dateFormatter stringFromDate:self.date];
    [[NSNotificationCenter defaultCenter] postNotificationName:UITextFieldTextDidChangeNotification object:self.targetTextField];
}

- (void)dismissDateOfBirthToolbar:(id)sender
{
    [self.targetTextField resignFirstResponder];
}

- (void)didStartEditing:(NSNotification *)notification
{
    [self updateDate];
}

@end
