import 'package:crudapp/screens/add_new_productScreen.dart';
import 'package:flutter/material.dart';

import '../widgets/product_item.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUD APP'),
      ),
      body: ListView.separated(
          itemCount: 20,
          itemBuilder: (context, index) {
            return const ProductItem();
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 4,);
          },),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddNewProductScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
