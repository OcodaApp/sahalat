import 'package:date_picker_timeline/gestures/tap.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../constance.dart';

class GregorianDateWidget extends StatelessWidget {
  final double? width;
  final DateTime date;
  final TextStyle? monthTextStyle, dayTextStyle, dateTextStyle;
  final Color selectionColor;
  final DateSelectionCallback? onDateSelected;
  final String? locale;

  const GregorianDateWidget({super.key, 
    required this.date,
    required this.monthTextStyle,
    required this.dayTextStyle,
    required this.dateTextStyle,
    required this.selectionColor,
    this.width,
    this.onDateSelected,
    this.locale,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(sizeW15))
      ),
      child: Container(
        width: width,
        margin:  EdgeInsets.all(sizeW5),
        decoration: BoxDecoration(
          color: selectionColor,
          borderRadius:  BorderRadius.all(Radius.circular(sizeW15)),
          border: Border.all(color: const Color(0xFFC6C6C6).withOpacity(0.3),width: 1.4)
        ),
        child: Padding(
          padding:  EdgeInsets.all(sizeW8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(DateFormat("MMM", locale).format(date).toUpperCase(), // Month
                  style: monthTextStyle),
              Text(date.day.toString(), // Date
                  style: dateTextStyle),
              Text(DateFormat("E", locale).format(date).toUpperCase(), // WeekDay
                  style: dayTextStyle)
            ],
          ),
        ),
      ),
      onTap: () {
        onDateSelected?.call(date);
      },
    );
  }
}
