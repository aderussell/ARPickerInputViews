//
//  ARDatePickerInputView.h
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

@import UIKit;

NS_ASSUME_NONNULL_BEGIN

/**
 *  A date picker that can be attached to a text field to function as it's input view so that a date can be entered.
 */
@interface ARDatePickerInputView : UIDatePicker

- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithFrame:(CGRect)frame NS_UNAVAILABLE;

/**
 *  Initializes and returns a new date picker which is set to the inputView of a specified text field.
 *
 *  @param textField The text field which will use the created date picker as it's inputView.
 *
 *  @return A newly initialized date picker.
 */
- (instancetype)initAsInputForTextField:(UITextField *)textField;


/**
 *  The text field that is using the date picker as it's input view.
 *  The contents of the text field will change to reflect changes in the date picker.
 */
@property (weak, nonatomic, readonly) UITextField *targetTextField;

/**
 *  The date formatter that is used to stringify the date so it can be set as the contents of the targetTextField.
 *
 *  By default the date formatter will format a date using the medium style for the date and not include the time.
 */
@property (strong, nonatomic, null_resettable) NSDateFormatter *dateFormatter;


/**
 *  Forces the contents of the targetTextField to be the selected date in the date picker.
 *  you must call this method if you change any properties of the dateFormatter so the changes are propagated to the targetTextfield.
 */
- (void)updateDate;

/**
 *  Whether, or not, the receiver should show a clear button which will clear the target text field and dismiss the input view.
 *  The default value is `NO`.
 */
@property (nonatomic, getter=showingClearButton) BOOL showClearButton;

/**
 *  An optional block that is called when the selected date is changed.
 */
@property (nonatomic, copy, nullable) void (^valueChangedBlock)(NSDate *date);

@end


NS_ASSUME_NONNULL_END
