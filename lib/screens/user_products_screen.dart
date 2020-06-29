import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import '../widgets/user_product_item.dart';
//import '../widgets/app_drawer.dart';
import './edit_product_screen.dart';

class UserProductsScreen extends StatefulWidget {
 // static const routeName = '/user-products';

  @override
  _UserProductsScreenState createState() => _UserProductsScreenState();
}

class _UserProductsScreenState extends State<UserProductsScreen> {
 var _isInit = true;
  var _isLoading = false;
//   @override
//  void initState() {
//     // Provider.of<Products>(context).fetchAndSetProducts(); // WON'T WORK!
//     // Future.delayed(Duration.zero).then((_) {
//     //   Provider.of<Products>(context).fetchAndSetProducts();
//     // });
//     super.initState();
//   }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Products>(context).fetchAndSetProducts().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }



  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Expenses'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
          ),
        ],
      ),
    
      body : _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
      : Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: <Widget>[
            Text('\Total: ${productsData.totalAmount.toStringAsFixed(2)}',
             style: TextStyle(fontSize:24,fontWeight: FontWeight.w500),
            ),
            
            Expanded(
              //child: Padding(
                //padding: EdgeInsets.all(2),
                child:
                 ListView.builder(
                  itemCount: productsData.items.length,
                  itemBuilder: (_, i) => Column(
                        children: [
                          UserProductItem(
                            productsData.items[i].id,
                            productsData.items[i].title,
                            productsData.items[i].price,
                            productsData.items[i].quantity,
                           // productsData.items[i].imageUrl,
                          ),
                           new Divider(
                          height: 0.001,
            color: Colors.grey,
          ),
                        ],
                      ),
                ),
              ),
            
          ],
        ),
      ),
    );
  }
}
