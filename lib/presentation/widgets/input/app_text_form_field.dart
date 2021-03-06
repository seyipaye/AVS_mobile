import 'package:avs/utils/constants.dart';
import 'package:avs/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField(
      {this.maxLength,
      this.autofocus = false,
      this.readOnly = false,
      this.onChanged,
      this.initialValue,
      this.label,
      this.hintText,
      this.keyboardType,
      this.obscureText = false,
      this.controller,
      this.validator,
      this.helperText,
      this.height,
      this.hintColor,
      this.borderWidth,
      this.onTap,
      this.onSaved,
      this.focusNode,
      this.textInputAction,
      this.onFieldSubmitted,
      this.suffixIcon,
      this.prefixIcon,
      this.autovalidate = false,
      this.maxLines = 1,
      this.inputFormatters,
      this.errorText,
      Key key,
      this.spacerHeight,
      this.topPadding,
      this.enableInteractiveSelection = true,
      this.labelTextStyle})
      : super(key: key);

  final TextStyle labelTextStyle;
  final bool enableInteractiveSelection;
  final double topPadding;
  final double spacerHeight;
  final int maxLength;
  final int maxLines;
  final String hintText;
  final String errorText;
  final TextInputType keyboardType;
  final bool obscureText;
  final String helperText;
  final Color hintColor;
  final TextEditingController controller;
  final double borderWidth;
  final double height;
  final Function(String) validator;
  final Function onSaved;
  final Function onTap;
  final FocusNode focusNode;
  final TextInputAction textInputAction;
  final Function onFieldSubmitted;
  final Widget suffixIcon;
  final Widget prefixIcon;
  final String label;
  final String initialValue;
  final Function onChanged;
  final bool readOnly;
  final bool autofocus;
  final bool autovalidate;
  final List<TextInputFormatter> inputFormatters;

  @override
  Widget build(BuildContext context) {
    Widget textFormField = TextFormField(
      enableInteractiveSelection: enableInteractiveSelection,
      readOnly: readOnly,
      autovalidate: autovalidate,
      onChanged: onChanged,
      maxLength: maxLength,
      initialValue: initialValue,
      obscureText: obscureText,
      textAlignVertical: TextAlignVertical.center,
      keyboardType: keyboardType,
      controller: controller != null ? controller : null,
      focusNode: focusNode,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      autofocus: autofocus,
      maxLines: maxLines,
      inputFormatters: inputFormatters,
      style: kInputTextStyle(context),
      validator: validator,
      onSaved: onSaved,
      onTap: onTap,
      decoration: InputDecoration(
        hintText: hintText,
        helperMaxLines: 2,
        errorMaxLines: 2,
        errorText: errorText,
        hintStyle: TextStyle(fontWeight: FontWeight.w300),
        helperText: helperText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
    );

    return label == null
        ? textFormField
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: topPadding ?? 0,
              ),
              Text(label, style: labelTextStyle ?? kLabelTextStyle),
              SizedBox(
                height: spacerHeight ?? 10.0,
              ),
              textFormField
            ],
          );
  }
}
