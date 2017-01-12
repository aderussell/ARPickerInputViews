# ARPickerInputViews

A set of pickers that can easily be used as input views for a UITextField.

There are currently three types available:

* [ARDatePickerInputView](#ARDatePickerInputView)
* [ARNumberPickerInputView](#ARNumberPickerInputView)
* [ARListPickerInputView](#ARListPickerInputView)


### ARDatePickerInputView
An input view that allows a date/time to be selected in the picker.
The input view has a customizable date formatter that is used to create a string for the selected date which can be shown in the target text field. 


### ARNumberPickerInputView

An input view that allows an integer to be selected in the picker. 
Rather than specifying a range, the number of colulmns is specified.

### ARListPickerInputView

An input view that takes a list of strings ans displays then in the picker.



# Using an input picker.

The designated initializer for each input view is `- (instancetype)initAsInputForTextField:(UITextField *)textField`
which will automatically create the picker and it's toolbar and attach them as the `inputView` and `inputAccessoryView` for the specified text field.


# Hiding the text field cursor
The input view will not automatically hide the cursor in the text field when the text field is active;
it is your responsibility to do so if that behaviour is desired. 
The easiest way to achieve this is to set the `tintColor` for the text field to `[UIColor clearColor]`.
