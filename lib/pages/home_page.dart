import 'package:catalog/models/catalog.dart';
import 'package:catalog/pages/widgets/drawers.dart';
import 'package:catalog/pages/widgets/item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import '../models/catalog.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(
      Duration(seconds: 2),
    );
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModels.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    int days = 30;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Catalog App',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModels.items != null && CatalogModels.items.isNotEmpty)
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                ),
                itemBuilder: (context, index) {
                  final item = CatalogModels.items[index];
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: GridTile(
                      child: Image.network(item.image),
                      header: Container(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          item.name,
                          style: TextStyle(color: Colors.white),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                        ),
                      ),
                      footer: Container(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          item.price.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  );
                },
                itemCount: CatalogModels.items.length,
              )
            : Center(
                child: CircularProgressIndicator(
                  color: Colors.deepPurple,
                ),
              ),
      ),
      drawer: MyDrawer(),
    );
  }
}
