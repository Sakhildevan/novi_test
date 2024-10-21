import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:novi_test/utils/config/config.dart';
import 'package:novi_test/utils/theme/app_colors.dart';
// Ensure you have the correct package

class Patient {
  final String? name;
  final String? idNumber;
  final String? date;
  final String? package;

  Patient({
    this.name,
    this.idNumber,
    this.date,
    this.package,
  });
}

class PatientListWidget extends StatelessWidget {
  // Dummy patient data
  final List<Patient> _patients = [
    Patient(
        name: "John Doe",
        idNumber: "12345",
        date: "2024-10-18",
        package: "Basic"),
    Patient(
        name: "Jane Smith",
        idNumber: "67890",
        date: "2024-10-17",
        package: "Premium"),
    Patient(
        name: "Alice Johnson",
        idNumber: "54321",
        date: "2024-10-16",
        package: "Basic"),
    Patient(
        name: "Bob Brown",
        idNumber: "98765",
        date: "2024-10-15",
        package: "Premium"),
  ];

  PatientListWidget({
    super.key,
  });

  Future<void> _onRefresh() async {
    log("message1");
    // setState(() {
    //   isLoading = true;
    // });
    log("message2");
    // Simulate data refresh
    await Future.delayed(const Duration(milliseconds: 250));

    // Update state after refreshing
    // setState(() {
    //   isLoading = false;
    // });
    log("message3");
  }

  Widget _patientsList() {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (context, index) => kDim.kGap10,
        itemCount: _patients.length,
        itemBuilder: (context, index) {
          // final patient = _patients[index];
          return Container(
            width: double.infinity,
            color: AppColors.cardcolor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$index.',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "name",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "package",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.green,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.calendar_today,
                                    size: 18,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    "date",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 16),
                              Row(
                                children: [
                                  Icon(
                                    Icons.people,
                                    size: 18,
                                    color: Colors.orange,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    "bookingPerson",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(color: Colors.grey.shade300),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'View Booking details',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      InkWell(
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.green.shade700,
                        ),
                        onTap: () {
                          log("clicked menu");
                          //open menu
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _patientsList(),
    );
  }
}
