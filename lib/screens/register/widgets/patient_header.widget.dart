import 'package:flutter/material.dart';
import 'package:novi_test/utils/theme/app_colors.dart';

import '../../../utils/styles/text_styles.dart';

class PatientHeader extends StatelessWidget {
  const PatientHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        KStyles().bold(
          text: "Register",
          size: 20,
        ),
        const Divider(color: AppColors.black),
      ],
    );
  }
}
