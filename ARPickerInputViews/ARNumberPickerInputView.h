//
//  ARNumberPickerInputView.h
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

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ARNumberPickerInputView : UIPickerView <UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate>


- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithFrame:(CGRect)frame NS_UNAVAILABLE;




- (instancetype)initAsInputForTextField:(UITextField *)textField;

/**
 *  The text field that is using the receiver as it's input view.
 *  The contents of the text field will change to reflect changes in the receiver.
 */
@property (weak, nonatomic, readonly) UITextField *targetTextField;

/**
 *  An optional block that is called when the selected value is changed.
 */
@property (nonatomic, copy, nullable) void (^valueChangedBlock)(NSUInteger value);

/**
 *
 *
 *  When setting the value, the value will be clipped into the acceptable value for the number of columns.
 */
@property (nonatomic) NSUInteger selectedValue;

/**
 *  The number of columns.
 *  The default is number of columns is `2`.
 */
@property (nonatomic) NSUInteger numberOfColumns;

/**
 *  Whether, or not, the receiver should show a clear button which will clear the target text field and dismiss the input view.
 *  The default value is `NO`.
 */
@property (nonatomic, getter=showingClearButton) BOOL showClearButton;

@end

NS_ASSUME_NONNULL_END
