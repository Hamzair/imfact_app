import 'package:flutter/material.dart';

class BasicInfo extends StatefulWidget {
  const BasicInfo({super.key});

  @override
  State<BasicInfo> createState() => _BasicInfoState();
}

class _BasicInfoState extends State<BasicInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Campaign',
      style: TextStyle(
        
      ),),),
      body: Column(
        children: [
          Row(
            children: [
              Text('Basic info')
            ],
          )
        ],
      ),
    );
  }
}
