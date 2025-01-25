import 'package:flutter/material.dart';
import 'package:sneaker_store/models/cart_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: AnimatedSearchBar(),
        leading: Icon(Icons.menu, color: Colors.black),
        actions: [Icon(Icons.shopping_cart, color: Colors.black)],
      ),
      body: ListView.builder(
        itemCount: cart.shoeShop.length,
        itemBuilder: (context, index) {
          final shoe = cart.shoeShop[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Image.asset(shoe.imagePath, width: 50),
              title: Text(shoe.name),
              subtitle: Text('\$${shoe.price}'),
              trailing: IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  cart.addItemToCart(shoe);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${shoe.name} added to cart')),
                  );
                },
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Shop'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
        ],
      ),
    );
  }
}

class AnimatedSearchBar extends StatefulWidget {
  @override
  State<AnimatedSearchBar> createState() => _AnimatedSearchBarState();
}

class _AnimatedSearchBarState extends State<AnimatedSearchBar> {
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      width: isSearching ? 250 : 150,
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search...',
          prefixIcon: Icon(Icons.search),
          suffixIcon: isSearching
              ? IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              setState(() {
                isSearching = false;
              });
            },
          )
              : null,
        ),
        onTap: () {
          setState(() {
            isSearching = true;
          });
        },
      ),
    );
  }
}
