import 'package:flutter/material.dart';

import 'item.dart';

class Cart extends ChangeNotifier {
  List<List<String>> pizzaDetails = [
    ['Cheesy Dream', '₹449', 'A Blend of Mozzarella, Cheddar, and Parmesan.'],
    ['Mint Medley', '₹469', 'A Refreshing Burst of Flavor in Every Bite!'],
    [
      'Spicy Volcano',
      '₹499',
      'Jalapeños, Spicy Marinara, and Mozzarella – A Fiery Explosion of Flavor!'
    ],
    [
      'Mediterranean Marvel',
      '₹489',
      'Sun-dried tomatoes, olives, feta cheese, and fresh basil.'
    ],
    ['Gourmet Garden Delight', '₹459', 'Fresh veggies, mushrooms, and herbs.'],
    ['Tropical Paradise', '₹479', 'Pineapple, ham, and sweet bell peppers.'],
    ['Firecracker Fiesta', '₹509', 'Spicy chorizo, jalapeños, and hot sauce.'],
  ];

  List<Item> menu = [];

  Cart() {
    for (int i = 0; i < pizzaDetails.length; i++) {
      menu.add(
        Item(
          name: pizzaDetails[i][0],
          price: pizzaDetails[i][1],
          desc: pizzaDetails[i][2],
          imagePath: 'lib/images/pizza${i + 1}.jpg',
        ),
      );
    }
  }

  List<Item> userCart = [];

  List<Item> getPizzaList() {
    return menu;
  }

  List<Item> getUserCart() {
    return userCart;
  }

  void cartAdd(Item item) {
    userCart.add(item);
    notifyListeners();
  }

  void cartRemove(Item item) {
    userCart.remove(item);
    notifyListeners();
  }
}
