import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/task.dart';

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
          colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: Colors.purpleAccent,
        secondary: Colors.black12,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        error: Colors.red,
        onError: Colors.white,
        background: Color.fromRGBO(254, 254, 254, 1),
        onBackground: Colors.white,
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
  bool ischecked = false;
  bool checked = false;
  List<Task> tasks = [Task("Task"), Task("T"), Task("Task")];
  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          height: 70,
          width: 200,
          padding: EdgeInsets.all(5),
          child: FloatingActionButton(
              onPressed: () {},
              elevation: 25,
              backgroundColor: Color.fromRGBO(153, 101, 222, 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
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
            color: Color.fromRGBO(254, 254, 254, 1),
            width: double.infinity,
            height: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
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
                      style: TextStyle(
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
                        checkboxShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        selected: checked,
                        selectedTileColor: Color.fromRGBO(153, 101, 222, 10),
                        title: Text(
                          tasks[index].task,
                          style: TextStyle(fontFamily: "Product", fontSize: 25),
                        ),
                        controlAffinity: ListTileControlAffinity.trailing,
                        value: ischecked,
                        onChanged: (value) {
                          setState(() {
                            ischecked = value!;
                            checked = true;
                          });
                        },
                        activeColor: Colors.white,
                        checkColor: Color.fromRGBO(153, 101, 222, 10),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
