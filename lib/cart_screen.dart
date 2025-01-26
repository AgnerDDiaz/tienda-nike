import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_store/Splash.dart';
import 'package:sneaker_store/models/cart_model.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Center(child: Text("My Cart          ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 28))),
        backgroundColor: Colors.grey[300],
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      drawer: Drawer(
        backgroundColor: Colors.black, // Fondo negro para el Drawer
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DrawerHeader(
              child: Image.asset('assets/images/nike4.png'), // Logo en el Drawer
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.white),
              title: Text('Home', style: TextStyle(color: Colors.white)),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.info, color: Colors.white),
              title: Text('About', style: TextStyle(color: Colors.white)),
              onTap: () {},
            ),
            Spacer(), // Empuja el Logout hacia el fondo
            ListTile(
              leading: Icon(Icons.logout, color: Colors.white),
              title: Text('Logout', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SplashScreen()),
                );
              },
            ),
          ],
        ),
      ),


      body: cart.getUserCart().isEmpty
          ? Center(
        child: Text(
          'Your cart is empty!',
          style: TextStyle(fontSize: 18, color: Colors.grey[700]),
        ),
      )
          : ListView.builder(
        itemCount: cart.getUserCart().length,
        itemBuilder: (context, index) {
          final shoe = cart.getUserCart()[index];
          return Card(
            color: Colors.grey[100],

            margin: const EdgeInsets.only(left: 20, top: 10, right: 20),
            child: ListTile(
              leading: Image.asset(shoe.imagePath, width: 100,),
              title: Text(shoe.name, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("\$${shoe.price}"),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.black),
                onPressed: () {
                  cart.removeItemFromCart(shoe);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("${shoe.name} removed from cart"),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
