import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../models/User.dart';

class DashboardScreen extends StatefulWidget {
  // const DashboardScreen({super.key});
  // static String routeName = "/dashboard";

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _id = 1;
  List<User> _user = [];
  bool _isloading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Dashboard"),
        ),
        body: ModalProgressHUD(
          inAsyncCall: _isloading,
          child: ListView.builder(
              itemCount: _user.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.all(30),
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent, width: 1)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network(_user[index].avatarurl),
                      Text("${_user[index].firstname} ${_user[index].lastname}")
                    ],
                  ),
                );
              }),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: getNewUser,
          child: const Icon(Icons.add),
        ));
  }

  getNewUser() async {
    setState(() {
      _isloading = true;
    });
    var response =
        await http.get(Uri.parse('https://reqres.in/api/users/$_id'));
    User user = User.toJson(response.body);
    setState(() {
      _user.add(user);
      _id++;
      _isloading = false;
    });
  }
}
