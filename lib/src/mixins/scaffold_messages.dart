import 'package:flutter/material.dart';

mixin ScaffoldMessages {
  showError(BuildContext context, String errorText) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(errorText)));
  }

  showSuccessMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
