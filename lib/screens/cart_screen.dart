import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/cart_provider.dart';
import '../widgets/async_image.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
    final subtotal = ref.read(cartProvider.notifier).subtotal;
    const deliveryFee = 2.5;
    final total = subtotal + deliveryFee;

    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: cart
                    .map((c) => Container(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          decoration: BoxDecoration(border: Border.all(color: Colors.deepOrange, width: 1.5), borderRadius: BorderRadius.circular(8), color: Colors.white),
                          child: ListTile(
                            leading: AsyncImage(c.dish.image, width: 56, height: 56, fit: BoxFit.cover, borderRadius: BorderRadius.circular(8)),
                            title: Text(c.dish.name),
                            subtitle: Text('\$${c.dish.price.toStringAsFixed(2)} x ${c.quantity}'),
                            trailing: IconButton(
                                onPressed: () => ref.read(cartProvider.notifier).changeQuantity(c.dish.id, c.quantity - 1),
                                icon: const Icon(Icons.remove_circle)),
                          ),
                        ))
                    .toList(),
              ),
            ),
            const SizedBox(height: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Subtotal: \$${subtotal.toStringAsFixed(2)}'),
                Text('Delivery: \$${deliveryFee.toStringAsFixed(2)}'),
                Text('Total: \$${total.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                ElevatedButton(onPressed: () => Navigator.of(context).pushNamed('/checkout'), child: const Text('Checkout')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
