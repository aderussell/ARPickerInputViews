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

#import "ARDatePickerInputView.h"


@implementation ARDatePickerInputView
{
    UIToolbar *_toolbar;
}

- (instancetype)initAsInputForTextField:(UITextField *)textField
{
    if (self = [super init]) {
        
        
        _targetTextField = textField;
        
        
        self.datePickerMode = UIDatePickerModeDate;
        
        
        [self addTarget:self action:@selector(dateDidChange:) forControlEvents:UIControlEventValueChanged];
        
        UIToolbar *toolbar = [[UIToolbar alloc] init];
        toolbar.barStyle = UIBarStyleDefault;
        [toolbar sizeToFit];
        _toolbar = toolbar;
        
        UIBarButtonItem *flex = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
        UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dismissDateOfBirthToolbar:)];
        
        toolbar.items = @[flex, rightButton];
        
        textField.inputView = self;
        textField.inputAccessoryView = toolbar;
        
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didStartEditing:) name:UITextFieldTextDidBeginEditingNotification object:textField];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)setTintColor:(UIColor *)tintColor
{
    [super setTintColor:tintColor];
    _toolbar.tintColor = tintColor;
}


#pragma mark - NSCoding

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if ([super initWithCoder:aDecoder]) {
        _dateFormatter   = [aDecoder decodeObjectForKey:@"dateFormatter"];
        _targetTextField = [aDecoder decodeObjectForKey:@"targetTextField"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [super encodeWithCoder:aCoder];
    
    [aCoder encodeObject:_dateFormatter   forKey:@"dateFormatter"];
    [aCoder encodeObject:_targetTextField forKey:@"targetTextField"];
}




#pragma mark - Setters & Getters

- (NSDateFormatter *)dateFormatter
{
    if (!_dateFormatter) {
        _dateFormatter = [NSDateFormatter new];
        _dateFormatter.dateStyle = NSDateFormatterMediumStyle;
        _dateFormatter.timeStyle = NSDateFormatterNoStyle;
    }
    
    return _dateFormatter;
}




#pragma mark - Setting the Date

- (void)setDate:(NSDate *)date animated:(BOOL)animated
{
    [super setDate:date animated:animated];
    
    [self updateDate];
}

- (void)updateDate
{
    self.targetTextField.text = [self.dateFormatter stringFromDate:self.date];
    [[NSNotificationCenter defaultCenter] postNotificationName:UITextFieldTextDidChangeNotification object:self.targetTextField];
}



#pragma mark - UIDatePicker Target methods

- (void)dateDidChange:(UIDatePicker *)picker
{
    [self updateDate];
    
    if (self.valueChangedBlock) {
        self.valueChangedBlock(picker.date);
    }
}



#pragma mark - UIToolbar Target methods

- (void)dismissDateOfBirthToolbar:(id)sender
{
    [self.targetTextField resignFirstResponder];
}



#pragma mark - UITextField Notification methods

- (void)didStartEditing:(NSNotification *)notification
{
    [self updateDate];
}

@end
