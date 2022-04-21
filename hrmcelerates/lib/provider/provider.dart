import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class EmployeeProvider with ChangeNotifier {
  Map<String, dynamic> _singleemlpoyee = {};
  Map<String, dynamic> get singleemployeename => _singleemlpoyee;

  List<dynamic> _alldataemployee = [];
  List<dynamic> get alldataemployee => _alldataemployee;

  List<dynamic> _alldataPaidleave = [];
  List<dynamic> get alldataPaidLeave => _alldataPaidleave;

  int get allgetdatapaidleave => _alldataPaidleave.length;

  int get allgetdataEmployee => _alldataemployee.length;

  void getallEmployee() async {
    Uri url = Uri.parse("https://reqres.in/api/users?page=1");
    var responseemp = await http.get(url);
    var jsonObjectdata = json.decode(responseemp.body);
    _alldataemployee = (jsonObjectdata as Map<String, dynamic>)["data"];
    notifyListeners();
  }

  void getallCutiEmployee() async {
    Uri url = Uri.parse("https://reqres.in/api/users?page=2");
    var responsepaidemployee = await http.get(url);
    var jsonobpaidleave = json.decode(responsepaidemployee.body);
    _alldataPaidleave = (jsonobpaidleave as Map<String, dynamic>)["data"];
    notifyListeners();
  }

  void getemployeebyid(String id) async {
    Uri url = Uri.parse("https://reqres.in/api/users/" + id);
    var responseemployee = await http.get(url);
    _singleemlpoyee = (json.decode(responseemployee.body))['data'];
    notifyListeners();
  }
}
