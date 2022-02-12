import 'catalogModel.dart';

class CartModel {
  // static List<Item> items = [];
  //
  // // Get Item by ID
  // static Item getById(int id) =>
  //     items.firstWhere((element) => element.id == id, orElse: null);
  //
  // // Get Item by position
  // static Item getByPosition(int pos) => items[pos];

  // Catalog Field
  late CatalogModel _catalog;

  // Collection of the ids - store ids of the added items
  final List<int> _itemIds = [];

  // Get the catalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  //  Get items in the carts by mapping their ids
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  //  Get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  //  Add items
  void add(Item item) {
    _itemIds.add(item.id);
  }

  // Remove items

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
