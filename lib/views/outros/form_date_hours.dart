import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormDateAndHours extends StatefulWidget {
  const FormDateAndHours({super.key});

  @override
  State<FormDateAndHours> createState() => _FormDateAndHoursState();
}

class _FormDateAndHoursState extends State<FormDateAndHours> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.calendar_today), //icon of text field
                labelText: "Escolha a data", //label text of field
              ),
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context, //context of current state
                    initialDate: DateTime.now(),
                    firstDate: DateTime(
                        2000), //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(2101));

                if (pickedDate != null) {
                  print(
                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                  print(
                      formattedDate); //formatted date output using intl package =>  2021-03-16
                } else {
                  print("Date is not selected");
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
