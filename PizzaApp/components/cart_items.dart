import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5), // Optional: add vertical margin for spacing between items

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
      ),
    );
  }
}
