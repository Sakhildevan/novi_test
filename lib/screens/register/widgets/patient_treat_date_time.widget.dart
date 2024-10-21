// import 'package:flutter/material.dart';
// import 'package:flutter_holo_date_picker/date_picker.dart';
// import 'package:flutter_holo_date_picker/i18n/date_picker_i18n.dart';
// import 'package:provider/provider.dart';

// import '../../../provider/patient_date_time.provider.dart';

// class TreatmentDateAndTime extends StatelessWidget {
//   const TreatmentDateAndTime({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final TextEditingController _dateController = TextEditingController();
//     return Consumer<TreatmentDateTimeProvider>(
//         builder: (BuildContext context, state, _) {
//       return Column(
//         children: [
//           _buildDateTextField(
//             dateController: _dateController,
//             context: context,
//             state: state,
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           MyDropdowns(
//             selectedHour: null,
//             selectedMinute: null,
//             onHourChanged: (value) {
//               print('Selected Hour: $value');
//             },
//             onMinuteChanged: (value) {
//               print('Selected Minute: $value');
//             },
//           ),
//         ],
//       );
//     });
//   }
// }

// Widget _buildDateTextField({
//   required TextEditingController dateController,
//   required BuildContext context,
//   TreatmentDateTimeProvider? state,
// }) {
//   // Method to handle date selection
//   Future<void> _selectDate(BuildContext context) async {
//     var pickedDate = await DatePicker.showSimpleDatePicker(
//       context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2100),
//       dateFormat: "yyyy-MM-dd",
//       locale: DateTimePickerLocale.en_us,
//       looping: false,
//     );

//     if (pickedDate != null) {
//       dateController.text =
//           "${pickedDate.toLocal()}".split(' ')[0]; // Format date as needed
//     }
//   }

//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start, // Align items to the start
//     children: [
//       const Text(
//         'Treatment Date', // Text label
//       ),
//       const SizedBox(height: 5), // Space between the label and the TextField
//       IntrinsicHeight(
//         child: TextField(
//           controller: dateController,
//           decoration: InputDecoration(
//             hintText: '',
//             suffixIcon: IconButton(
//               icon: const Icon(Icons.calendar_today),
//               onPressed: () => _selectDate(context),
//             ),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: BorderSide(
//                   color: Colors.grey
//                       .withOpacity(0.3)), // Change the border color to grey
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: BorderSide(
//                   color: Colors.grey
//                       .withOpacity(0.3)), // Border color when enabled
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: const BorderSide(
//                   color: Colors.grey), // Border color when focused
//             ),
//             contentPadding:
//                 const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
//           ),
//         ),
//       ),
//     ],
//   );
// }

// Widget MyDropdowns({
//   required int? selectedHour,
//   required int? selectedMinute,
//   required ValueChanged<int?> onHourChanged,
//   required ValueChanged<int?> onMinuteChanged,
// }) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       const Text("Treatment Time"),
//       Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           _buildDropDown(
//             hint: 'Select Hour',
//             items: List.generate(12, (index) => index + 1),
//             value: selectedHour,
//             onChanged: onHourChanged,
//           ),
//           const SizedBox(width: 20), // Spacing between dropdowns
//           _buildDropDown(
//             hint: 'Select Minute',
//             items: List.generate(60, (index) => index + 1),
//             value: selectedMinute,
//             onChanged: onMinuteChanged,
//           ),
//         ],
//       ),
//     ],
//   );
// }

// // Method to build dropdowns
// Widget _buildDropDown({
//   required String hint,
//   required List<int> items,
//   required int? value,
//   required ValueChanged<int?> onChanged,
// }) {
//   return DropdownButton<int>(
//     value: value,
//     hint: Text(hint),
//     items: items.map((item) {
//       return DropdownMenuItem<int>(
//         value: item,
//         child: Text(item.toString()),
//       );
//     }).toList(),
//     onChanged: onChanged,
//   );
// }
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/i18n/date_picker_i18n.dart';
import 'package:provider/provider.dart';

import '../../../provider/patient_date_time.provider.dart'; // Assuming this is your provider file

class TreatmentDateAndTime extends StatelessWidget {
  const TreatmentDateAndTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<TreatmentDateTimeProvider>(
        builder: (BuildContext context, state, _) {
      return Column(
        children: [
          _buildDateTextField(
            context: context,
            state: state,
          ),
          const SizedBox(
            height: 10,
          ),
          MyDropdowns(
            selectedHour: state.selectedHour,
            selectedMinute: state.selectedMinute,
            onHourChanged: (value) {
              state.selectHour(value);
            },
            onMinuteChanged: (value) {
              state.selectMinute(value);
            },
          ),
        ],
      );
    });
  }
}

Widget _buildDateTextField({
  required BuildContext context,
  required TreatmentDateTimeProvider state,
}) {
  // Method to handle date selection
  Future<void> _selectDate(BuildContext context) async {
    var pickedDate = await DatePicker.showSimpleDatePicker(
      context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      dateFormat: "yyyy-MM-dd",
      locale: DateTimePickerLocale.en_us,
      looping: false,
    );

    if (pickedDate != null) {
      state.selectDate(pickedDate); // Update the date in the Provider
    }
  }

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start, // Align items to the start
    children: [
      const Text(
        'Treatment Date', // Text label
      ),
      const SizedBox(height: 5), // Space between the label and the TextField
      IntrinsicHeight(
        child: TextField(
          controller: TextEditingController(
              text: state.selectedDate != null
                  ? "${state.selectedDate!.toLocal()}".split(' ')[0]
                  : ''), // Reflect the date from the Provider
          decoration: InputDecoration(
            hintText: '',
            suffixIcon: IconButton(
              icon: const Icon(Icons.calendar_today),
              onPressed: () => _selectDate(context),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                  color: Colors.grey
                      .withOpacity(0.3)), // Change the border color to grey
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                  color: Colors.grey
                      .withOpacity(0.3)), // Border color when enabled
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                  color: Colors.grey), // Border color when focused
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          ),
        ),
      ),
    ],
  );
}

Widget MyDropdowns({
  required int? selectedHour,
  required int? selectedMinute,
  required ValueChanged<int?> onHourChanged,
  required ValueChanged<int?> onMinuteChanged,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text("Treatment Time"),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildDropDown(
            hint: 'Select Hour',
            items: List.generate(12, (index) => index + 1),
            value: selectedHour,
            onChanged: onHourChanged,
          ),
          const SizedBox(width: 20), // Spacing between dropdowns
          _buildDropDown(
            hint: 'Select Minute',
            items: List.generate(60, (index) => index),
            value: selectedMinute,
            onChanged: onMinuteChanged,
          ),
        ],
      ),
    ],
  );
}

// Method to build dropdowns
Widget _buildDropDown({
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
