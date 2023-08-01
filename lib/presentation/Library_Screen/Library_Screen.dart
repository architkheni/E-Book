import 'package:flutter/material.dart';

class LibraryScreen extends StatefulWidget {
  LibraryScreen({Key? key}) : super(key: key);

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        color: Colors.blue[300],
      ),
    ));
  }
}
