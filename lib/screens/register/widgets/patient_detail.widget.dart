import 'package:flutter/material.dart';
import 'package:novi_test/utils/config/config.dart';
import 'package:novi_test/widgets/custom_textfield.dart';

class PatientPersonalDetail extends StatelessWidget {
  const PatientPersonalDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomTextField(
          labelText: 'Name',
          hintText: 'Enter your full name',
        ),
        kDim.kGap10,
        const CustomTextField(
          labelText: 'WhatsApp Number',
          hintText: 'Enter your WhatsApp Number',
        ),
        kDim.kGap10,
        const CustomTextField(
          labelText: 'Address',
          hintText: 'Enter your address',
        ),
        // kDim.kGap10,
      ],
    );
  }
}
