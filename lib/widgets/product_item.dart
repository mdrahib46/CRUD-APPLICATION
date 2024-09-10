import 'package:crudapp/screens/update_product_Screen.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      tileColor:Colors.white,
      title: const Text('Product Name'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Product Code : Code'),
          const Text('Price : \$20'),
          const Text('Quantity : 20'),
          const Text('Total Price : \$220'),
           Divider( color: Colors.red.shade100,),
          ButtonBar(
            children: [
              TextButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> UpdateProductScreen()));
                },
                icon: const Icon(Icons.edit),
                label: const Text('Edit'),
              ),
              TextButton.icon(
                onPressed: () {},
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
}