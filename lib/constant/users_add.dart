import 'package:flutter/material.dart';
import 'package:praktikum10_22sa11a021_bibitraikhan/api/api.dart';
import 'package:praktikum10_22sa11a021_bibitraikhan/constant/constant_color.dart';
import 'package:praktikum10_22sa11a021_bibitraikhan/constant/ukuran.dart';

class UsersAdd extends StatefulWidget {
  const UsersAdd({super.key});

  @override
  State<UsersAdd> createState() => _UsersAddState();
}

class _UsersAddState extends State<UsersAdd> {
  TextEditingController controllerusername = TextEditingController();
  TextEditingController controllerpassword = TextEditingController();
  TextEditingController controllerfirstname = TextEditingController();
  TextEditingController controllerlastname = TextEditingController();
  TextEditingController controlleraddress = TextEditingController();
  TextEditingController controllerage = TextEditingController();

  _simpan() async {
    var data = {
      'username': controllerusername.text,
      'password': controllerpassword.text,
      'firstname': controllerfirstname.text,
      'lastname': controllerlastname.text,
      'adsress': controlleraddress.text,
      'age': controllerage.text,
    };
    bool res = await CallApi().postData(data, 'users', context);
    Navigator.pop(context);
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
              "Latihan HTTP",
              style: TextStyle(
                fontSize: ukuranHurufBesar,
              ),
            ),
            Text(
              "Tambah USer",
              style: TextStyle(
                fontSize: ukuranHurufKecil,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(
                    label: Text('User Name'),
                    hintText: 'User Name',
                  ),
                  controller: controllerusername,
                ),
                TextField(
                  decoration: const InputDecoration(
                    label: Text('Password'),
                    hintText: 'Password',
                  ),
                  controller: controllerpassword,
                ),
                TextField(
                  decoration: const InputDecoration(
                    label: Text('First Name'),
                    hintText: 'First Name',
                  ),
                  controller: controllerpassword,
                ),
                TextField(
                  decoration: const InputDecoration(
                    label: Text('Last Name'),
                    hintText: 'Last Name',
                  ),
                  controller: controllerlastname,
                ),
                TextField(
                  decoration: const InputDecoration(
                    label: Text('Address'),
                    hintText: 'Address',
                  ),
                  controller: controlleraddress,
                ),
                TextField(
                  decoration: const InputDecoration(
                    label: Text('Age'),
                    hintText: 'Age',
                  ),
                  controller: controllerage,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  width: double.infinity,
                  height: 45,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: warnaTombol,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                    onPressed: () {
                      _simpan();
                    },
                    child: const Text(
                      'Simpan',
                      style: TextStyle(color: warnaTulisanTombol),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
