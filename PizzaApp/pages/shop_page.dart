import 'package:ecom_basic/components/item_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';
import '../models/item.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void cartAdd(Item item) {
    Provider.of<Cart>(context, listen: false).cartAdd(item);
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text('Successfully added!'),
        content: Text('Check your cart!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(36),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
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
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 10),
            child: Text(
              'Hungry?  Me too!',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 25, right: 25, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Hot Pizzah!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Text(
                  'Customize',
                  style: TextStyle(
                    color: Colors.deepOrangeAccent,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(right: 25),
              itemCount: value.getPizzaList().length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                Item item = value.getPizzaList()[index];
                return ItemTile(
                  item: item,
                  onTap: () => cartAdd(item),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 25, left: 25, right: 25),
            child: Divider(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
