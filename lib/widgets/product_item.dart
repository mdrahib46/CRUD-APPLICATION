import 'package:crudapp/screens/productlist_scrren.dart';
import 'package:crudapp/screens/update_product_Screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../models/product.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({super.key, required this.product});

  final Product product;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
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
      title: Text(
        widget.product.productName,
        style: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.5),
      ),
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
                      builder: (context) =>
                          UpdateProductScreen(product: widget.product),
                    ),
                  );
                },
                icon: const Icon(Icons.edit),
                label: const Text('Edit'),
              ),
              TextButton.icon(
                onPressed: () {
                  _onTapDeleteProduct();
                  setState(() {});
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.redAccent,
                ),
                label: const Text(
                  'Delete',
                  style: TextStyle(color: Colors.redAccent),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _onTapDeleteProduct() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: Colors.grey.shade100,
        title: const Text('Delete....!'),
        content: const Text('Are you want to delete this product.?'),
        actions: [
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pop(context);
              setState(() {});
            },
            icon: const Icon(
              Icons.cancel,
              color: Colors.redAccent,
            ),
            label: const Text(
              'cancel',
              style: TextStyle(color: Colors.redAccent),
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {
              _deleteProduct(widget.product.id);
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProductListScreen(),
                  ),
                  (route) => false);
              setState(() {});
            },
            icon: const Icon(
              Icons.check,
              color: Colors.green,
            ),
            label: const Text(
              'proceed',
              style: TextStyle(color: Colors.green),
            ),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade100),
          ),
        ],
      ),
    );
  }

  Future<void> _deleteProduct(String id) async {
    Uri url = Uri.parse('http://164.68.107.70:6060/api/v1/DeleteProduct/$id');
    Response response = await get(url);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Successfully product deleted....!')));
      setState(() {});
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Product delete failed....!')));
      setState(() {});
    }
  }
}
