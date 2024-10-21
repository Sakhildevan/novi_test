import 'package:flutter/material.dart';

import '../../../utils/config/config.dart';
import '../../../widgets/custom_dropdown.widget.dart';

class PatientLocation extends StatelessWidget {
  const PatientLocation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> options = [
      'New York',
      'Los Angeles',
      'Chicago',
      'Houston',
      'Miami'
    ];
    String selectedLocation = 'New York'; // Default selected location
    String selectedBranch = 'Chicago';
    return Column(
      children: [
        CustomDropDown(
          onChanged: (String? newValue) {
            // Handle dropdown selection (currently won't update UI)

            // In a real app, you'd want to manage this state at a higher level
          },
          label: 'City',
          options: options,
          selectedValue: selectedLocation,
        ),
        //kDim.kGap05,
        CustomDropDown(
          onChanged: (String? newValue) {
            // Handle dropdown selection (currently won't update UI)

            // In a real app, you'd want to manage this state at a higher level
          },
          label: 'Branch',
          options: options,
          selectedValue: selectedBranch,
        ),
        kDim.kGap05,
      ],
    );
  }
}
