import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/config/config.dart';
import '../utils/constants/stringconst.dart';
import '../utils/styles/text_styles.dart';
import '../utils/theme/app_colors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.onChanged,
    this.height,
    this.onFieldSubmitted,
    this.validator,
    this.textFieldInitialValue,
    this.keyboardType,
    this.inputFormat,
    this.labelText,
    this.suffixStyle,
    this.cursorheight,
    this.isError,
    this.hintText,
    this.suffix,
    this.obscure,
  });
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final double? height;
  final void Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final String? textFieldInitialValue;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormat;

  final bool? obscure;
  final String? labelText;
  final String? hintText;
  final bool? isError;
  final double? cursorheight;
  final TextStyle? suffixStyle;
  final Widget? suffix;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  Timer? _debounce;

//!----------------dispose----------------
  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

//!----------------_onChanged----------------
  void _onChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (widget.onChanged != null) {
        widget.onChanged!(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        KStyles().med(
          text: widget.labelText ?? '',
          size: 16,
        ),
        kDim.kGap05,
        Container(
          decoration: BoxDecoration(
            borderRadius: kDim.kRadius10,
          ),
          child: TextFormField(
            obscureText: widget.obscure ?? false,
            initialValue: widget.textFieldInitialValue,
            keyboardType: widget.keyboardType,
            inputFormatters: widget.inputFormat,
            validator: widget.validator,
            onFieldSubmitted: (_) {},
            controller: widget.controller,
            onChanged: _onChanged,
            cursorWidth: 1,
            cursorHeight: widget.cursorheight ?? 20,
            decoration: InputDecoration(
              suffixIcon: widget.suffix,
              //suffixText: widget.suffixText,
              suffixStyle: widget.suffixStyle,
              errorStyle: const TextStyle(fontSize: 15),
              fillColor: AppColors.textfieldfill,
              filled: true,
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.black,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.isError ?? false
                      ? AppColors.red
                      : AppColors.blackStroke,
                ),
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.blackStroke,
                ),
              ),
              isDense: true,
              hintText: (widget.hintText?.isNotEmpty ?? false)
                  ? widget.hintText
                  : StringConst.hintValue,

              hintStyle: KStyles()
                  .reg(
                    text: '',
                    color: AppColors.grey,
                    size: 15,
                    overflow: TextOverflow.visible,
                  )
                  .style,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
            ),
            style: KStyles()
                .reg(
                  text: '',
                  size: 17,
                  color: AppColors.black,
                )
                .style,
            textAlignVertical: TextAlignVertical.center,
          ),
        ),
      ],
    );
  }
}
