import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingcart_app/models/shoe.dart';

import '../components/shoe_tile.dart';
import '../models/cart.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  //add shoe to cart
  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemsToCart(shoe);

    //alert the user, shoe successfully added
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Successfully added!'),
          content: Text('Check your cart'),
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) =>
          Column(
            children: [
              //search bar
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Search',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),

              //message
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0),
                child: Text(
                  'everyone flies.. some fly longer than others',
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              ),

              //hot picks
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Hot Picks 🔥',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      'See all',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              //list of shoes for sale

              Expanded(
                child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    //get a shoe from shop list
                    Shoe shoe = value.getShoeList()[index];

                    //return the shoe
                    return ShoeTile(
                      shoe: shoe,
                      onTap: () => addShoeToCart(shoe),
                    );
                  },
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
                child: Divider(
                  color: Colors.white,
                ),
              )
            ],
          ),
    );
  }
}
