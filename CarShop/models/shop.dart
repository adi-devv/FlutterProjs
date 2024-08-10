import 'package:carshop/models/product.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class Shop extends ChangeNotifier {
  final List<List<dynamic>> _productDetails = [
    ['Maserati MC20', 210, 'Italian elegance with racing pedigree.'],
    ['Koenigsegg Jesko', 3000, 'Hypercar pushing speed limits.'],
    ['Aston Martin Vantage', 150, 'British luxury and sporty performance.'],
    ['Porsche 911', 120, 'Iconic sports car with timeless design.'],
    ['McLaren 750S', 330, 'High-performance with precision handling.'],
  ];

  late final List<Product> _shop;
  double _total = 0.0;

  Shop() {
    _shop = [
      for (int i = 0; i < _productDetails.length; i++)
        Product(
          name: _productDetails[i][0],
          price: _productDetails[i][1]*1000.toInt(),
          description: _productDetails[i][2],
          imagePath: 'assets/${_productDetails[i][0].replaceAll(' ', '_')}.jpg',
        )
    ];
  }

  final List<Product> _cart = [];

  List<Product> get shop => _shop;

  List<Product> get cart => _cart;

  double get total => _total;

  void _updateTotal() {
    _total = _cart.fold(0, (sum, item) => sum + item.price);
    debugPrint(_total.toString());
    notifyListeners();
  }

  void cartAdd(Product item) {
    _cart.add(item);
    _updateTotal();
  }

  void cartRemove(Product item) {
    _cart.remove(item);
    _updateTotal();
  }
}
