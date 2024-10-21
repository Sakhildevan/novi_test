import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:novi_test/utils/styles/text_styles.dart';
import 'package:novi_test/utils/theme/app_colors.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    super.key,
    required this.label,
    required this.selectedValue,
    required this.options,
    required this.onChanged,
  });

  final String label;
  final String? selectedValue;
  final List<String> options;
  final Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          KStyles().med(size: 16, text: label),
          DropdownButtonFormField2<String>(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              filled: true,
              fillColor: AppColors.textfieldfill,

              // This is for the default border when the dropdown is not focused
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.withOpacity(0.2),
                  width: 1.0, // Set the width of the border here
                ),
                borderRadius: BorderRadius.circular(5.0),
              ),

              // This is for the focused border when the dropdown is tapped or focused
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.grey, // Set the border color when focused
                  width: 2.0, // Thicker border for focus state
                ),
                borderRadius: BorderRadius.circular(5.0),
              ),

              // This is for the border when there's an error
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.red, // Border color for error state
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(5.0),
              ),

              // This is for the border when there's an error and the field is focused
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red, // Border color for focused error state
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            isExpanded: true,
            hint: Text(
              'Select an option',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.withOpacity(0.8),
              ),
            ),
            value: selectedValue, // Accept null values initially
            onChanged: (newValue) {
              onChanged(newValue); // Safely pass the new value
            },
            items: options.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
