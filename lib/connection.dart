import 'package:desktop_video/controller/network_connection_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyConnection extends StatefulWidget {
  const MyConnection({Key? key}) : super(key: key);

  @override
  _MyConnectionState createState() => _MyConnectionState();
}

class _MyConnectionState extends State<MyConnection> {
  final networkController = Get.put(NetworkConnectionController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Network"),
        ),
        body: _buildbody,
      ),
    );
  }
  Widget get _buildbody{
    return Obx((){
      return Center(
        child: Text(networkController.networkStatus.value),
      );
    });
  }
}
