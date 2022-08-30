import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/task.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  DateTime date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
            child: Text(
              '''Create New Task''',
              textAlign: TextAlign.left,
              style: TextStyle(
                decoration: TextDecoration.none,
                fontFamily: "product",
                fontSize: 60.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const TextField(
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  style: BorderStyle.none,
                  color: Colors.black,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  style: BorderStyle.none,
                  color: Colors.black,
                ),
              ),
              labelText: 'Task Name',
              labelStyle: TextStyle(
                  fontSize: 15, fontFamily: "product", color: Colors.grey),
              contentPadding: EdgeInsets.only(
                left: 20,
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.fromLTRB(30, 10, 0, 0),
                child: Icon(
                  Icons.calendar_today,
                  color: Colors.yellow,
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Text(
                DateFormat.MMMMEEEEd().format(date),
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.fromLTRB(30, 10, 0, 0),
                child: Icon(
                  Icons.timer,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Text(
                DateFormat("hh:mm:ss a").format(DateTime.now()),
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: SizedBox(
                  width: 350,
                  height: 60,
                  child: ElevatedButton(
                    child: Text(
                      'CREATE TASK',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
