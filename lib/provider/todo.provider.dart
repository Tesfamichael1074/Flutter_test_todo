import 'package:flutter/material.dart';
import 'package:test/model/todo.model.dart';

class TodoProvider extends ChangeNotifier {
  List<Todo> todo = [
    new Todo(
        name: "SHoping",
        description: "liasbifbasi aue fa fa efaw ef",
        status: "Done"),
    new Todo(
        name: "Glo",
        description: "ibweb aue fa fa efaw ef",
        status: "Pendding"),
    new Todo(
        name: "wjdw",
        description: "ibweb aue fa fa efaw ef",
        status: "Pendding"),
    new Todo(
        name: "wjw d",
        description: "ibweb aue fa fa efaw ef",
        status: "Pendding"),
    new Todo(
        name: "wnwdwd",
        description: "ibweb aue fa fa efaw ef",
        status: "Pendding"),
    new Todo(
        name: "gtrig",
        description: "ibweb aue fa fa efaw ef",
        status: "Pendding"),
  ];

  var queary = """ 
                    SELECT * FROM Salary ORDER BY salary DESC 
                    INNER JOIN Employee ON Employee.id = Salary.id
                    LIMIT 10;
              """;

  void addTodo(String name, String description, String status) {
    todo.add(new Todo(name: name, description: description, status: status));
    notifyListeners();
  }

  void deleteTodo(int index) {
    todo.removeAt(index);
    notifyListeners();
  }

  void editTodo(Todo newtodo, int index) {
    todo[index] = newtodo;
    notifyListeners();
  }
}
