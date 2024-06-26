import 'package:csm_system/common/widgets/custom_button.dart';
import 'package:csm_system/features/hr_report/widgets/date_picker.dart';
import 'package:csm_system/features/reports/screens/analytics_screen.dart';
import 'package:csm_system/features/reports/screens/snacks_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReportsCommonScreen extends StatefulWidget {
  const ReportsCommonScreen({super.key});

  @override
  State<ReportsCommonScreen> createState() => _ReportsCommonScreenState();
}

class _ReportsCommonScreenState extends State<ReportsCommonScreen> {
  DateTime selectedDate1 = DateTime.now();
  DateTime selectedDate2 = DateTime.now();
  String selectedReportType =
      'LunchScannedUserReport'; // Initial value for the dropdown

  // final HrReportServices hrReportServices = HrReportServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Report'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select Report Type',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Center(
              child: DropdownButton<String>(
                value: selectedReportType,
                items: <String>[
                  'LunchScannedUserReport',
                  'SnacksScannedUserReport'
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedReportType = newValue!;
                  });
                },
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'From',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            DatePickerExample(
              selectedDate: selectedDate1,
              onDateSelected: (newDate) {
                setState(() {
                  selectedDate1 = newDate;
                });
              },
            ),
            const SizedBox(height: 10),
            const Text(
              'To',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            DatePickerExample(
              selectedDate: selectedDate2,
              onDateSelected: (newDate) {
                setState(() {
                  selectedDate2 = newDate;
                });
              },
            ),
            const SizedBox(height: 10),
            CustomButton(
              text: 'Send',
              onTap: () async {
                // Call the API with the provided parameters

                // hrReportServices.sendReportToHr(
                //   context: context,
                //   date1: DateFormat('yyyy-MM-dd').format(selectedDate1),
                //   date2: DateFormat('yyyy-MM-dd').format(selectedDate2),
                //   onSuccess: () {
                //     showSnackBar(context, 'Report Downloaded Successfull!');
                //   },
                // );
                if (selectedReportType == 'LunchScannedUserReport') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyAnalytics(
                            date1:
                                DateFormat('yyyy-MM-dd').format(selectedDate1),
                            date2: DateFormat('yyyy-MM-dd')
                                .format(selectedDate2))),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SnacksScannedUsersCountScreen(
                            date1:
                                DateFormat('yyyy-MM-dd').format(selectedDate1),
                            date2: DateFormat('yyyy-MM-dd')
                                .format(selectedDate2))),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
