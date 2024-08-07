import 'package:ecom/models/product.dart';

class Shop {
  final List<List<dynamic>> _productDetails = [
    ['Product 1', 1.99, 'First product'],
    ['Product 2', 2.99, 'Second product'],
    ['Product 3', 3.99, 'Third product'],
    ['Product 4', 4.99, 'Fourth product'],
  ];

  late final List<Product> _shop;

  Shop() {
    _shop = [
      for (var details in _productDetails)
        Product(
          name: details[0],
          price: details[1],
          description: details[2],
        )
    ];
  }

  List<Product> _cart = [];

  List<Product> get shop => _shop;

  List<Product> get cart => _cart;

  void addToCart(Product item) {
    _cart.add(item);
  }

  void removeFromCart(Product item) {
    _cart.remove(item);
  }
}
