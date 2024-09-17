import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class AddNewProductScreen extends StatefulWidget {
  AddNewProductScreen({super.key});

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}

bool _inProgress = false;

class _AddNewProductScreenState extends State<AddNewProductScreen> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 20),
                TextFormField(
                  controller: _productNameTEController,
                  decoration: const InputDecoration(
                    hintText: 'Product Name',
                    labelText: 'Product Name',
                  ),
                  validator: (String? value) {
                    if (value == null) {
                      return "Enter a product name";
                    }
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _productCodeTEController,
                  decoration: const InputDecoration(
                      hintText: 'Product Code', labelText: 'Product Code'),
                  validator: (String? value) {
                    if (value == null) {
                      return "Enter product code";
                    }
                  },
                ),

                const SizedBox(height: 10),
                TextFormField(
                  controller: _productUnitPriceTEController,
                  decoration: const InputDecoration(
                      hintText: 'Unit Price', labelText: 'Unit Price'),
                  validator: (String? value) {
                    if (value == null) {
                      return "Enter unit price";
                    }
                  },
                ),

                const SizedBox(height: 10),
                TextFormField(
                  controller: _productTotalPriceTEController,
                  decoration: const InputDecoration(
                    hintText: 'Total Price',
                    labelText: 'Total Price ',
                  ),
                  validator: (String? value) {
                    if (value == null) {
                      return "Enter total price";
                    }
                  },
                ),

                const SizedBox(height: 10),
                TextFormField(
                  controller: _productQuantityTEController,
                  decoration: const InputDecoration(
                      hintText: 'Quantity', labelText: 'Total Quantity'),
                  validator: (String? value) {
                    if (value == null) {
                      return "Enter product quantity";
                    }
                  },
                ),

                const SizedBox(height: 10),
                TextFormField(
                  controller: _productImageTEController,
                  decoration: const InputDecoration(
                      hintText: 'Product Image', labelText: 'Product Image'),
                  validator: (String? value){
                    if (value == null) {
                      return "Enter image url";
                    }
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  child: _inProgress ? const Center(child: CircularProgressIndicator(),): ElevatedButton(
                    onPressed: () {
                      _onTapAddProduct();
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size.fromWidth(double.maxFinite),
                        backgroundColor: Colors.red.shade100),
                    child: const Text('Add Product'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapAddProduct() {
    if (_formKey.currentState!.validate()) {
      _addNewProduct();
      _clearText();
    }
  }

  Future<void> _addNewProduct() async {
    _inProgress = true;
    setState(() {});
    Uri url = Uri.parse('http://164.68.107.70:6060/api/v1/CreateProduct');

    final Map<String, dynamic> requestBody = {
      "Img": _productImageTEController.text.trim(),
      "ProductCode": _productCodeTEController.text.trim(),
      "ProductName": _productNameTEController.text.trim(),
      "Qty": _productQuantityTEController.text.trim(),
      "TotalPrice": _productTotalPriceTEController.text.trim(),
      "UnitPrice": _productUnitPriceTEController.text.trim(),
    };

    Response response = await post(
      url,
      headers: {"Content-type": "application/json"},
      body: jsonEncode(requestBody),
    );
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      _clearText();
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Add product successfully....!'),),);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Add product failed....!'),),);
    }
    _inProgress = false;
    setState(() {});
  }

  void _clearText() {
    _productNameTEController.clear();
    _productCodeTEController.clear();
    _productUnitPriceTEController.clear();
    _productQuantityTEController.clear();
    _productTotalPriceTEController.clear();
    _productImageTEController.clear();
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
