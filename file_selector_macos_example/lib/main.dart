import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter File Picker Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(title: 'File picker example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? imagePath;

  bool get hasImage => imagePath?.isNotEmpty == true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              hasImage
                  ? 'Selected image path: $imagePath'
                  : 'You have yet to select any image',
            ),
            if (hasImage)
              Container(
                margin: const EdgeInsets.all(16),
                width: double.infinity,
                child: Image.file(
                  File(imagePath!),
                  fit: BoxFit.cover,
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //TODO
        },
        tooltip: 'Open file selector',
        child: Icon(Icons.attach_file_outlined),
      ),
    );
  }
}
