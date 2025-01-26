import 'package:flutter/material.dart';
import 'package:sneaker_store/models/shoe_model.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_store/models/cart_model.dart';

class ShoeCard extends StatelessWidget {
  final Shoe shoe;

  const ShoeCard({Key? key, required this.shoe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Container(
      margin: const EdgeInsets.only(left: 10, top: 15, right: 10,), // Margen superior
      width: 290, // Ancho de la tarjeta
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 2,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagen en la parte superior
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              shoe.imagePath,
              height: 400, // Aumentar altura de la imagen
              width: double.infinity,
              fit: BoxFit.contain, // Asegura que la imagen sea visible
            ),
          ),
          // Descripción
          Padding(
            padding: const EdgeInsets.only(left: 14, top: 30, right: 14),
            child: Text(
              shoe.description,
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          // Nombre, precio y botón
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 10, right: 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Nombre y precio
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        shoe.name,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "\$${shoe.price}",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
                // Botón cuadrado para añadir al carrito
                Container(
                  height: 80,
                  width: 80,
                  decoration: const BoxDecoration(
                    color: Colors.black, // Fondo negro
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.add, color: Colors.white),
                    onPressed: () {
                      cart.addItemToCart(shoe);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Item added to cart")),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
