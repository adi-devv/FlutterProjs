import 'package:ecom/models/product.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class Shop extends ChangeNotifier {
  final List<List<dynamic>> _productDetails = [
    ['Aston Martin', 1.99, 'Faster product'],
    ['Lamborghini', 2.99, 'Second product'],
    ['Koenigsegg', 3.99, 'Third product'],
    ['Ferrari', 4.99, 'Fourth product'],
  ];

  late final List<Product> _shop;

  Shop() {
    _shop = [
      for (int i = 0; i < _productDetails.length; i++)
        Product(
          name: _productDetails[i][0],
          price: _productDetails[i][1],
          description: _productDetails[i][2],
          imagePath: _getImagePath('assets/image${i + 1}.jpg'),
        )
    ];
  }

  String _getImagePath(String path) {
    try {
      rootBundle.load(path);
      return path;
    } catch (e) {
      return 'assets/default.png';
    }
  }

  final List<Product> _cart = [];

  List<Product> get shop => _shop;

  List<Product> get cart => _cart;

  void cartAdd(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  void cartRemove(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
