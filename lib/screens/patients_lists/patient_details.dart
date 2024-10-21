import 'dart:developer';

import 'package:novi_test/provider/patient.provider.dart';
import 'package:novi_test/screens/patients_lists/widgets/custom_patient_list.widget.dart';
import 'package:flutter/material.dart';
import 'package:novi_test/screens/patients_lists/widgets/custom_calender.widget.dart';
import 'package:novi_test/utils/config/config.dart';
import 'package:novi_test/utils/styles/text_styles.dart';
import 'package:provider/provider.dart';

import '../../utils/theme/app_colors.dart';

class PatientsLists extends StatelessWidget {
  const PatientsLists({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Consumer<PatientProvider>(builder: (context, state, _) {
            return state.isLoading
                ? const CircularProgressIndicator(
                    color: AppColors.buttoncolor,
                  )
                : Column(
                    children: [
                      _header(context),
                      kDim.kGap15,
                      _searchBar(context),
                      kDim.kGap15,
                      _sortSection(context),
                      kDim.kGap15,
                      Divider(
                        color: Colors.grey.shade300,
                        thickness: 3,
                      ),
                      kDim.kGap15,
                      Expanded(child: PatientListWidget()),
                      kDim.kGap15,
                      registerButton(context),
                    ],
                  );
          }),
        ),
      )),
    );
  }

  Container registerButton(BuildContext context) {
    return uiCon.commonButton(
      width: double.infinity,
      height: 50,
      color: AppColors.buttoncolor,
      onPressed: () {
        Navigator.pushNamed(context, '/register');
      },
      child: const Text(
        "Register",
        style: TextStyle(
          color: AppColors.white,
          fontSize: 20,
        ),
      ),
      borderRadius: BorderRadius.circular(10),
    );
  }

  Widget _header(BuildContext context) {
    return Container(
        height: 100,
        width: double.infinity,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Back button and bell icon
            InkWell(
              child: const Icon(Icons.arrow_back_ios),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            // notification icon
            InkWell(
              child: const Icon(Icons.notifications),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ));
  }

  Widget _searchBar(BuildContext context) {
    return SizedBox(
      height: 50,
      // width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: SearchBar(
              leading:
                  const Icon(Icons.search, color: AppColors.grey, size: 20),
              side: const WidgetStatePropertyAll(BorderSide(
                color: Colors.grey,
              )),
              backgroundColor: const WidgetStatePropertyAll(Colors.white),
              elevation: const WidgetStatePropertyAll(0),
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
              hintText: 'Search For Treatment',
              hintStyle: const WidgetStatePropertyAll(TextStyle(
                color: AppColors.grey,
              )),
              onChanged: (String v) {},
            ),
          ),
          kDim.kGap05,
          uiCon.commonButton(
            width: 100,
            height: 100,
            color: AppColors.buttoncolor,
            onPressed: () {},
            child: KStyles().med(
              text: "Search",
              size: 16,
              color: AppColors.white,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ],
      ),
    );
  }

  Widget _sortSection(BuildContext context) {
    return Container(
      height: 50,
      // width: double.infinity,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          KStyles().reg(
            text: 'Sort By :',
            size: 18,
          ),

          //Date Picker,
          InkWell(
            child: Container(
              height: 50,
              width: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: AppColors.grey,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    KStyles().reg(
                      text: 'Date',
                      size: 18,
                    ),
                    const Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            ),
            onTap: () {
              log('message2');
              // Show the date picker in a modal bottom sheet
              _showCalendarBottomSheet(context);
            },
          ),
        ],
      ),
    );
  }

  void _showCalendarBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return const CustomCalender();
      },
    );
  }
}
