import 'package:catalog/models/cart.dart';
import 'package:catalog/models/catalog.dart';
import 'package:catalog/pages/store.dart';
import 'package:catalog/pages/utilities/routes.dart';
import 'package:catalog/pages/utilities/themes.dart';
import 'package:catalog/pages/widgets/drawers.dart';
import 'package:catalog/pages/widgets/home_widgets/catalogHeader.dart';
import 'package:catalog/pages/widgets/home_widgets/catalogList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    //final response = await http.get(
    //Uri.parse(url),
    //);
    //final catalogJson = response.body;
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModels.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;

    return Scaffold(
      appBar: AppBar(
        title: "Items".text.xl3.make(),
      ),
      backgroundColor: Theme.of(context).canvasColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (BuildContext context, store, VxStatus? status) =>
            FloatingActionButton(
          backgroundColor: context.theme.buttonColor,
          onPressed: () {
            context.vxNav.push(Uri.parse(MyRoutes.cartRoute));
          },
          child: Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
        ).badge(
                color: Vx.gray400,
                size: 22,
                count: _cart.items.length,
                textStyle: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModels.items != null && CatalogModels.items.isNotEmpty)
                CatalogList().py16().expand()
              else
                CircularProgressIndicator(
                  color: MyTheme.lightBluishColor,
                ).centered().expand(),
            ],
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
