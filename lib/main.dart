import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/model/todo.model.dart';
import 'package:test/provider/todo.provider.dart';

// import 'provider';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TodoProvider>(create: (_) => TodoProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Homepage(),
      ),
    );
  }
}

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController _namecontroller = new TextEditingController();
  TextEditingController _desccontroller = new TextEditingController();
  TextEditingController _statuscontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: screen.height,
          width: screen.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // ...Provider.of<TodoProvider>(context)
                //     .todo
                //     .map((Todo e) => ),

                Container(
                  height: screen.height * 0.6,
                  child: ListView.builder(
                      itemCount: Provider.of<TodoProvider>(context).todo.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {},
                          onDoubleTap: () {
                            Provider.of<TodoProvider>(context, listen: false)
                                .deleteTodo(index);
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 2),
                            child: Card(
                              child: ListTile(
                                title: Text(Provider.of<TodoProvider>(context)
                                    .todo[index]
                                    .name),
                                subtitle: Text(
                                    Provider.of<TodoProvider>(context)
                                        .todo[index]
                                        .description),
                                // trailing: Text(
                                //     Provider.of<TodoProvider>(context)
                                //         .todo[index]
                                //         .status),
                                trailing: TextButton(
                                  child: Text("Edit"),
                                  onPressed: () async {
                                    _namecontroller.text =
                                        Provider.of<TodoProvider>(context,
                                                listen: false)
                                            .todo[index]
                                            .name;
                                    _desccontroller.text =
                                        Provider.of<TodoProvider>(context,
                                                listen: false)
                                            .todo[index]
                                            .description;

                                    _statuscontroller.text =
                                        Provider.of<TodoProvider>(context,
                                                listen: false)
                                            .todo[index]
                                            .status;
                                    await showDialog(
                                        context: context,
                                        builder: (context) {
                                          return Scaffold(
                                            appBar: AppBar(
                                              backgroundColor: Colors.white,
                                              elevation: 0,
                                              leading: IconButton(
                                                icon: Icon(
                                                  Icons.cancel_outlined,
                                                  color: Colors.green,
                                                ),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ),
                                            body: Column(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 10),
                                                  child: TextFormField(
                                                    controller: _namecontroller,
                                                    decoration: InputDecoration(
                                                        hintText: "name"),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 10),
                                                  child: TextFormField(
                                                    controller: _desccontroller,
                                                    decoration: InputDecoration(
                                                        hintText:
                                                            "description"),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 10),
                                                  child: TextFormField(
                                                    controller:
                                                        _statuscontroller,
                                                    decoration: InputDecoration(
                                                        hintText: "status"),
                                                  ),
                                                ),
                                                Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10),
                                                    child: TextButton(
                                                      child: Text("Update"),
                                                      onPressed: () {
                                                        Provider.of<TodoProvider>(
                                                                context,
                                                                listen: false)
                                                            .editTodo(
                                                                new Todo(
                                                                    name: _namecontroller
                                                                        .text,
                                                                    description:
                                                                        _desccontroller
                                                                            .text,
                                                                    status:
                                                                        _statuscontroller
                                                                            .text),
                                                                index);

                                                        Navigator.pop(context);
                                                      },
                                                    )),
                                              ],
                                            ),
                                          );
                                        });
                                  },
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
