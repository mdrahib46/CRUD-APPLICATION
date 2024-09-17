import 'dart:convert';

import 'package:crudapp/models/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({super.key, required this.product});

  final Product product;

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  final TextEditingController _productNameTEController =
      TextEditingController();
  final TextEditingController _productUnitPriceTEController =
      TextEditingController();
  final TextEditingController _productTotalPriceTEController =
      TextEditingController();
  final TextEditingController _productCodeTEController =
      TextEditingController();
  final TextEditingController _productQuantityTEController =
      TextEditingController();
  final TextEditingController _productImageTEController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _productNameTEController.text = widget.product.productName;
    _productCodeTEController.text = widget.product.productCode;
    _productUnitPriceTEController.text = widget.product.unitPrice;
    _productQuantityTEController.text = widget.product.quantity;
    _productTotalPriceTEController.text = widget.product.totalPrice;
    _productImageTEController.text = widget.product.image;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _productNameTEController,
                decoration: const InputDecoration(
                  hintText: 'Product Name',
                  labelText: 'Product Name',
                ),
              ),
              TextFormField(
                controller: _productUnitPriceTEController,
                decoration: const InputDecoration(
                    hintText: 'Unit Price', labelText: 'Unit Price'),
              ),
              TextFormField(
                controller: _productTotalPriceTEController,
                decoration: const InputDecoration(
                  hintText: 'Total Price',
                  labelText: 'Total Price ',
                ),
              ),
              TextFormField(
                controller: _productCodeTEController,
                decoration: const InputDecoration(
                    hintText: 'Product Code', labelText: 'Product Code'),
              ),
              TextFormField(
                controller: _productQuantityTEController,
                decoration: const InputDecoration(
                    hintText: 'Quantity', labelText: 'Total Quantity'),
              ),
              TextFormField(
                controller: _productImageTEController,
                decoration: const InputDecoration(
                    hintText: 'Product Image', labelText: 'Product Image'),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                child: ElevatedButton(
                  onPressed: () {
                   _ontapUpdateProduct();
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size.fromWidth(double.maxFinite),
                      backgroundColor: Colors.red.shade100),
                  child: const Text('UPDATE'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _ontapUpdateProduct() {
    if (_formKey.currentState!.validate()) {
      _updateProduct(widget.product.id);
      _clearText();
      setState(() {});
    }
  }

  Future<void> _updateProduct(String id) async {
    Uri url = Uri.parse('http://164.68.107.70:6060/api/v1/UpdateProduct/$id');

    Map<String, dynamic> requestBody = {
      "Img": _productImageTEController.text.trim(),
      "ProductCode": _productCodeTEController.text.trim(),
      "ProductName": _productNameTEController.text.trim(),
      "Qty": _productQuantityTEController.text.trim(),
      "TotalPrice": _productTotalPriceTEController.text.trim(),
      "UnitPrice": _productUnitPriceTEController.text.trim(),
    };
    Response response = await post(url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestBody));
    if(response.statusCode == 200){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Updated data successfully ....!')));
      setState(() {});
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Updated data failed ....!')));
      setState(() {});
    }

  }

  void _clearText() {
    _productNameTEController.clear();
    _productUnitPriceTEController.clear();
    _productTotalPriceTEController.clear();
    _productCodeTEController.clear();
    _productQuantityTEController.clear();
    _productImageTEController.clear();
    setState(() {});
  }

  @override
  void dispose() {
    _productNameTEController.dispose();
    _productUnitPriceTEController.dispose();
    _productTotalPriceTEController.dispose();
    _productCodeTEController.dispose();
    _productQuantityTEController.dispose();
    _productImageTEController.dispose();
    super.dispose();
  }
}
