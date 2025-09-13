import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/restaurant.dart';
import '../data/mock_data.dart';

final restaurantsProvider = Provider<List<Restaurant>>((ref) {
  // In real app we'd fetch from API. For now return mock data.
  return mockRestaurants;
});

final categoriesProvider = Provider<List<String>>((ref) {
  final restaurants = ref.watch(restaurantsProvider);
  final cats = <String>{};
  for (var r in restaurants) {
    cats.addAll(r.categories);
  }
  return cats.toList();
});
