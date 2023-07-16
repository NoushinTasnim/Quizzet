import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/dropdown_btn.dart';

class PerQuesTime extends StatelessWidget {
  const PerQuesTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white54,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.white,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Text(
              "Time Per Question",
              style: GoogleFonts.roboto(
                color: Colors.black54,
                fontSize: 16,
              ),
            ),
            Spacer(),
            MyDropdownButton(),
          ],
        ),
      ),
    );
  }
}