import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/feature/todos/data/responce/todos_responce.dart';

Widget todoItem(Todo todo){
  return  Column(
    children: [
      Row(
        children: [
          Text("${todo.id} - "),
          Expanded(child: Text(todo.todo)),
        ],
      ),
      Row(
        children: [
          SizedBox(
            width: 25.w,
          ),
          Text("userId :${todo.userId}"),
        ],
      ),
      SizedBox(
        height: 15.h,
      ),
      Container(
          height: 1.w, width: 300.w, color: Colors.black45),
      SizedBox(
        height: 15.h,
      ),
    ],
  );
}