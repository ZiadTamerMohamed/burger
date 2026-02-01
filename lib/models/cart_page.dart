import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/CartProvider.dart';
import '../Providers/ThemeProvider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
          ),
        ],
      ),
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          final carts = cartProvider.carts;
          if (carts.isEmpty) {
            return const Center(
              child: Text(
                "No items in cart yet",
                style: TextStyle(fontSize: 25),
              ),
            );
          }
          return ListView.builder(
            itemCount: carts.length,
            itemBuilder: (context, index) {
              final product = carts[index];
              return ListTile(
                leading: Image.asset(
                  product.image,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(product.name),
                subtitle: Text("\$${product.price}"),
                trailing: IconButton(
                  icon: const Icon(Icons.remove, color: Colors.red),
                  onPressed: () {
                    cartProvider.removeFromCart(product);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
