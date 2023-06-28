import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model/task.dart';

class ScreenThree extends StatefulWidget {
  static const routeName = '/screen_three';

  const ScreenThree({Key? key}) : super(key: key);

  @override
  State<ScreenThree> createState() => _ScreenThreeState();
}

class _ScreenThreeState extends State<ScreenThree> {
  var _enterTask;
  late List<Task> _tasks;
  late List<bool> _taskDone;

  void saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Task task = Task.fromString(_enterTask.text);
    String? tasks = prefs.getString('task');
    List list = (tasks == null) ? [] : json.decode(tasks);
    list.add(json.encode(task.getMap()));
    print(list);
    prefs.setString('task', json.encode(list));
    _enterTask.text = '';
    Navigator.of(context).pop();
    setState(() {});
  }

  void _getTasks() async {
    _tasks = [];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.remove('task');
    String? tasks = prefs.getString('task');
    List list = (tasks == null) ? [] : json.decode(tasks);
    for (dynamic d in list) {
      _tasks.add(Task.fromMap(json.decode(d)));
    }
    print(_tasks);
    _taskDone = List.generate(_tasks.length, (index) => false);
    setState(() {});
  }

  void updateTaskList() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // List<Task> updateList = [];
    // for(var i = 0; i < _tasks.length; i++){
    //   if(!_taskDone[i]) updateList.add(_tasks[i]);
    // }
    // var pendingListEncoded = List.generate(
    //     updateList.length,
    //     (i) => json.encode(updateList[i].getMap()));
    // prefs.setString('task', json.encode(pendingListEncoded));
    // _getTasks();
  }

  @override
  void initState() {
    super.initState();
    _enterTask = TextEditingController();
    _getTasks();
  }

  @override
  void dispose() {
    _enterTask.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("Screen Three"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
              onPressed: updateTaskList,
              icon: Icon(Icons.save)
          )],
      ),
      body: (_tasks == null || _tasks == "")
          ? Center(child: Text("Screen three"))
          : SingleChildScrollView(
            child: Column(
                children: _tasks
                    .map((e) => Container(
                          margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                          padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                          height: 50.0,
                          alignment: Alignment.centerLeft,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Colors.black,
                              width: 1.0
                            )
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(e.task),
                                Checkbox(
                                  key: GlobalKey(),
                                  value: _taskDone[_tasks.indexOf(e)],
                                  onChanged: (val) {
                                  setState(() {
                                    _taskDone[_tasks.indexOf(e)] = val!;
                                  });
                                },)
                              ]),
                        ))
                    .toList(),
              ),
          ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => showModalBottomSheet(
            backgroundColor: Colors.transparent,
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) => Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Container(
                    height: 250,
                    padding: EdgeInsets.all(15.0),
                    decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Add Task Pane",
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white),
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Icon(
                                  Icons.close,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                        const Divider(
                          thickness: 2,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.transparent)),
                          child: TextField(
                            autofocus: true,
                            controller: _enterTask,
                            style: TextStyle(fontSize: 20),
                            decoration: InputDecoration(
                              hintText: "Enter Task",
                              filled: false,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 90,
                          width: MediaQuery.of(context).size.width,
                          child: Row(children: [
                            Expanded(
                              child: Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: ElevatedButton(
                                    child: const Text("Clear",
                                        style: TextStyle(color: Colors.blue)),
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.white)),
                                    onPressed: () {
                                      _enterTask.text = "";
                                    },
                                  )),
                            ),
                            Expanded(
                              child: Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.white)),
                                    child: const Text("Ok",
                                        style: TextStyle(color: Colors.blue)),
                                    onPressed: () {
                                      saveData();
                                    })),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                )),
      ),
    );
  }
}
