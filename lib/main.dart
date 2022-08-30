// ignore_for_file: prefer_const_constructors

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/addtask.dart';
import 'package:to_do_app/task.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'addtask.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Colors.purpleAccent,
        secondary: Colors.black12,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        error: Colors.red,
        onError: Colors.white,
        background: Colors.black,
        onBackground: Colors.black,
        surface: Colors.purpleAccent,
        onSurface: Colors.white,
      )),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isSwitched = false;
  String dropdownvalue = 'Work';
  var items = ['Work', 'Home', 'Goal', 'Task'];
  bool ischecked = false;
  bool checked = false;
  List<Task> tasks = [];
  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          height: 70,
          width: 200,
          padding: const EdgeInsets.all(5),
          child: FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context, builder: (context) => AddTask());
              },
              elevation: 25,
              backgroundColor: const Color.fromRGBO(153, 101, 222, 10),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Tap to Add",
                      style: TextStyle(fontFamily: "Product", fontSize: 23),
                    ),
                  ),
                ),
              ]))),
      body: Column(
        children: [
          Container(
            color: Colors.transparent,
            width: double.infinity,
            height: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Tasks ",
                      style: TextStyle(
                          fontSize: 45,
                          fontFamily: "Product",
                          color: Colors.black),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      DateFormat('dd-MM-yyyy').format(date),
                      style: const TextStyle(
                          fontSize: 20,
                          fontFamily: "Product",
                          color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: CheckboxListTile(
                        checkboxShape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        selected: tasks[index].value,
                        selectedTileColor: Color.fromRGBO(153, 101, 222, 10),
                        title: Text(
                          tasks[index].task,
                          style: const TextStyle(
                              fontFamily: "Product", fontSize: 25),
                        ),
                        controlAffinity: ListTileControlAffinity.trailing,
                        value: tasks[index].value,
                        onChanged: (value) {
                          setState(() {
                            tasks[index].value = value!;
                          });
                        },
                        activeColor: Colors.white,
                        checkColor: const Color.fromRGBO(153, 101, 222, 10),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
