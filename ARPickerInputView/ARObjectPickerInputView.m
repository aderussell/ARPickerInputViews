//
//  ARObjectPickerInputView.m
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

#import "ARObjectPickerInputView.h"

@implementation ARObjectPickerInputView


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


- (void)setContents:(NSArray *)contents
{
    [self setContents:contents selectingFirstObject:YES];
}


- (void)setContents:(NSArray *)contents selectingFirstObject:(BOOL)selectFirstObject
{
    if (contents == nil) {
        contents = @[];
    }
    _contents = contents;
    
    [self reloadAllComponents];
    if (_contents.count && selectFirstObject) {
        [self selectRow:0 inComponent:0 animated:NO];
        self.targetTextField.text = self.contents[0];
    }
}


- (void)dismissDateOfBirthToolbar:(id)sender
{
    if (self.targetTextField.text.length == 0) {
        [self pickerView:self didSelectRow:[self selectedRowInComponent:0] inComponent:0];
    }
    
    
    [self.targetTextField resignFirstResponder];
}



- (void)didStartEditing:(NSNotification *)notification
{
    //[self updateDate];
}



- (void)selectRow:(NSInteger)row animated:(BOOL)animated
{
    [self selectRow:row inComponent:0 animated:animated];
    self.targetTextField.text = self.contents[row];
}


#pragma mark - UIPickerView delegate methods


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.targetTextField.text = self.contents[row];
    
    if (self.valueChangedBlock) {
        self.valueChangedBlock(row);
    }
}


#pragma mark - UIPickerView data source methods

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.contents[row];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.contents.count;
}


#pragma mark - UITextFieldDelegate methods

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    return NO;
}


@end
