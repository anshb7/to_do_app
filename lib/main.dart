// ignore_for_file: prefer_const_constructors

import 'dart:ffi';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';

import 'package:to_do_app/task.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

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
        primary: Color.fromARGB(255, 207, 17, 221),
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
  TextEditingController taskcontroller = TextEditingController();
  bool isSwitched = false;
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
                    context: context,
                    builder: (context) => Material(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextField(
                                controller: taskcontroller,
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
                                      fontSize: 15,
                                      fontFamily: "product",
                                      color: Colors.grey),
                                  contentPadding: EdgeInsets.only(
                                    left: 20,
                                  ),
                                ),
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
                                        fontSize: 15),
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
                                    DateFormat("hh:mm:ss a")
                                        .format(DateTime.now()),
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: SizedBox(
                                      width: 280,
                                      height: 60,
                                      child: ElevatedButton(
                                        child: Text(
                                          'CREATE TASK',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        onPressed: () {
                                          addtask();
                                          setState(() {});
                                        },
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.black),
                                          shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5))),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ));
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            color: Colors.transparent,
            width: double.infinity,
            height: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.all(15.0),
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
                  padding: const EdgeInsets.all(15.0),
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
          Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: centertext(),
            ),
            heightFactor: 0,
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
                        selectedTileColor: Color.fromRGBO(229, 103, 90, 1),
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

  void addtask() {
    tasks.add(Task(task: taskcontroller.text));
    setState(() {});
  }

  Text centertext() {
    var message;
    if (tasks.isEmpty == true) {
      message = """There is nothing here,tap the button below to add!""";
    } else {
      message = "";
    }
    return Text(
      message,
      style: TextStyle(
          color: Colors.grey,
          fontFamily: "Product",
          fontWeight: FontWeight.bold),
    );
  }
}
