import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_store/Splash.dart';
import 'package:sneaker_store/cart_screen.dart';
import 'package:sneaker_store/models/cart_model.dart';
import 'package:sneaker_store/widgets/shoe_card.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      backgroundColor: Colors.grey[400], // Fondo gris
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
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

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 10, right: 0),
              child: AnimatedSearchBar(),
            ),
            SizedBox(height: 58),
            Center(
              child: Text(
                "Everyone flies.. Some fly longer than others", // El texto que quieres centrar
                style: TextStyle(
                  fontSize: 14, // Tamaño del texto
                  fontWeight: FontWeight.normal, // Peso del texto
                  color: Colors.grey[700], // Color del texto
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 30, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Espacio entre los elementos
                children: [
                  // Texto "Hot Picks 🔥"
                  Text(
                    "Hot Picks 🔥",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  // Botón "See All"
                  GestureDetector(
                    onTap: () {
                      // Acción del botón (ahora vacío)
                    },
                    child: Text(
                      "See All",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800], // Color distintivo para el botón
                      ),
                    ),
                  ),
                ],
              ),
            ),


            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal, // Mostrar tarjetas en horizontal
                itemCount: cart.shoeShop.length,
                itemBuilder: (context, index) {
                  final shoe = cart.shoeShop[index];
                  return ShoeCard(shoe: shoe); // Usa el widget ShoeCard
                },
              ),

            ),
          ],
        ),
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
      duration: const Duration(milliseconds: 300),
      width: isSearching ? MediaQuery.of(context).size.width - 40 : 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              isSearching ? Icons.arrow_back_ios_new : Icons.search,
              color: Colors.grey[800],
            ),
            onPressed: () {
              setState(() {
                isSearching = !isSearching; // Cambia el estado
                print('isSearching: $isSearching'); // Depuración
              });
            },
          ),
          if (isSearching)
            Expanded(
              child: TextField(
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                ),
              ),
            ),
          if (isSearching)
            IconButton(
              icon: Icon(Icons.close, color: Colors.grey[800]),
              onPressed: () {
                setState(() {
                  isSearching = false; // Cierra la búsqueda
                });
              },
            ),
        ],
      ),
    );
  }
}
