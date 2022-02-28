import 'package:catalog/pages/utilities/routes.dart';
import 'package:catalog/pages/widgets/home_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../models/catalog.dart';
import 'catalogItems.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Vx.isWeb
        ? GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 20),
            shrinkWrap: true,
            itemCount: CatalogModels.items.length,
            itemBuilder: (context, index) {
              final catalog = CatalogModels.items[index];
              return InkWell(
                onTap: () => context.vxNav.push(
                  Uri(
                      path: MyRoutes.homeDetailRoute,
                      queryParameters: {"id": catalog.id.toString()}),
                  params: catalog,
                ),
                child: CatalogItem(
                  catalog: catalog,
                ),
              );
            })
        : ListView.builder(
            shrinkWrap: true,
            itemCount: CatalogModels.items.length,
            itemBuilder: (context, index) {
              final catalog = CatalogModels.items[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeDetailPage(catalog: catalog),
                    ),
                  );
                },
                child: CatalogItem(
                  catalog: catalog,
                ),
              );
            },
          );
  }
}
