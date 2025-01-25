import 'package:flutter/foundation.dart'; // Import necesario
import 'package:sneaker_store/models/shoe_model.dart';

class Cart extends ChangeNotifier {
  // Lista de zapatos disponibles
  List<Shoe> shoeShop = [
    Shoe(
      name: 'Zoom FREAK',
      price: '236',
      imagePath: 'assets/images/sneakers-1.png',
      description: 'The forward-thinking design of the latest signature shoe',
    ),
    Shoe(
      name: 'Air Jordan',
      price: '220',
      imagePath: 'assets/images/sneakers-2.jpg',
      description:
      'You\'ve got the hops and the speed-lace up in shoes that enhance all',
    ),
    Shoe(
      name: 'KD Treys',
      price: '240',
      imagePath: 'assets/images/sneakers-3.png',
      description: 'The forward-thinking design of the latest signature shoe',
    ),
    Shoe(
      name: 'Kyrie 6',
      price: '190',
      imagePath: 'assets/images/sneakers-4.png',
      description:
      'Bouncy cushioning is paired with soft yet supportive foam',
    ),
  ];

  // Lista de productos en el carrito
  List<Shoe> userCart = [];

  // Obtener la lista de zapatos disponibles
  List<Shoe> getShoeList() => shoeShop;

  // Obtener el carrito del usuario
  List<Shoe> getUserCart() => userCart;

  // Añadir un producto al carrito
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners(); // Notifica a los listeners
  }

  // Eliminar un producto del carrito
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners(); // Notifica a los listeners
  }
}
