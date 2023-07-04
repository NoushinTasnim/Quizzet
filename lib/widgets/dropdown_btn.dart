import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class MyDropdownButton extends StatefulWidget {
  @override
  _MyDropdownButtonState createState() => _MyDropdownButtonState();
}

class _MyDropdownButtonState extends State<MyDropdownButton> {
  String selectedOption = '20 seconds';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      dropdownColor: Colors.white54,
      value: selectedOption,
      borderRadius: BorderRadius.circular(20),
      onChanged: (String? newValue) {
        setState(() {
          selectedOption = newValue!;
          int seconds = int.parse(selectedOption.split(' ')[0]);// Output: 20
          kTimeout_time= seconds;
        });
      },
      items: <String>['10 seconds', '20 seconds', '30 seconds']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: GoogleFonts.roboto(
              color: Colors.black87
            ),
          ),
        );
      }).toList(),
    );
  }
}
