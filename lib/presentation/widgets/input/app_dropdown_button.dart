import 'package:avs/utils/constants.dart';
import 'package:avs/utils/styles.dart';
import 'package:flutter/material.dart';

class AppDropDownButton<T> extends StatelessWidget {
  final String label;
  final ValueChanged<T> onChanged;
  final List<DropdownMenuItem<T>> items;
  final T value;
  final String hint;
  final FocusNode focusNode;
  final bool autovalidate;
  final FormFieldSetter<T> onSaved;
  final FormFieldValidator<T> validator;
  final Widget icon;

  const AppDropDownButton(
      {Key key,
      @required this.onChanged,
      this.items,
      this.value,
      this.focusNode,
      this.autovalidate = false,
      this.onSaved,
      this.validator,
      this.icon,
      this.label,
      this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    DropdownButtonFormField<T> dropdownButtonFormField =
        DropdownButtonFormField<T>(
      hint: Text(hint),
      value: value,
      focusNode: focusNode,
      icon: icon,
      autovalidate: autovalidate,
      validator: validator,
      style: kInputTextStyle(context),
      onSaved: onSaved,
      items: items,
      onChanged: onChanged,
    );

    return label == null
        ? dropdownButtonFormField
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                label,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  //color: AppColors.label,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              dropdownButtonFormField
            ],
          );
  }
}
