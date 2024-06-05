import 'dart:convert';

import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:praktikum10_22sa11a021_bibitraikhan/constant/bantuan.dart';
import 'package:praktikum10_22sa11a021_bibitraikhan/constant/ukuran.dart';
import 'package:praktikum10_22sa11a021_bibitraikhan/constant/user_edit_delete.dart';
import 'package:praktikum10_22sa11a021_bibitraikhan/constant/users_add.dart';

class Users extends StatefulWidget {
  const Users({super.key});

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  List widgets = [];

  @override
  void initState() {
    super.initState();
  }

  void onReady() {
    //
  }

  void onResume() {
    //loadData();
  }

  void onPause() {
    //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Latihan HTTP',
              style: TextStyle(fontSize: ukuranHurufBesar),
            ),
            Text(
              'Users',
              style: TextStyle(fontSize: ukuranHurufKecil),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const UsersAdd(),
            ),
          );
        },
      ),
      body: ListView.builder(itemBuilder: (BuildContext context, int position) {
        return getRow(position);
      }),
    );
  }

  Widget getRow(int i) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: GestureDetector(
        onTap: () {
          gid = widgets[i]['id'];
          gusername = widgets[i]['username'];
          gpassword = widgets[i]['password'];
          gfirstname = widgets[i]['firstname'];
          glastname = widgets[i]['lastname'];
          gaddress = widgets[i]['address'];
          gage = widgets[i]['age'];

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const UsersEditDelete(),
            ),
          );
        },
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${widgets[i]['username']}',
                style: TextStyle(fontSize: ukuranHurufBesar),
              ),
              Text(
                '${widgets[i]['password']}',
                style: TextStyle(fontSize: ukuranHurufBesar),
              ),
              Text(
                '${widgets[i]['firstname']}',
                style: TextStyle(fontSize: ukuranHurufKecil),
              ),
              Text(
                '${widgets[i]['lastname']}',
                style: TextStyle(fontSize: ukuranHurufKecil),
              ),
              Text(
                '${widgets[i]['address']}',
                style: TextStyle(fontSize: ukuranHurufKecil),
              ),
              Text(
                '${widgets[i]['age']}',
                style: TextStyle(fontSize: ukuranHurufKecil),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> loadData() async {
    var dataURL = Uri.parse(baseUrl + 'users');
    http.Response response = await http.get(dataURL);
    setState(() {
      widgets = jsonDecode(response.body);
    });
  }
}
