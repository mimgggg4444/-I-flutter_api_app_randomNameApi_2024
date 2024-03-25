import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api/model/user.dart';
import 'package:rest_api/services/user_api.dart';
import '../model/user_name.dart';

// http
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];

  @override
  void initState(){
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API TEST'),
      ),


      // 이름, 이메일, 프사
      body: ListView.builder
        (itemCount: users.length,
        itemBuilder: (context,index){
          final user = users[index];
          final email = user.email;
          final color = user.gender == 'male' ? Colors.blue : Colors.green;
          return ListTile(


            title: Text(user.fullName),
            subtitle: Text(user.location.postcode),
            tileColor: color,
          );
          },
      ),
    );
  }

  Future<void> fetchUsers() async{
    final response = await UserApi.fetchUser();
    setState(() {
      users = response;
    });
  }
}
