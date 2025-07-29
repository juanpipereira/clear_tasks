import 'package:flutter/material.dart';

class NotEmptyTextFormField extends StatelessWidget {
  const NotEmptyTextFormField({
    super.key,
    this.controller,
    this.labelText,
    this.maxLines = 1,
    this.enabled = true,
    this.notEmptyValidatorMessage,
  });

  final TextEditingController? controller;
  final String? labelText;
  final int maxLines;
  final bool enabled;
  final String? notEmptyValidatorMessage;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if (notEmptyValidatorMessage != null) {
          if (value == null || value.isEmpty) {
            return notEmptyValidatorMessage;
          }
        }
        return null;
      },
      maxLines: maxLines,
      enabled: enabled,
    );
  }
}
