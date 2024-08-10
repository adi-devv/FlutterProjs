import 'package:carshop/components/my_button.dart';
import 'package:carshop/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/shop.dart';
import '../utils.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

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
    final wList = context.watch<Shop>().wList;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Your Wish List"),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          Expanded(
            child: wList.isEmpty
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(50),
                      child: Text(
                        "Whoops! Looks like someone's got some shopping to do...",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                : ListView.builder(
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, bottom: 10),
                    itemCount: wList.length,
                    itemBuilder: (context, index) {
                      final item = wList[index];
                      return ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            item.imagePath,
                            errorBuilder: (context, error, stackTrace) {
                              debugPrint(
                                  'Error loading image -- ${error.toString()}');
                              return Opacity(
                                opacity: .3,
                                child: Image.asset(
                                  'assets/default.png',
                                ),
                              );
                            },
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(item.name),
                        subtitle: Text(Utils.formatCurrency(item.price)),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () => Utils.showDialogBox(
                                context: context,
                                message: "Remove this car from your wish list?",
                                onConfirm: () =>
                                    context.read<Shop>().cartRemove(item),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () => Utils.showDialogBox(
                                context: context,
                                message: "Add this car to your wish list?",
                                onConfirm: () =>
                                    context.read<Shop>().cartAdd(item),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                Divider(color: Colors.grey.shade400, thickness: 1),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("Total Amount", style: TextStyle(fontSize: 16)),
                    Consumer<Shop>(
                      builder: (context, value, child) {
                        return Text(
                          Utils.formatCurrency(value.total),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                MyButton(
                  onTap: () => payButtonPressed(context),
                  child: const Text(
                    'Proceed to pay',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
