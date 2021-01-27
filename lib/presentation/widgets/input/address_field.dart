import 'package:flutter/material.dart';

import 'app_text_form_field.dart';

class AddressField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String initialValue;
  final Function onSaved;
  final bool autovalidate;
  final Widget suffixIcon;
  final Function(String) validator;
  final Function(BuildContext) onTap;

  AddressField({
    Key key,
    this.controller,
    this.onSaved,
    this.autovalidate = false,
    this.onTap,
    this.suffixIcon,
    this.validator,
    this.label,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BuildContext lightThemedContext;
    return Column(
      children: [
        Theme(
            data: ThemeData.light(),
            child: Builder(builder: (context) {
              lightThemedContext = context;
              return SizedBox.shrink();
            })),
        AppTextFormField(
          key: key,
          label: label,
          controller: controller,
          initialValue: initialValue,
          hintText: "Enter your home address...",
          readOnly: true,
          suffixIcon: suffixIcon,
          onTap: () => onTap(lightThemedContext),
          onSaved: onSaved,
          autovalidate: autovalidate,
          validator: validator,
        )
      ],
    );
  }
}
