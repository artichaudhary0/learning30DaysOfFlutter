import 'package:catalog/pages/widgets/drawers.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int days = 30;
    return Scaffold(
      appBar: AppBar(
        title: Text('hello'),
      ),
      body: Center(
        child: Container(
          child: Text('stating from beginning $days days'),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
