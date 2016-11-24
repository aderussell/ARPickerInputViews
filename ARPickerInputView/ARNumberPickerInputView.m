//
//  ARNumberPickerInputView.m
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

#import "ARNumberPickerInputView.h"

@implementation ARNumberPickerInputView

- (instancetype)initAsInputForTextField:(UITextField *)textField
{
    if (self = [super init]) {
        _targetTextField = textField;
        
        self.dataSource = self;
        self.delegate = self;
        textField.delegate = self;
        
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




- (void)dismissDateOfBirthToolbar:(id)sender
{
    [self.targetTextField resignFirstResponder];
}



- (void)didStartEditing:(NSNotification *)notification
{
    //[self updateDate];
}


- (void)setSelectedValue:(NSUInteger)selectedValue
{
    
}

- (NSUInteger)selectedValue
{
    NSMutableString *valueString = [NSMutableString new];
    for (NSUInteger i = 0; i < self.numberOfComponents; i++) {
        [valueString appendString:[self pickerView:self titleForRow:[self selectedRowInComponent:i] forComponent:i]];
    }
    
    return [valueString integerValue];
}



#pragma mark - UIPickerView delegate methods


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSUInteger value = self.selectedValue;
    
    self.targetTextField.text = [NSString stringWithFormat:@"%ld", (long)value];
    
    if (self.valueChangedBlock) {
        self.valueChangedBlock(value);
    }
}


#pragma mark - UIPickerView data source methods

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [NSString stringWithFormat:@"%ld", (long)row];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 10;
}


#pragma mark - UITextFieldDelegate methods

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    return NO;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    return 50.0;
}


@end
