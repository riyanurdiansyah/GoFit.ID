import 'package:flutter/material.dart';
import 'package:futsal_app/utils/app_dateext.dart';
import 'package:futsal_app/utils/app_text.dart';

class DateCard extends StatelessWidget {
  const DateCard({
    Key? key,
    this.date,
    this.isSelected = false,
    this.width = 70,
    this.height = 90,
    this.onTap,
  }) : super(key: key);

  final bool isSelected;
  final double width;
  final double height;
  final DateTime? date;
  final Function? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          print("object");
          onTap!();
        }
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: isSelected ? Colors.blue : Colors.transparent,
          border: Border.all(
            color: isSelected ? Colors.transparent : Colors.grey,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            (isSelected == true)
                ? AppText.labelMontsW500(date!.shortDayName, 14, Colors.white)
                : AppText.labelMontsW500(date!.shortDayName, 14, Colors.black),
            const SizedBox(
              height: 6,
            ),
            (isSelected == true)
                ? AppText.labelMontsW500("${date!.day}", 14, Colors.white)
                : AppText.labelMontsW500("${date!.day}", 14, Colors.black)
          ],
        ),
      ),
    );
  }
}
