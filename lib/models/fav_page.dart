import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/FavoritesProvider.dart';
import '../Providers/ThemeProvider.dart';

class FavPage extends StatelessWidget {
  const FavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"),
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
      body: Consumer<FavoritesProvider>(
        builder: (context, favoritesProvider, child) {
          final favorites = favoritesProvider.favorites;
          if (favorites.isEmpty) {
            return const Center(
              child: Text("No favorites yet", style: TextStyle(fontSize: 25)),
            );
          }
          return ListView.builder(
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              final product = favorites[index];
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
                    favoritesProvider.removeFromFavorites(product);
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
