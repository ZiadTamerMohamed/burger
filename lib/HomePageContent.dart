// import 'package:flutter/material.dart';
// import 'main.dart';
// import 'details_page.dart';

// class HomePageContent extends StatelessWidget {
//   final TabController tabController;
//   final List<String> categories;
//   final List<Product> products;

//   const HomePageContent({
//     super.key,
//     required this.tabController,
//     required this.categories,
//     required this.products,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: categories.length,
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.orange,
//           title: const Text("Hot & Fast Food"),
//           bottom: TabBar(
//             controller: tabController,
//             isScrollable: true,
//             tabs: categories.map((c) => Tab(text: c)).toList(),
//           ),
//         ),
//         body: TabBarView(
//           controller: tabController,
//           children: categories.map((c) {
//             List<Product> filtered =
//                 products.where((p) => p.category == c).toList();

//             return GridView.builder(
//               padding: const EdgeInsets.all(10),
//               gridDelegate:
//                   const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 mainAxisSpacing: 10,
//                 crossAxisSpacing: 10,
//                 childAspectRatio: 0.75,
//               ),
//               itemCount: filtered.length,
//               itemBuilder: (context, index) {
//                 var item = filtered[index];
//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) => DetailsPage(product: item),
//                       ),
//                     );
//                   },
//                   child: Card(
//                     elevation: 5,
//                     child: Column(
//                       children: [
//                         Expanded(
//                           child: Image.asset(item.image,
//                               fit: BoxFit.cover),
//                         ),
//                         Text(item.name,
//                             textAlign: TextAlign.center,
//                             style: const TextStyle(
//                                 fontWeight: FontWeight.bold)),
//                         Text("\$${item.price}"),
//                         const SizedBox(height: 5),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }
// }
