import 'package:ecom_basic/components/item_tile.dart';
import 'package:flutter/material.dart';
import '../models/item.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(36),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Search',
                style: TextStyle(color: Colors.grey),
              ),
              Icon(
                Icons.search,
                color: Colors.grey,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Text(
            'everyone hoohaa ooooooooooo oooooooooooo',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hot Pics ‍🔥👙",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            Text(
              'Tip Her To See All',
              style: TextStyle(color: Colors.pink),
            )
          ],
        ),
        const SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              Item item = Item(
                name: 'thor',
                price: '699',
                desc: 'odin daughter',
                imagePath: 'lib/images/o5.webp',
              );
              return ItemTile(
                item: item,
              );
            },
          ),
        )
      ],
    );
  }
}
