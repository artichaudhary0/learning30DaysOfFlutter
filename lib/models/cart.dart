import 'package:catalog/models/catalog.dart';
import 'package:catalog/pages/store.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  //catalog field
  late CatalogModels _catalog;
  final List<int> _itemIds = [];

  set catalog(CatalogModels newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  } //get catalog

  List<Item> get items =>
      _itemIds.map((id) => _catalog.getItemById(id)).toList();

  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  //get itme in the cart
  CatalogModels get catalog =>
      _catalog; //collection of ids store id of each item

  //remove item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;
  AddMutation(this.item);

  @override
  perform() {
    store?.cart._itemIds.add(item.id);
  }
}
