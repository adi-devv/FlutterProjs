import 'package:ecom_basic/components/cart_item.dart';
import 'package:ecom_basic/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/item.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'My Cart',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: value.getUserCart().length,
                itemBuilder: (context, index) {
                  Item itemChoice = value.getUserCart()[index];
                  return CartItem(item: itemChoice);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
