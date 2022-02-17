import 'package:catalog/pages/utilities/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/catalog.dart';
import '../utilities/routes.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                    tag: Key(catalog.id.toString()),
                    child: Image.network(catalog.image))
                .h32(context)
                .py16(),
            Expanded(
                child: VxArc(
              height: 30,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Center(
                child: Container(
                  width: context.screenWidth,
                  color: context.cardColor,
                  child: Column(children: [
                    catalog.name.text.xl3
                        .color(context.accentColor)
                        .bold
                        .make(),
                    8.heightBox,
                    catalog.desc.text
                        .textStyle(TextStyle(color: MyTheme.captionStyle))
                        .xl
                        .make(),
                    10.heightBox,
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s. "
                        .text
                        .textStyle(TextStyle(color: MyTheme.captionStyle))
                        .make(),
                  ]).p32(),
                ),
              ),
            ))
          ],
        ).centered(),
      ),
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, MyRoutes.homeDetailRoute);
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(context.theme.buttonColor),
                shape: MaterialStateProperty.all(StadiumBorder()),
              ),
              child: Text("Add to Cart").text.xl.bold.make(),
            ).wh(150, 50),
          ],
        ).p32(),
      ),
    );
  }
}
