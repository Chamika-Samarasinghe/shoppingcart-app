import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:shoppingcart_app/models/shoe.dart';

class Cart extends ChangeNotifier{
  //list of shoe for sale
  List<Shoe> shoeShop = [
    Shoe(
        name: 'Nike Dunk Low',
        price: '115.00',
        imagePath: 'lib/images/shoe1.png',
        description: 'Womens Shoes',
    ),

    Shoe(
      name: 'Nike Air Force 1',
      price: '135.00',
      imagePath: 'lib/images/shoe2.png',
      description: 'Custom Mens Shoes',
    ),

    Shoe(
      name: 'Nike Air Max',
      price: '200.00',
      imagePath: 'lib/images/shoe3.png',
      description: 'Back to the Future Part 2',
    ),

    Shoe(
      name: 'Nike Dunk High',
      price: '155.00',
      imagePath: 'lib/images/shoe4.png',
      description: 'Custom Mens Shoes',
    ),

  ];

//get list of items in user cart
List<Shoe> userCart = [];


  //get list of shoe for sale
List<Shoe> getShoeList() {
  return shoeShop;
}

  //get cart
  List<Shoe> getUserCart() {
    return userCart;
  }
//add item to cart
void addItemsToCart(Shoe shoe) {
  userCart.add(shoe);
  notifyListeners();
}

//remove item from cart
  void removeItemsToCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }


}
