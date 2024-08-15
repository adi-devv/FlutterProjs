import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';
import '../models/item.dart';

class CartItem extends StatefulWidget {
  Item item;

  CartItem({
    super.key,
    required this.item,
  });

  @override
  State<CartItem> createState() => _MyCartState();
}

class _MyCartState extends State<CartItem> {
  void cartRemove() {
    Provider.of<Cart>(context, listen: false).cartRemove(widget.item);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: Colors.grey[100], borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            widget.item.imagePath,
            width: 112,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(widget.item.name),
        subtitle: Text(widget.item.price),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: cartRemove,
        ),
      ),
    );
  }
}
