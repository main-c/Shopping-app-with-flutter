import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controllers/cart_controller.dart';
import 'package:weather_app/controllers/product_controller.dart';
import 'package:weather_app/screens/cart_screen.dart';
import 'package:weather_app/screens/search_screen.dart';
import 'package:weather_app/widgets/app_drawer.dart';
import 'package:weather_app/widgets/badge.dart';
import 'package:weather_app/widgets/productgrid.dart';

enum FilterOptions {
  FAVOURITES,
  ALL,
}

class ProductOverviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _showOnlyFavourites = false;
    final controller = Get.put(ProductController());
    final cartController = Get.put(CartController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white12,
        elevation: 1.0,
        title: const Text("My Shop"),
        actions: <Widget>[
          GetBuilder<ProductController>(
              init: ProductController(),
              builder: (productcontext) {
                return IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () => {
                    showSearch(
                      context: context,
                      delegate: CustomSearchDelegate(),
                    )
                  },
                );
              }),
          GetBuilder<CartController>(
              init: CartController(),
              builder: (contex) {
                return Badge(
                  child: IconButton(
                      icon: Icon(
                        Icons.shopping_cart,
                      ),
                      onPressed: () {
                        Get.to(() => CartScreen());
                      }),
                  value: cartController.itemCount.toString(),
                  color: Theme.of(context).accentColor,
                );
              }),
        ],
      ),
      drawer: AppDrawer(),
      body: ProductsGrid(_showOnlyFavourites),
    );
  }
}
