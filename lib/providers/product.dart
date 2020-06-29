import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final double quantity;
  final double price;
 // final String imageUrl;
  //bool isFavorite;

  Product({
    @required this.id,
    @required this.title,
     this.quantity = 1,
    @required this.price,
    //@required this.imageUrl,
    //this.isFavorite = false,
  });


}
