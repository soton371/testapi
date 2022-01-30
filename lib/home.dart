import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var data;

  Future getData() async{
    // var url = Uri.parse("https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline");
    var url = Uri.parse("https://reqres.in/api/users?page=2");
    var response = await http.get(url);
    setState(() {
      var dataDecode = json.decode(response.body);
      //data = dataDecode;
      data = dataDecode["data"];
      print(data);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data View"),
      ),
      body: ListView.builder(
        itemCount: data==null?0:data.length,
          itemBuilder: (context,index){
          return ListTile(
            title: Text(data[index]["first_name"]),
          );
          }
      )
    );
  }
}
