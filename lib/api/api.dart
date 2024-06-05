import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:praktikum10_22sa11a021_bibitraikhan/constant/bantuan.dart';

class CallApi {
  Future postData(data, apiUrl, BuildContext context) async {
    try {
      http.Response hasilRespons =
          await http.post(Uri.parse(baseUrl + apiUrl), body: data);
      print(hasilRespons.statusCode);
      print(hasilRespons.body);
      if (hasilRespons.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Simpan data berhasil")));
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  Future putData(data, apiUrl, BuildContext context) async {
    try {
      http.Response hasilRespons =
          await http.put(Uri.parse(baseUrl + apiUrl), body: data);
      print(hasilRespons.statusCode);
      print(hasilRespons.body);
      if (hasilRespons.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Update data berhasil")));
        return true;
      } else if (hasilRespons.statusCode == 201) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Hapus data berhasil")));
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  Future delData(data, apiUrl, BuildContext context) async {
    try {
      http.Response hasilRespons = await http.delete(
        Uri.parse(baseUrl + apiUrl),
        body: data,
      );
      print(hasilRespons.statusCode);
      print(hasilRespons.body);
      
      if (hasilRespons.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Hapus data berhasil"),
          ),
        );
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
}
