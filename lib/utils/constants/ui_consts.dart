import 'package:flutter/material.dart';

class UiConstants {
  Container commonButton(
      {double? width,
      required double height,
      double? loaderSize,
      required Widget child,
      required Color color,
      required void Function()? onPressed,
      BorderRadiusGeometry? borderRadius,
      bool? isLoading,
      WidgetStateProperty<EdgeInsetsGeometry?>? padding}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
      ),
      height: height,
      width: width,
      child: ElevatedButton(
        style: ButtonStyle(
            padding: padding ?? const WidgetStatePropertyAll(EdgeInsets.zero),
            backgroundColor: WidgetStatePropertyAll(
              color,
            ),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(8),
            ))),
        onPressed: onPressed,
        child: child,
        // child: child,
      ),
    );
  }

// Method to build dropdowns
  Widget buildDropDown({
    required String hint,
    required List<int> items,
    required int? value,
    required ValueChanged<int?> onChanged,
  }) {
    return DropdownButton<int>(
      value: value,
      hint: Text(hint),
      items: items.map((item) {
        return DropdownMenuItem<int>(
          value: item,
          child: Text(item.toString()),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
