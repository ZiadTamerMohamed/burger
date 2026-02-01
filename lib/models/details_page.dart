// import 'package:flutter/material.dart';
// import 'main.dart';

// class DetailsPage extends StatelessWidget {
//   final Product product;

//   const DetailsPage({super.key, required this.product});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(product.name)),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//             Image.asset(product.image, width: 230, height: 230),
//             const SizedBox(height: 20),
//             Text(product.name,
//                 style: const TextStyle(
//                     fontSize: 26, fontWeight: FontWeight.bold)),
//             Text("\$${product.price}",
//                 style: const TextStyle(
//                     fontSize: 22, color: Colors.orange)),
//             const SizedBox(height: 20),
//             const Text("Description:",
//                 style:
//                     TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//             Text(product.description),
//             const SizedBox(height: 20),
//             const Text("Ingredients:",
//                 style:
//                     TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//             Text(product.ingredients),
//           ],
//         ),
//       ),
//     );
//   }
// }
