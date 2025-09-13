import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/restaurant_provider.dart';
import '../models/restaurant.dart';
import '../widgets/async_image.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final restaurants = ref.watch(restaurantsProvider);
    final categories = ref.watch(categoriesProvider);

    // Map of category -> image URL (use the provided URLs)
    final categoryImages = {
      'Burgers': 'https://images.unsplash.com/photo-1550547660-d9450f859349',
      'Burger': 'https://images.unsplash.com/photo-1550547660-d9450f859349',
      'Pizza': 'https://images.unsplash.com/photo-1601924582971-d3b6f89f28b1',
      'Pasta': 'https://images.unsplash.com/photo-1523983303491-3c9e1d76c9f0',
      'Sushi': 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c',
      'Salads': 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd',
      'Salad': 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd',
      'Italian': 'https://images.unsplash.com/photo-1601924582971-d3b6f89f28b1',
      'Fast Food': 'https://images.unsplash.com/photo-1550547660-d9450f859349',
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Orderly'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart))],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _searchBar(),
              const SizedBox(height: 12),
              SizedBox(
                height: 96,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, i) {
                    final cat = categories[i];
                    final img = categoryImages[cat] ?? categoryImages.entries.first.value;
                    return Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 120,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.white, boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)], border: Border.all(color: Colors.deepOrange, width: 1.5)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Stack(
                              children: [
                                Positioned.fill(child: AsyncImage(img, fit: BoxFit.cover)),
                                Container(
                                  alignment: Alignment.bottomLeft,
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(color: Colors.deepOrange.withOpacity(0.85), borderRadius: BorderRadius.circular(8)),
                                    child: Text(cat, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),
              const Text('Featured', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              SizedBox(
                height: 160,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: restaurants.length,
                  itemBuilder: (context, i) => _featuredCard(context, restaurants[i]),
                ),
              ),
              const SizedBox(height: 12),
              const Text('All Restaurants', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Column(
                children: restaurants.map((r) => _restaurantTile(context, r)).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchBar() {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        hintText: 'Search restaurants or dishes',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
    );
  }

  Widget _featuredCard(BuildContext context, Restaurant r) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed('/restaurant', arguments: r),
      child: Container(
        width: 260,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.white, boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)], border: Border.all(color: Colors.deepOrange, width: 2)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: AsyncImage(r.image, height: 100, width: 260, fit: BoxFit.cover, borderRadius: const BorderRadius.vertical(top: Radius.circular(12))),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(r.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text('${r.rating} • ${r.deliveryTime}'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _restaurantTile(BuildContext context, Restaurant r) {
    final thumbnail = r.menu.isNotEmpty ? r.menu.first.image : r.image;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(border: Border.all(color: Colors.deepOrange, width: 1.8), borderRadius: BorderRadius.circular(10), color: Colors.white, boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 3)]),
      child: InkWell(
        onTap: () => Navigator.of(context).pushNamed('/restaurant', arguments: r),
        child: Row(
          children: [
            ClipRRect(borderRadius: BorderRadius.circular(8), child: AsyncImage(thumbnail, width: 96, height: 80, fit: BoxFit.cover)),
            const SizedBox(width: 12),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(r.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 6),
                Text('${r.rating} • ${r.deliveryTime}', style: const TextStyle(color: Colors.black54)),
                const SizedBox(height: 4),
                Text(r.priceRange, style: const TextStyle(color: Colors.black87)),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
