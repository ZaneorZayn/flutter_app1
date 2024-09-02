import 'package:flutter/material.dart';

import '../widget/custom_appbar1.dart';
class Productscreen extends StatelessWidget {
  const Productscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProductAppBar(),
    );
  }
}



class ProductAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  ProductAppBar({Key? key})
      : preferredSize = const Size.fromHeight(140.0), // Set the height of the AppBar
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 5,
      flexibleSpace: Container(
        padding: const EdgeInsets.only(top: 45, left: 16, right: 16, bottom: 10),
        decoration: const BoxDecoration(
          color: Colors.white,
          // Set the background color
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Product",style: Theme.of(context).textTheme.displayLarge,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      
                      icon: Icon(Icons.favorite,color: Colors.white,),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.shopping_cart, color: Colors.white),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Row(
                children: [
                   Icon(Icons.search, color: Colors.black54),
                  const SizedBox(width: 10),
                   Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Find your suitable product!',

                        )
                        ),
                      ),


                  const Icon(Icons.tune, color: Colors.black54),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

