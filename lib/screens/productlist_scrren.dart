import 'dart:convert';
import 'package:crudapp/screens/add_new_productScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../models/product.dart';
import '../widgets/product_item.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<Product> productList = [];
  bool _inProgress = false;

  @override
  void initState() {
    super.initState();
    _getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUD APP'),
        backgroundColor: Colors.purple.shade100,
        actions: [
          IconButton(
              onPressed: () {
                _getProduct();
                setState(() {});
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: _inProgress ? const Center(child: CircularProgressIndicator(),): Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemCount: productList.length,
          itemBuilder: (context, index) {
            return ProductItem(
              product: productList[index],
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 10,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddNewProductScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }



  Future<void> _getProduct() async {
    productList.clear();
    _inProgress = true;
    Uri url = Uri.parse('http://164.68.107.70:6060/api/v1/ReadProduct');
    Response response = await get(url);
    print(response.statusCode);
    print(response.body);
    final Map<String, dynamic> decodedResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      for (var item in decodedResponse['data']) {
        Product product = Product(
            id: item["_id"] ?? '',
            productName: item["ProductName"] ?? '',
            productCode: item["ProductCode"] ?? '',
            unitPrice: item["UnitPrice"] ?? '',
            quantity: item["Qty"] ?? '',
            totalPrice: item["TotalPrice"] ?? '',
            image: item['Img'] ?? '');
        productList.add(product);
      }
    }
    _inProgress = false;
    setState(() {});
  }


}
