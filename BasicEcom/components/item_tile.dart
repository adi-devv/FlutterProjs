import 'package:flutter/material.dart';

import '../models/item.dart';

class ItemTile extends StatelessWidget {
  Item item;

  ItemTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25),
      width: 200,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Image.asset(item.imagePath),
        ],
      ),
    );
  }
}
