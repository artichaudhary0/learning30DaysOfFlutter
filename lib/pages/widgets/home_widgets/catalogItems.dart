import 'package:catalog/pages/utilities/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../models/catalog.dart';
import '../../utilities/themes.dart';
import 'catalogImage.dart';

class CatalogItems extends StatelessWidget {
  final Item catalog;
  const CatalogItems({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
              tag: Key(catalog.id.toString()),
              child: CatalogImage(image: catalog.image)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.lg.color(context.accentColor).bold.make(),
                catalog.desc.text
                    .textStyle(TextStyle(color: MyTheme.captionStyle))
                    .make(),
                10.heightBox,
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    "\$${catalog.price}".text.bold.xl.make(),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, MyRoutes.homeDetailRoute);
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            context.theme.buttonColor),
                        shape: MaterialStateProperty.all(StadiumBorder()),
                      ),
                      child: "Add to cart".text.make(),
                    ),
                  ],
                ).pOnly(right: 12.0),
              ],
            ),
          ),
        ],
      ),
    ).color(context.cardColor).roundedLg.square(150).make().py16();
  }
}
