



import 'package:flutter/material.dart';
import 'package:eneba_ecommerce/models/cart.dart';
import 'package:eneba_ecommerce/models/product.dart';

class CartService extends ChangeNotifier {
  final Cart _cart = Cart();

  Cart get cart => _cart;

  void addToCart(Product product) {
    final cartItem = CartItem(
      productId: product.id,
      productTitle: product.title,
      price: product.price,
      imageUrl: product.imageUrl,
    );
    _cart.addItem(cartItem);
    notifyListeners();
  }

  void removeFromCart(String productId) {
    _cart.removeItem(productId);
    notifyListeners();
  }

  void updateQuantity(String productId, int quantity) {
    _cart.updateQuantity(productId, quantity);
    notifyListeners();
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  bool isInCart(String productId) {
    return _cart.contains(productId);
  }

  int getCartItemCount() {
    return _cart.itemCount;
  }

  double getTotalPrice() {
    return _cart.totalPrice;
  }
}



