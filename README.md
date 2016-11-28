# ARPickerInputViews

* [ARDatePickerInputView](#ARDatePickerInputView)
* [ARNumberPickerInputView](#ARNumberPickerInputView)
* [ARListPickerInputView](#ARListPickerInputView)


## ARDatePickerInputView



## ARNumberPickerInputView



## ARListPickerInputView




# Using an input picker.

The designated initializer for each input view is `- (instancetype)initAsInputForTextField:(UITextField *)textField`
which will automatically create the picker and it's toolbar and attach them as the `inputView` and `inputAccessoryView` for the specified text field.


# Hiding the text field cursor
The input view will not automatically hide the cursor in the text field when the text field is active;
it is your responsibility to do so if that behaviour is desired. 
The easiest way to achieve this is to set the `tintColor` for the text field to `[UIColor clearColor]`.