import 'package:flutter/material.dart';
import 'package:fruits/core/utils/app_text_styles.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    Key? key,
    required this.hintText,
    required this.inputType,
    this.suffixIcon,
    this.onSaved,
    this.isPassword = false, // New parameter
  }) : super(key: key);

  final String hintText;
  final TextInputType inputType;
  final IconData? suffixIcon;
  final void Function(String?)? onSaved;
  final bool isPassword; // New parameter to control password visibility

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.inputType,
      obscureText: widget.isPassword ? _isObscured : false,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'هذا الحقل مطلوب';
        }
        return null;
      },
      onSaved: widget.onSaved,
      decoration: InputDecoration(
        suffixIcon: widget.isPassword
            ? IconButton(
          icon: Icon(
            _isObscured ? Icons.visibility : Icons.visibility_off,
            color: Color(0xffC9CECF),
            size: 20,
          ),
          onPressed: () {
            setState(() {
              _isObscured = !_isObscured;
            });
          },
        )
            : Icon(widget.suffixIcon, color: Color(0xffC9CECF), size: 20),
        fillColor: Color(0xffF9FAFA),
        filled: true,
        border: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
        hintText: widget.hintText,
        hintStyle: AppTextStyles.style13w700Grey,
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(
        color: Color(0xFFE6E9E9),
        width: 2,
      ),
    );
  }
}
