import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/fav_page.dart';
import 'models/cart_page.dart';
import 'models/profile_page.dart';
import 'product.dart';
import 'Providers/ThemeProvider.dart';
import 'Providers/FavoritesProvider.dart';
import 'Providers/CartProvider.dart';

void main() {
  runApp(const MyApp());
}

final lightTheme = ThemeData(
  brightness: Brightness.light,
  // Customize light theme colors and properties
  primarySwatch: Colors.blue,
  // ... other properties
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  // Customize dark theme colors and properties
  primarySwatch: Colors.indigo,
  // ... other properties
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => FavoritesProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: themeProvider.themeMode,
            home: const HomePage(),
          );
        },
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;
  final List<Widget> pages = [
    Container(), // Placeholder for home, handled in build
    FavPage(),
    CartPage(),
    ProfilePage(),
  ];
  final List<Product> products = [
    // Burger Products
    Product(
      name: 'Cheese Burger',
      category: 'Burger',
      price: 55,
      image: 'assets/images/Cheese Burger.jpg',
      description: 'A delicious cheese burger',
      ingredients: 'Bread, beef, cheese',
    ),
    Product(
      name: 'Double Burger',
      category: 'Burger',
      price: 65,
      image: 'assets/images/Double Burger.jpg',
      description: 'A double patty burger',
      ingredients: 'Bread, double beef patties, lettuce, tomato',
    ),
    Product(
      name: 'Turkey  Burger',
      category: 'Burger',
      price: 80,
      image: 'assets/images/Turkey.jpg',
      description: 'A delicious turkey burger',
      ingredients: 'Bread, turkey, lettuce, tomato',
    ),
    Product(
      name: 'Chicken Cheese Burger',
      category: 'Burger',
      price: 75,
      image: 'assets/images/chicken-burgers.jpg',
      description: 'A delicious chicken cheese burger',
      ingredients: 'Bread, chicken, cheese, lettuce, tomato',
    ),
    // Pizza Products
    Product(
      name: 'Pepperoni Pizza',
      category: 'Pizza',
      price: 80,
      image: 'assets/images/Pepperoni Pizza.jpg',
      description: 'A classic pepperoni pizza',
      ingredients: 'Dough, tomato sauce, cheese, pepperoni',
    ),
    Product(
      name: 'Veggie Pizza',
      category: 'Pizza',
      price: 75,
      image: 'assets/images/Veggie Pizza.jpg',
      description: 'A healthy veggie pizza',
      ingredients: 'Dough, tomato sauce, cheese, vegetables',
    ),
    Product(
      name: 'Roman Pizza',
      category: 'Pizza',
      price: 75,
      image: 'assets/images/Roman Pizza.jpg',
      description: 'A traditional Roman pizza',
      ingredients: 'Dough, tomato sauce, cheese, basil',
    ),
    Product(
      name: 'Detroit Pizza',
      category: 'Pizza',
      price: 75,
      image: 'assets/images/Detroit pizza.jpg',
      description: 'A square Detroit-style pizza',
      ingredients: 'Dough, tomato sauce, cheese, pepperoni',
    ),
    // Cheese Products
    Product(
      name: 'Four Cheese Mix',
      category: 'Cheese',
      price: 45,
      image: 'assets/images/Four Cheese Mix.jpg',
      description: 'A creamy blend of four cheeses.',
      ingredients: 'Mozzarella, Parmesan, Gruyère, Ricotta',
    ),
    Product(
      name: 'Cheddar Cheese',
      category: 'Cheese',
      price: 40,
      image: 'assets/images/Cheddar Cheese.jpg',
      description: 'Strong flavored cheddar cheese.',
      ingredients: 'Milk, Salt, Rennet',
    ),
    Product(
      name: 'Blue Cheese',
      category: 'Cheese',
      price: 50,
      image: 'assets/images/Blue Cheese.jpg',
      description: 'Creamy and tangy blue cheese.',
      ingredients: 'Milk, Penicillium roqueforti, Salt',
    ),
    Product(
      name: 'Parmesan Cheese',
      category: 'Cheese',
      price: 48,
      image: 'assets/images/Parmesan Cheese.jpg',
      description: 'Aged Parmesan cheese, rich in flavor.',
      ingredients: 'Cow Milk, Salt, Rennet',
    ),

    // Pasta Products
    Product(
      name: 'Spaghetti Carbonara',
      category: 'Pasta',
      price: 70,
      image: 'assets/images/Spaghetti Carbonara.jpg',
      description: 'Classic spaghetti with creamy carbonara sauce.',
      ingredients: 'Spaghetti, Egg, Parmesan, Bacon',
    ),
    Product(
      name: 'Penne Alfredo Cheese',
      category: 'Pasta',
      price: 75,
      image: 'assets/images/Penne Alfredo Cheese.jpg',
      description: 'Penne pasta in rich Alfredo cheese sauce.',
      ingredients: 'Penne, Cream, Mozzarella, Parmesan, Butter',
    ),
    Product(
      name: 'Lasagna Four Cheese',
      category: 'Pasta',
      price: 80,
      image: 'assets/images/Lasagna Four Cheese.jpg',
      description: 'Four-cheese lasagna with tomato sauce.',
      ingredients:
          'Lasagna pasta, Mozzarella, Ricotta, Gruyère, Parmesan, Tomato Sauce',
    ),
    Product(
      name: 'Fettuccine Pesto Pasta',
      category: 'Pasta',
      price: 68,
      image: 'assets/images/Fettuccine Pesto Pasta.jpg',
      description: 'Fettuccine pasta with basil pesto and cheese.',
      ingredients: 'Fettuccine, Basil, Parmesan, Olive Oil, Pine Nuts',
    ),
  ];
  final List<String> categories = ['Burger', 'Pizza', 'Cheese', 'Pasta'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: categories.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _currentIndex == 0
          ? AppBar(
              title: const Text("Hot & Fast Food"),
              backgroundColor: Colors.orange,
              actions: [
                IconButton(
                  icon: const Icon(Icons.brightness_6),
                  onPressed: () {
                    Provider.of<ThemeProvider>(
                      context,
                      listen: false,
                    ).toggleTheme();
                  },
                ),
              ],
              bottom: TabBar(
                controller: _tabController,
                isScrollable: true,
                tabs: categories.map((c) => Tab(text: c)).toList(),
              ),
            )
          : null,
      body: _currentIndex == 0
          ? TabBarView(
              controller: _tabController,
              children: categories.map((c) => buildList(c, context)).toList(),
            )
          : pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.orange,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Fav"),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
  // Widget build(BuildContext context) {
  //   return DefaultTabController(
  //     length: categories.length,
  //     child: Scaffold(
  //       appBar: AppBar(
  //         title: const Text("Hot & Fast Food"),
  //         backgroundColor: Colors.orange,
  //         bottom: TabBar(
  //           controller: _tabController,
  //           isScrollable: true,
  //           tabs: categories.map((c) => Tab(text: c)).toList(),
  //         ),
  //       ),
  //       body: TabBarView(
  //         controller: _tabController,
  //         children: categories.map((c) => buildList(c, context)).toList(),
  //       ),

  //       bottomNavigationBar: BottomNavigationBar(
  //         currentIndex: 0,
  //         backgroundColor: Colors.grey,
  //         selectedItemColor: Colors.orange,
  //         unselectedItemColor: Colors.orange,
  //         items: const [
  //           BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
  //           BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Fav"),
  //           BottomNavigationBarItem(
  //             icon: Icon(Icons.shopping_cart),
  //             label: "Cart",
  //           ),
  //           BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget buildList(String category, BuildContext context) {
    List<Product> filtered = products
        .where((item) => item.category == category)
        .toList();

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.75,
      ),
      itemCount: filtered.length,
      itemBuilder: (context, index) {
        var item = filtered[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => DetailsPage(
                  name: item.name,
                  category: item.category,
                  price: item.price,
                  image: item.image,
                  description: item.description,
                  ingredients: item.ingredients,
                ),
              ),
            );
          },
          child: Card(
            elevation: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(child: Image.asset(item.image, fit: BoxFit.cover)),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    item.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("\$${item.price}", textAlign: TextAlign.center),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(
                        Provider.of<FavoritesProvider>(context).isFavorite(item)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        if (Provider.of<FavoritesProvider>(
                          context,
                          listen: false,
                        ).isFavorite(item)) {
                          Provider.of<FavoritesProvider>(
                            context,
                            listen: false,
                          ).removeFromFavorites(item);
                        } else {
                          Provider.of<FavoritesProvider>(
                            context,
                            listen: false,
                          ).addToFavorites(item);
                        }
                      },
                    ),
                    Consumer<CartProvider>(
                      builder: (context, cartProvider, child) {
                        return IconButton(
                          icon: Icon(
                            Icons.shopping_cart,
                            color: cartProvider.isCarted(item)
                                ? Colors.green
                                : Colors.blue,
                          ),
                          onPressed: () {
                            if (cartProvider.isCarted(item)) {
                              cartProvider.removeFromCart(item);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    '${item.name} removed from cart',
                                  ),
                                ),
                              );
                            } else {
                              cartProvider.addToCart(item);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('${item.name} added to cart'),
                                ),
                              );
                            }
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Home Page"));
  }
}

class FavScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Favorites Page"));
  }
}

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Cart Page"));
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Profile Page"));
  }
}

class DetailsPage extends StatelessWidget {
  final String name;
  final String category;
  final double price;
  final String image;
  final String description;
  final String ingredients;

  const DetailsPage({
    super.key,
    required this.name,
    required this.category,
    required this.price,
    required this.image,
    required this.description,
    required this.ingredients,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset(image, width: 230, height: 230)),
            const SizedBox(height: 20),
            Text(
              name,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            Text(
              "\$$price",
              style: const TextStyle(fontSize: 22, color: Colors.orange),
            ),
            const SizedBox(height: 20),
            const Text(
              "Description:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(description),
            const SizedBox(height: 20),
            const Text(
              "Ingredients:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(ingredients),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 15,
                  ),
                ),
                onPressed: () {},
                child: const Text("Buy Now", style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
