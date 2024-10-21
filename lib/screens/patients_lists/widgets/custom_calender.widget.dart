import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

class CustomCalender extends StatelessWidget {
  const CustomCalender({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 400,
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: LayoutBuilder(builder: (context, constraints) {
              return CalendarCarousel(
                height: constraints.maxHeight,
                onDayPressed: (DateTime date, List events) {
                  Navigator.pop(
                      context); // Close the bottom sheet on date selection
                },
                onCalendarChanged: (DateTime date) {
                  //TODO : add calende change function
                },
                weekendTextStyle: const TextStyle(
                  color: Colors.red, // Red for weekends (Saturday & Sunday)
                ),
                weekdayTextStyle: const TextStyle(
                  color: Colors.black, // Black for weekdays (Monday to Friday)
                ),
                thisMonthDayBorderColor: Colors.grey,
                weekFormat: false,
                // height: 300.0,
                selectedDayTextStyle: const TextStyle(
                  color: Colors.yellow,
                ),
                todayTextStyle: const TextStyle(
                  color: Colors.blue,
                ),
                todayButtonColor: Colors.transparent,
                todayBorderColor: Colors.green,
                markedDateShowIcon: true,
                customGridViewPhysics: const NeverScrollableScrollPhysics(),
              );
            }),
          ),
        ],
      ),
    );
  }
}
