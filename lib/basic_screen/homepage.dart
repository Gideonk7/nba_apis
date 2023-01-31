import 'package:flutter/material.dart';
import 'package:nba_api/basic_screen/overview.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, }) : super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('NBA API'),
        centerTitle: true,
      ),
      body:Overview(),
      );
  }
}
