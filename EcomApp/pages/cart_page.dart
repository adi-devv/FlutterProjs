import 'package:ecom/components/my_button.dart';
import 'package:ecom/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/shop.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void cartRemove(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text("Remove this item from your cart?"),
        actions: [
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<Shop>().cartRemove(product);
            },
            child: const Text("Yea"),
          ),
        ],
      ),
    );
  }

  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        content: Text(
          'User wants to pay! Integrate payments\' system.',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Cart Page"),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          Expanded(
            child: cart.isEmpty
                ? const Center(
                  child: Padding(
                    padding: EdgeInsets.all(50),
                    child: Text(
                        "Whoops! Looks like someone got some shopping to do...",
                        textAlign: TextAlign.center,
                      ),
                  ),
                )
                : ListView.builder(
                    padding: const EdgeInsets.all(15),
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final item = cart[index];
                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text(
                          item.price.toStringAsFixed(2),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () => cartRemove(context, item),
                        ),
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(50),
            child: MyButton(
              onTap: () => payButtonPressed(context),
              child: const Text(
                'Proceed to pay',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
