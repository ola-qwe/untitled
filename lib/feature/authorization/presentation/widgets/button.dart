import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget button({required Function onPress,required String title}){
  return
      ElevatedButton(
        onPressed: onPress(),
        style: ButtonStyle(
          padding: const WidgetStatePropertyAll(EdgeInsets.zero),
          foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {

            return Colors.black;
          }),
          backgroundColor: WidgetStateProperty.resolveWith<Color>(
                (Set<WidgetState> states) {
              return Colors.red;
            },
          ),
          shape: WidgetStateProperty.resolveWith<OutlinedBorder>(
                (Set<WidgetState> states) {
              return RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(
                    color:  Colors.red,
                    width: 1.w),
              );
            },
          ),
        ),
        child: Text(
          title,
        ),
  );
}