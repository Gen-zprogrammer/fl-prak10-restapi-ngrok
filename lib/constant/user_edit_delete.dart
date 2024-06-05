import 'package:flutter/material.dart';
import 'package:praktikum10_22sa11a021_bibitraikhan/api/api.dart';
import 'package:praktikum10_22sa11a021_bibitraikhan/constant/bantuan.dart';
import 'package:praktikum10_22sa11a021_bibitraikhan/constant/constant_color.dart';
import 'package:praktikum10_22sa11a021_bibitraikhan/constant/ukuran.dart';

class UsersEditDelete extends StatefulWidget {
  const UsersEditDelete({super.key});

  @override
  State<UsersEditDelete> createState() => _UsersEditDeleteState();
}

class _UsersEditDeleteState extends State<UsersEditDelete> {
  TextEditingController controllerid = TextEditingController();
  TextEditingController controllerusername = TextEditingController();
  TextEditingController controllerpassword = TextEditingController();
  TextEditingController controllerfirstname = TextEditingController();
  TextEditingController controllerlastname = TextEditingController();
  TextEditingController controlleraddress = TextEditingController();
  TextEditingController controllerage = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      controllerid.text = gid;
      controllerusername.text = gusername;
      controllerpassword.text = gpassword;
      controllerfirstname.text = gfirstname;
      controllerlastname.text = glastname;
      controlleraddress.text = gaddress;
      controllerage.text = gage;
    });
  }

  _edit() {
    var data = {
      'username': controllerusername.text,
      'password': controllerpassword.text,
      'firstname': controllerfirstname.text,
      'lastname': controllerlastname.text,
      'adsress': controlleraddress.text,
      'age': controllerage.text,
    };

    var res = CallApi().putData(data, 'users/' + controllerid.text, context);
    Navigator.pop(context);
  }

  _hapus() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Hapus Data'),
          content: const Text('Apakah Anda Yakin?'),
          actions: [
            TextButton(
              onPressed: () async {
                var data = {
                  'jenis': 'hapus',
                  'idUsers': controllerusername.text,
                };

                var res = CallApi()
                    .delData(data, 'users/' + controllerid.text, context);

                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text('Ya!'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text('Tidak!'),
            ),
          ],
        );
      },
    );
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
              "Update Users",
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
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(
                    label: Text('Users Name'),
                    hintText: 'Users Nama',
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
                  controller: controllerfirstname,
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
                  margin: const EdgeInsets.only(top: .0),
                  width: (double.infinity) / 2,
                  height: 45,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: warnaTombol,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      _edit();
                    },
                    child: const Text(
                      "Simpan",
                      style: TextStyle(
                        color: warnaTulisanTombol,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 4.0),
                  width: (double.infinity) / 2,
                  height: 45,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: warnaTombol,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      _hapus();
                    },
                    child: const Text(
                      "Hapus",
                      style: TextStyle(
                        color: warnaTulisanTombol,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
