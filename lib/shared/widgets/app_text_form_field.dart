import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    required this.controller,
    required this.label,
    required this.hint,
    required this.icon,
    required this.validator,
    this.keyboardType,
    this.inputFormatters,
    this.obscureText = false,
    this.suffix,
    super.key,
  });

  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;
  final FormFieldValidator<String> validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: Color(0xFFB8C3CD), fontSize: 14),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          obscureText: obscureText,
          validator: validator,
          style: const TextStyle(fontSize: 14),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Color(0xFF778492)),
            prefixIcon: Icon(icon, color: const Color(0xFF8DBDDC)),
            suffixIcon: suffix,
            filled: true,
            fillColor: const Color(0xFF111820),
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
            enabledBorder: _border(),
            focusedBorder: _border(const Color(0xFF4FC6B6), 2),
            errorBorder: _border(const Color(0xFFFF8A8A)),
            focusedErrorBorder: _border(const Color(0xFFFF8A8A), 2),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder _border([
    Color color = const Color(0xFF25313B),
    double width = 1,
  ]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: color, width: width),
    );
  }
}
