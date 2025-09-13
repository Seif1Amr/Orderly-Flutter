import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/restaurant.dart';
import '../providers/cart_provider.dart';
import '../widgets/async_image.dart';

class RestaurantDetailScreen extends ConsumerWidget {
  const RestaurantDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Restaurant r = ModalRoute.of(context)!.settings.arguments as Restaurant;

    final categories = <String>{};
    for (var d in r.menu) {
      categories.add(d.category);
    }

    return Scaffold(
      appBar: AppBar(title: Text(r.name)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AsyncImage(r.image, width: double.infinity, height: 200, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(r.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  Text('${r.rating} • ${r.deliveryTime}'),
                  const SizedBox(height: 12),
                  const Text('Menu', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            ...categories.map((cat) => _menuCategory(context, cat, r.menu.where((d) => d.category == cat).toList(), ref)),
          ],
        ),
      ),
    );
  }

  Widget _menuCategory(BuildContext context, String title, List<Dish> dishes, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Column(
            children: dishes
                  .map((d) => Container(
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        decoration: BoxDecoration(border: Border.all(color: Colors.deepOrange, width: 1.5), borderRadius: BorderRadius.circular(8), color: Colors.white),
                        child: ListTile(
                          leading: AsyncImage(d.image, width: 64, height: 64, fit: BoxFit.cover, borderRadius: BorderRadius.circular(8)),
                          title: Text(d.name),
                          subtitle: Text('\$${d.price.toStringAsFixed(2)}'),
                          trailing: ElevatedButton(
                            onPressed: () => ref.read(cartProvider.notifier).addToCart(d),
                            child: const Text('Add'),
                          ),
                        ),
                      ))
                  .toList(),
          )
        ],
      ),
    );
  }
}
