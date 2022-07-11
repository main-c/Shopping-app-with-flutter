import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controllers/product_controller.dart';
import 'package:weather_app/models/product.dart';

// Search Page
class CustomSearchDelegate extends SearchDelegate {
  final controller = Get.put(ProductController());

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          (query.isEmpty) ? close(context, null) : '';
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Product> matchQuery = [];
    List<Product> products = controller.items;
    for (var product in products) {
      if (product.title.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(product);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result.toString()),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Product> products = controller.items;
    List<Product> matchQuery = [];
    for (var product in products) {
      if (product.title.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(product);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result.toString()),
          );
        });
  }
}
