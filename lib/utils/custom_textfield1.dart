import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

TextField appTextField({
  TextStyle? labelStyle,
  TextStyle? hintStyle,
  bool? obscured,
  TextInputType? keyboardType,
  TextEditingController? controller,
  bool? enabled,
  FocusNode? focusNode,
  String? errorMessage,
  String? hintText,
  double? cursorHeight,
  String? labelText,
  Widget? prefixIcon,
  Widget? suffixIcon,
  String? prefixText,
  TextCapitalization? textCapitalization,
  List<TextInputFormatter>? inputFormatter,
  required BuildContext context,
  required ValueChanged<String> onChanged,
  ValueChanged<String>? onSubmitted,
  VoidCallback? onEditingComplete,
  VoidCallback? onTap,
  int? maxLines,
}) {
  return TextField(
    obscureText: obscured ?? false,
    onEditingComplete: onEditingComplete ?? () {},
    onSubmitted: onSubmitted,
    maxLines: maxLines ?? 1,
    keyboardType: keyboardType ?? TextInputType.text,
    scrollPadding:
        EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
    inputFormatters: inputFormatter ?? [],
    style: labelStyle ?? Theme.of(context).textTheme.titleMedium,
    controller: controller,
    textCapitalization: textCapitalization ?? TextCapitalization.sentences,
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.all(8),
      enabled: enabled ?? true,
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      labelText: labelText ?? '',
      floatingLabelStyle: Theme.of(context).textTheme.labelLarge!,
      border: OutlineInputBorder( // Add your desired border style here
        borderRadius: BorderRadius.circular(12), // Rounded corners
        borderSide: BorderSide(
          color: Colors.blue, // Border color
          width: 2.0, // Border thickness
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: Color.fromRGBO(141, 188, 211, 1)),
        gapPadding: 8.0, 
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: Color.fromRGBO(141, 188, 211, 1)),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: Colors.red, // Border color for errors
          width: 2.0,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: Colors.grey.shade400, // Border color when disabled
          width: 1.5,
        ),
      ),
      hintText: hintText ?? "",
      errorText: errorMessage,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      prefixText: prefixText,
      labelStyle: labelStyle ?? Theme.of(context).textTheme.titleSmall,
      hintStyle: hintStyle ??
          Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey.withOpacity(0.8),
              ),
      errorStyle: Theme.of(context)
          .textTheme
          .bodyMedium
          ?.copyWith(color: Colors.red, fontSize: 10),
    ),
    enabled: enabled ?? true,
    focusNode: focusNode,
    onChanged: onChanged,
    onTap: onTap,
  );
}
// it should happen something like after tapping on button 