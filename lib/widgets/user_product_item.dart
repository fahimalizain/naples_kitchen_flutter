import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/edit_product_screen.dart';
import '../providers/products.dart';

class UserProductItem extends StatelessWidget {
  final String id;
  final String title;
  final double price;
  final double quantity;


  UserProductItem(this.id, this.title,this.price,this.quantity);

  @override
  Widget build(BuildContext context) {
    final scaffold = Scaffold.of(context);
    return  ListTile(
      
        title: Text(title,
          style: TextStyle(fontSize:18,fontWeight: FontWeight.w600),
        ),
        subtitle: Text('\X$quantity',
        style: TextStyle(fontSize:14),
        ),
      
        trailing: Container(
          width: 190,
          child: Row(
         // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
             Expanded(child:
              Text('\$${(price *quantity).toStringAsFixed(2)}',
              style: TextStyle(fontSize:20,fontWeight: FontWeight.w300),
            
              ),
             ),
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  Navigator.of(context).pushNamed(EditProductScreen.routeName, arguments: id);
                },
                color: Theme.of(context).primaryColor,
              ),
              IconButton(
              icon: Icon(Icons.delete),
              onPressed: () async {
                try {
                  await Provider.of<Products>(context, listen: false)
                      .deleteProduct(id);
                } catch (error) {
                  scaffold.showSnackBar(
                    SnackBar(
                      content: Text('Deleting failed!', textAlign: TextAlign.center,),
                    ),
                  );
                }
              },
              color: Theme.of(context).errorColor,
            ),
            ],
          ),
        ),
  
    );
  }
}
