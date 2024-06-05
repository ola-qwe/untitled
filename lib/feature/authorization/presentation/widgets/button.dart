import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget button({required Function tab, required String title}) {
  return Expanded(
    child: ElevatedButton(
      onPressed: () {
        tab();
      },
      style: ButtonStyle(
        padding: const WidgetStatePropertyAll(EdgeInsets.zero),
        foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          return Colors.black;
        }),
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) {
            return Colors.blueAccent;
          },
        ),
        shape: WidgetStateProperty.resolveWith<OutlinedBorder>(
          (Set<WidgetState> states) {
            return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: BorderSide(color: Colors.blueAccent, width: 4.w),
            );
          },
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
        ),
      ),
    ),
  );
}
