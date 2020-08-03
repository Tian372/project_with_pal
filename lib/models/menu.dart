class Item {
  String name;
  String price;

  Item({this.name, this.price});
}

class Menu {
  final String menuId;
  List<Item> items;


  Menu({this.menuId, this.items});
}