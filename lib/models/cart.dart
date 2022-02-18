import 'package:catalog/models/catalog.dart';

class CartModel {
  //catalog field
  late CatalogModels _catalog;

  set catalog(CatalogModels newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  } //get catalog

  CatalogModels get catalog =>
      _catalog; //collection of ids store id of each item

  final List<int> _itemIds = [];

  //get itme in the cart

  Iterable get items => _itemIds.map((id) => _catalog.getItemById(id)).toList();

  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // add item
  void add(Item item) {
    _itemIds.add(item.id);
  }

  //remove item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
