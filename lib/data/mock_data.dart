import '../models/restaurant.dart';

final mockRestaurants = <Restaurant>[
  Restaurant(
    id: 'r1',
    name: 'Mama Mia Pizza',
  image: 'https://images.unsplash.com/photo-1601924578878-3d8c1b6f5f9b?q=80&w=800&auto=format&fit=crop&ixlib=rb-4.0.3&s=1',
    rating: 4.5,
    deliveryTime: '25-35 min',
    priceRange: '',
    categories: ['Pizza', 'Italian'],
    menu: [
  Dish(id: 'd1', name: 'Margherita', image: 'https://images.unsplash.com/photo-1603071106879-6a3f1e0f1f28?q=80&w=800&auto=format&fit=crop&ixlib=rb-4.0.3&s=2', price: 7.5, category: 'Mains'),
  Dish(id: 'd2', name: 'Pepperoni', image: 'https://images.unsplash.com/photo-1548365328-9f5f4b5b6e6a?q=80&w=800&auto=format&fit=crop&ixlib=rb-4.0.3&s=3', price: 8.5, category: 'Mains'),
  Dish(id: 'd3', name: 'Tiramisu', image: 'https://images.unsplash.com/photo-1521302082979-3c4a2b3a9b2b?q=80&w=800&auto=format&fit=crop&ixlib=rb-4.0.3&s=4', price: 4.0, category: 'Desserts'),
    ],
  ),
  Restaurant(
    id: 'r2',
    name: 'Burger Hub',
  image: 'https://images.unsplash.com/photo-1550547660-d9450f859349',
    rating: 4.2,
    deliveryTime: '20-30 min',
    priceRange: '',
    categories: ['Burgers', 'Fast Food'],
    menu: [
  Dish(id: 'd4', name: 'Classic Burger', image: 'https://images.unsplash.com/photo-1551782450-a2132b4ba21d?q=80&w=800&auto=format&fit=crop&ixlib=rb-4.0.3&s=6', price: 6.0, category: 'Mains'),
  Dish(id: 'd5', name: 'Cheese Fries', image: 'https://images.unsplash.com/photo-1542444459-db9b3e6b6b3e?q=80&w=800&auto=format&fit=crop&ixlib=rb-4.0.3&s=7', price: 3.5, category: 'Starters'),
    ],
  ),
  Restaurant(
    id: 'r3',
    name: 'Green Salads',
  image: 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?q=80&w=800&auto=format&fit=crop&ixlib=rb-4.0.3&s=8',
    rating: 4.7,
    deliveryTime: '15-25 min',
    priceRange: '',
    categories: ['Salads', 'Healthy'],
    menu: [
  Dish(id: 'd6', name: 'Caesar Salad', image: 'https://images.unsplash.com/photo-1552332386-f8dd00dc2f85?q=80&w=800&auto=format&fit=crop&ixlib=rb-4.0.3&s=9', price: 5.0, category: 'Mains'),
  Dish(id: 'd7', name: 'Greek Salad', image: 'https://images.unsplash.com/photo-1568605114967-8130f3a36994?q=80&w=800&auto=format&fit=crop&ixlib=rb-4.0.3&s=10', price: 5.5, category: 'Mains'),
    ],
  ),
];
