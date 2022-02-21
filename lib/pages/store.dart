import 'package:catalog/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/cart.dart';

class MyStore extends VxStore {
  late CatalogModels catalog;
  late CartModel cart;

  MyStore() {
    catalog = CatalogModels();
    cart = CartModel();
    cart.catalog = catalog as CatalogModels;
  }
}
