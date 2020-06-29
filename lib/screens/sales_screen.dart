import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/edit_product_screen.dart';
import '../providers/products.dart';
import '../widgets/user_product_item.dart';


class SalesScreen extends StatefulWidget {
  static const routeName = '/tabs';
  @override
  _SalesScreenState createState() => new _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   iconTheme: IconThemeData(
      //     color: Colors.black, //change your color here
      //   ),
      //   title: Text(
      //     'Sales',
      //     style: TextStyle(color: Colors.black),
      //   ),
      //   centerTitle: true,
      //   backgroundColor: Colors.white,
      // ),
      body: new Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          new Container(
      margin: EdgeInsets.all(32),
            child: new TabBar(
              indicatorColor: Colors.black,
              controller: _controller,
              tabs: [
                new Tab(
                  child: Text(
                    'Expense',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                new Tab(
                  child: Text(
                    'Sales',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          new Container(
             height: MediaQuery.of(context).size.height *0.8,
            // height: 300.0,
            child: new TabBarView(
              controller: _controller,
              children: <Widget>[
                ExpenseScreen(),
                 SaleScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ExpenseScreen extends StatelessWidget {
  @override
 
  Widget build(BuildContext context) {
     final productsData = Provider.of<Products>(context);
    return Scaffold(
        body:
        // SingleChildScrollView(
           Container(
            
             child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.center,
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
        //),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () =>  Navigator.of(context).pushNamed(EditProductScreen.routeName)
        ),
        );
  }
}



class SaleScreen extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Container(
     margin: EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
                Text('das')
                 ],
      ),
    );
  }
}
