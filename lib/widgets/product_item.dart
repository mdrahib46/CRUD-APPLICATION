import 'dart:convert';

import 'package:crudapp/screens/update_product_Screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../models/product.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {

 bool _inProgress = false;


  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      tileColor: Colors.purple.shade50,
      leading: SizedBox(
        height: 70,
        width: 50,
        child: Image.network(
          widget.product.image,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) {
            return const Icon(Icons.image_outlined);
          },
        ),
      ),
      title: Text(widget.product.productName, style: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.5),),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Product Code : ${widget.product.productCode}'),
          Text('Unit Price : \$${widget.product.unitPrice}'),
          Text('Quantity : ${widget.product.quantity}'),
          Text('Total Price : \$${widget.product.totalPrice}'),
          Divider(
            color: Colors.red.shade100,
          ),
          ButtonBar(
            children: [
              TextButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UpdateProductScreen(product: widget.product)));
                },
                icon: const Icon(Icons.edit),
                label: const Text('Edit'),
              ),
              TextButton.icon(
                onPressed: () {
                  _deleteProduct(widget.product.id);
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.redAccent,
                ),
                label: const Text(
                  'Delete',
                  style: TextStyle(color: Colors.redAccent),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Future<void> _deleteProduct(String id) async{
    _inProgress = true;
    Uri url = Uri.parse('http://164.68.107.70:6060/api/v1/DeleteProduct/$id');
    Response response = await get(url);
    print(response.statusCode);
    print(response.body);
    // Map<String, dynamic> decodedResponse = jsonDecode(response.body);
    if(response.statusCode == 200){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Successfully product deleted....!')));
      setState(() {
      });
    }
    else{
      _inProgress = false;
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Product delete failed....!')));
      setState(() {});
    }
  }
}
