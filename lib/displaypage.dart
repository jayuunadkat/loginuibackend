import 'package:flutter/material.dart';
import 'package:loginuibackend/formpage1.dart';
import 'package:loginuibackend/insertpagebackend.dart';
import 'package:sqflite/sqflite.dart';

class displatpage extends StatefulWidget {
  const displatpage({Key? key}) : super(key: key);

  @override
  State<displatpage> createState() => _displatpageState();
}

class _displatpageState extends State<displatpage> {
  bool status = false;
  List<Map<String, Object?>> l = List.empty(growable: true);
  Database? db;

  @override
  void initState() {
    super.initState();
    getalldata();
  }

  getalldata() async {
    db = await DBHelper().createDatabase();
    String qry = "select * from userdata";
    List<Map<String, Object?>> x = await db!.rawQuery(qry);
    l.addAll(x);
    print(l);
    status = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FormData"),
      ),
      body: status
          ? (l.length > 0
          ? ListView.builder(
        itemCount: l.length,
        itemBuilder: (context, index) {
          Map m = l[index];
          return ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return demo1("update",map:m);
              },));
            },
            onLongPress: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return AlertDialog(
                    title: Text("Delete"),
                    content: Text(
                        "Are You Sure You Want to Delete This Data?"),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            int id = m['id'];
                            String qry =
                                "delete from userdata where id = '$id'";
                            db!.rawDelete(qry).then((value) => {
                              setState(() {
                                l.removeAt(index);
                                print(l);
                              },),
                            });
                          },
                          child: Text("Yes")),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("No")),
                    ],
                  );
                },
              ));
            },
            leading: Text("${m['id']}"),
            title: Text("${m['name']}"),
            subtitle: Text("${m['contact']}"),
          );
        },
      )
          : Center(child: Text("No Data Found")))
          : Center(child: CircularProgressIndicator()),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
                return demo1("insert");
              }));
        },
      ),
    );
  }
}
