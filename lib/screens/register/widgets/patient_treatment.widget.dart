import 'package:flutter/material.dart';
import 'package:novi_test/utils/config/config.dart';
import 'package:novi_test/widgets/custom_dropdown.widget.dart';
import 'package:provider/provider.dart';
import '../../../provider/patient_treatment.provider.dart';
import '../../../utils/styles/text_styles.dart';
import '../../../utils/theme/app_colors.dart';

class TreatmentDetail extends StatelessWidget {
  const TreatmentDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> options = [
      'Treatment 1',
      'Treatment 2',
      'Treatment 3',
      'Treatment 4',
    ];
    return Column(
      children: [
        _treatmentSection(context),
        kDim.kGap10,
        _custombutton(context, options),
        kDim.kGap10,
      ],
    );
  }
}

Widget _treatmentSection(BuildContext context) {
  return Consumer<PatientTreatCountProvider>(
    builder: (context, state, _) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          KStyles().med(
            size: 16,
            text: 'Treatments',
          ),
          Container(
            // height: 100,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "1: ${state.selectedTreatment}",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Text("Male", style: TextStyle(fontSize: 14)),
                          const SizedBox(width: 10),
                          Container(
                            width: 40,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                            ),
                            alignment: Alignment.center,
                            child: Text(state.malePatients.toString()),
                          ),
                          const SizedBox(width: 10),
                          const Text("Female", style: TextStyle(fontSize: 14)),
                          const SizedBox(width: 5),
                          Container(
                            width: 40,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                            ),
                            alignment: Alignment.center,
                            child: Text(state.femalePatients.toString()),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.edit,
                          color: AppColors.buttoncolor,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    },
  );
}

_custombutton(
  context,
  List<String> options,
) {
  return uiCon.commonButton(
    height: 50,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        KStyles().reg(
          text: 'Add Treatments',
          size: 16,
          color: AppColors.black,
        ),
        const Icon(Icons.add, color: AppColors.black),
      ],
    ),
    color: AppColors.buttonshade,
    onPressed: () {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Consumer<PatientTreatCountProvider>(
                    builder: (context, state, _) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomDropDown(
                        label: ("Choose Treatment"),
                        selectedValue: state.selectedTreatment,
                        options: options,
                        onChanged: (value) {
                          state.selectTreatment(value);
                        },
                      ),
                      kDim.kGap10,
                      KStyles().med(
                        size: 16,
                        text: 'Add Patients',
                      ),
                      kDim.kGap10,
                      _buildPatientCounter(
                        label: "Men",
                        count: state.malePatients,
                        context: context,
                        onDecrement: state.decrementMale,
                        onIncrement: state.incrementMale,
                      ),
                      kDim.kGap10,
                      _buildPatientCounter(
                        label: "Female",
                        count: state.femalePatients,
                        context: context,
                        onDecrement: state.decrementFemale,
                        onIncrement: state.incrementFemale,
                      ),
                      const SizedBox(height: 30),
                      Center(
                        child: uiCon.commonButton(
                          borderRadius: BorderRadius.circular(8),
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
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
          );
        },
      );
    },
  );
}

Row _buildPatientCounter({
  required String label,
  required int count,
  required BuildContext context,
  required VoidCallback onDecrement,
  required VoidCallback onIncrement,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        width: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.textfieldfill,
          border: Border.all(
            color: AppColors.textfieldfill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(label, style: const TextStyle(fontSize: 16)),
        ),
      ),
      kDim.kGap10,
      Row(
        children: [
          _iconButton(onDecrement,
              icon: const Icon(
                Icons.remove,
              )),
          kDim.kGap05,
          SizedBox(
            width: 40,
            height: 40,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
              ),
              alignment: Alignment.center,
              child: Text(
                count.toString(),
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
          kDim.kGap05,
          _iconButton(onIncrement, icon: const Icon(Icons.add)),
        ],
      ),
    ],
  );
}

InkWell _iconButton(
  VoidCallback onDecrement, {
  required Icon icon,
}) {
  return InkWell(
    onTap: onDecrement,
    child: Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.buttoncolor,
        borderRadius: BorderRadius.circular(50),
      ),
      alignment: Alignment.center,
      child: Icon(
        icon.icon,
        color: AppColors.white,
      ),
    ),
  );
}
