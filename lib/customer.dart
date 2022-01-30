import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class CustomerScreen extends StatefulWidget {
  const CustomerScreen({Key? key}) : super(key: key);

  @override
  _CustomerScreenState createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  
  var data;
  
  Future getData() async{
    var url = Uri.parse("https://gmanager.net/connector/api/contactapi?type=customer");
    var response = await http.get(url,headers: {
      "Authorization":"Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjllOWE0NzBlNjhlODE5MzZkNGU1ZDc3YmQ3NWM2NDBiM2I2NjEyMjg1YTdmYzBmZDRmNmM2NWYxMTJmOTE2Y2Y0Yjg5MzRjNWRiZjZjZWZlIn0.eyJhdWQiOiIzIiwianRpIjoiOWU5YTQ3MGU2OGU4MTkzNmQ0ZTVkNzdiZDc1YzY0MGIzYjY2MTIyODVhN2ZjMGZkNGY2YzY1ZjExMmY5MTZjZjRiODkzNGM1ZGJmNmNlZmUiLCJpYXQiOjE2NDA5Njk3NjYsIm5iZiI6MTY0MDk2OTc2NiwiZXhwIjoxNjcyNTA1NzY2LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.o38t7PL8K_QaXAm1GaGDD-N5MxBMQKa755QHJ_nVvfsUm7qQjmcBfsRkocAiE0x3vsfTLS0a6i_1hLtKAhvRW-R7ythUFX6UMD-lGz1DTVilXXmXb2GBspPHS69u38xSEyOzwqjx-coCiA_OJbzvwxlSJPL0VkYZ3SUoPDsMb9aU-ej_piURaCvfYDgIkOtewL2pg5NbA5WR41Xf3wqmXZVOykV1eNrSK_b6_bp1-cqD0sx37cB-fpxJRCl8RAYYPt-sK9YnUW-US2slNOtqUQUIYKXYjBt8AbaN1ToVGXe4rKvtKDyDnDEUmHuMbUmPFYtWxr8gkPmNEdq5Vw7lv2XZL8fWFknRNHlARmQBMVtESTf4gL_xOtnZFcraisMZhvwzpY9GdccjSq4QlOP7fUWMcTA7nCXtq0nxs4OUKO17dxilYBuq5a-XhNWmjj91cTSGU1VCcri6vZhlMy8qr0ly2LI_xpd66QwkWnnuRg7ybtKvoTq9ydgpxrnTsAOlFtwpB2Dl3mABdRnydSwWhIek6FADFRQX8IcWIS03Q9pfDaWuH0WW1Ec7fEeJaWnalD9gMql2MEyd-e649XnXC0fO9KQKcfDBrhtSlwE7pK1vLfQBdQa6dhmmsJUxce6lc1z5Oh6Yd4Ep0EeTRlve2X_pNAwh7-8U3fxbxtjjmeE"
    });

    setState(() {
      var decodeData = json.decode(response.body);
      data = decodeData["data"];
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
        title: Text("Customers"),
      ),
      body: ListView.builder(
        itemCount: data==null?0:data.length,
          itemBuilder: (context,index){
          return Text(data[index]["name"]);
          }
      ),
    );
  }
}
