import 'package:carshop/components/my_drawer.dart';
import 'package:carshop/components/my_list_tile.dart';
import 'package:carshop/components/my_product_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/shop.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop;
    final PageController pageController = PageController(viewportFraction: 0.9);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Garage"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              onPressed: () => Navigator.pushNamed(context, '/wishlist_page'),
              icon: const Icon(Icons.shopping_bag),
            ),
          )
        ],
      ),
      drawer: const MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: ListView(
        children: [
          const SizedBox(height: 25),
          Center(
            child: Text(
              "Got you some of the best out there!",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
          SizedBox(
            child: PageView.builder(
              controller: pageController,
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];

                return AnimatedBuilder(
                  animation: pageController,
                  builder: (context, child) {
                    double page = pageController.page ?? 0;
                    double scale =
                        (1 - (index - page).abs() * 0.3).clamp(0.9, 1.0);
                    double opacity =
                        (1 - (index - page).abs() * 0.5).clamp(0.7, 1.0);

                    return Opacity(
                      opacity: opacity,
                      child: Transform.scale(
                        scale: scale,
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: MyProductTile(product: product),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
