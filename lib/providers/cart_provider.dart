import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/cart_item.dart';
import '../models/restaurant.dart';

class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier(): super([]);

  void addToCart(Dish dish) {
    final index = state.indexWhere((c) => c.dish.id == dish.id);
    if (index >= 0) {
      state[index].quantity += 1;
      state = [...state];
    } else {
      state = [...state, CartItem(dish: dish)];
    }
  }

  void removeFromCart(String dishId) {
    state = state.where((c) => c.dish.id != dishId).toList();
  }

  void changeQuantity(String dishId, int qty) {
    final index = state.indexWhere((c) => c.dish.id == dishId);
    if (index >= 0) {
      if (qty <= 0) {
        removeFromCart(dishId);
      } else {
        state[index].quantity = qty;
        state = [...state];
      }
    }
  }

  double get subtotal => state.fold(0.0, (s, c) => s + c.total);
}

final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>((ref) => CartNotifier());
