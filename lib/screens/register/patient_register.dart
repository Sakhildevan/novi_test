import 'package:flutter/material.dart';
import 'package:novi_test/screens/register/widgets/patient_payment.widget.dart';
import 'package:novi_test/utils/config/config.dart';
import 'package:novi_test/utils/theme/app_colors.dart';

import 'widgets/patient_detail.widget.dart';
import 'widgets/patient_header.widget.dart';
import 'widgets/patient_location.widget.dart';
import 'widgets/patient_treat_date_time.widget.dart';
import 'widgets/patient_treatment.widget.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button action
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Handle notification button action
            },
          )
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              // Title
              const PatientHeader(),
              //personal detail
              const PatientPersonalDetail(),
              //location
              const PatientLocation(),
              //treatmentdetails
              const TreatmentDetail(),
              //payment
              const PaymentDetail(),
              //treatment time

              const TreatmentDateAndTime(),
              // save button

              kDim.kGap10,
              uiCon.commonButton(
                height: 40,
                child: const Center(
                  child: Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                color: AppColors.buttoncolor,
                onPressed: () {},
              ),
            ],
          )),
    );
  }
}
