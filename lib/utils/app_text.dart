import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText {
  static labelMonts(
    String title,
    double fontSize,
    Color colors,
  ) {
    return Text(
      title,
      style: GoogleFonts.montserrat(
        fontWeight: FontWeight.normal,
        color: colors,
        fontSize: fontSize,
      ),
    );
  }

  static labelMontsBold(
    String title,
    double fontSize,
    Color colors,
  ) {
    return Text(
      title,
      style: GoogleFonts.montserrat(
        fontWeight: FontWeight.bold,
        color: colors,
        fontSize: fontSize,
      ),
    );
  }

  static labelMontsW500(
    String title,
    double fontSize,
    Color colors,
  ) {
    return Text(
      title,
      style: GoogleFonts.montserrat(
        fontWeight: FontWeight.w500,
        color: colors,
        fontSize: fontSize,
      ),
    );
  }
}
