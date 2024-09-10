import 'package:flutter/material.dart';


class UpdateProductScreen extends StatefulWidget {
   UpdateProductScreen({super.key});

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  final TextEditingController _productNameTEController = TextEditingController();

  final TextEditingController _productUnitPriceTEController = TextEditingController();

  final TextEditingController _productTotalPriceTEController = TextEditingController();

  final TextEditingController _productCodeTEController = TextEditingController();

  final TextEditingController _productQuantityTEController = TextEditingController();

  final TextEditingController _productImageTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const  Text('Update Product'),
      ),
      body: Padding(padding: const EdgeInsets.all(16),
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
                  hintText: 'Unit Price',
                  labelText: 'Unit Price'
                ),
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
                  hintText: 'Product Code',
                  labelText: 'Product Code'
                ),
              ),
              TextFormField(
                controller: _productQuantityTEController,
                decoration: const InputDecoration(
                  hintText: 'Quantity',
                  labelText: 'Total Quantity'
                ),
              ),
              TextFormField(
                controller: _productImageTEController,
                decoration: const InputDecoration(
                  hintText: 'Product Image',
                  labelText: 'Product Image'
                ),
              ),
              const SizedBox(height: 16,),
              SizedBox(
                child: ElevatedButton(onPressed: (){
                  _onTapAddProduct();
                }, style: ElevatedButton.styleFrom(
                  fixedSize: const Size.fromWidth(double.maxFinite),
                  backgroundColor: Colors.red.shade100
                ), child: const Text('UPDATE'),),
              )
            ],
          ),
        ),

      ),
    );
  }

  void _onTapAddProduct(){
    // Todo:- Add onTap Functionality
  }


  @override
  void dispose(){
    _productNameTEController.dispose();
    _productUnitPriceTEController.dispose();
    _productTotalPriceTEController.dispose();
    _productCodeTEController.dispose();
    _productQuantityTEController.dispose();
    _productImageTEController.dispose();
    super.dispose();

  }

}

