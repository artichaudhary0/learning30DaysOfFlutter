import 'package:catalog/pages/widgets/home_detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../models/catalog.dart';
import 'catalogItems.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModels.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModels.getItembyPos(index);
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeDetailPage(catalog: catalog),
              ),
            );
          },
          child: CatalogItems(
            catalog: catalog,
          ),
        );
      },
    );
  }
}
