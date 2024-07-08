import 'package:flutter/material.dart';
import 'package:flutterecommerceapp/components/my_drawer.dart';
import 'package:flutterecommerceapp/components/my_product_tile.dart';
import 'package:flutterecommerceapp/models/shop.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {

    final products = context.watch<Shop>().shop;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Shop Page'),
        actions: [
          IconButton(
              onPressed: () => Navigator.pushNamed(context, '/cart_page'),
              icon: Icon(Icons.shopping_cart_outlined)
          )
        ],
      ),
      drawer: const MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: ListView(
        children: [
          SizedBox(height: 25,),

          Center(
              child: Text(
                  'Pick from a selected list of premium products',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
              ),
          ),

          SizedBox(
            height: 550,
            child: ListView.builder(
                itemCount: products.length,
                padding: EdgeInsets.all(15.0),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final product = products[index];

                  return MyProductTile(product: product);
                }
            ),
          ),
        ],
      )
    );
  }
}
