


import 'package:flutter/material.dart';
import 'package:eneba_ecommerce/models/product.dart';
import 'package:eneba_ecommerce/widgets/product_card.dart';
import 'package:eneba_ecommerce/widgets/category_card.dart';
import 'package:eneba_ecommerce/widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Product> _featuredProducts = [
    Product(
      id: '1',
      title: 'Cyberpunk 2077',
      description: 'Open-world RPG adventure in Night City',
      price: 29.99,
      originalPrice: 59.99,
      imageUrl: '',
      category: 'PC Games',
      discount: 50,
      isFeatured: true,
      platforms: ['PC', 'PS5', 'Xbox'],
    ),
    Product(
      id: '2',
      title: 'Elden Ring',
      description: 'Action RPG masterpiece from FromSoftware',
      price: 39.99,
      originalPrice: 59.99,
      imageUrl: '',
      category: 'PC Games',
      discount: 33,
      isFeatured: true,
      platforms: ['PC', 'PS5', 'Xbox'],
    ),
    Product(
      id: '3',
      title: 'Call of Duty: MW3',
      description: 'Latest FPS experience with intense multiplayer',
      price: 49.99,
      originalPrice: 59.99,
      imageUrl: '',
      category: 'PC Games',
      discount: 17,
      isFeatured: true,
      platforms: ['PC', 'PS5', 'Xbox'],
    ),
    Product(
      id: '4',
      title: 'Baldur\'s Gate 3',
      description: 'Epic fantasy RPG with deep storytelling',
      price: 44.99,
      originalPrice: 59.99,
      imageUrl: '',
      category: 'PC Games',
      discount: 25,
      isFeatured: true,
      platforms: ['PC', 'PS5'],
    ),
  ];

  final List<Category> _categories = [
    Category(id: '1', name: 'PC Games', icon: '🎮', productCount: 245),
    Category(id: '2', name: 'PlayStation', icon: '🎯', productCount: 189),
    Category(id: '3', name: 'Xbox', icon: '🎲', productCount: 167),
    Category(id: '4', name: 'Nintendo', icon: '🎪', productCount: 134),
    Category(id: '5', name: 'Gift Cards', icon: '🎁', productCount: 89),
    Category(id: '6', name: 'Top Up', icon: '⚡', productCount: 76),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ENEBACLONE',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: ProductSearchDelegate(),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // Navigate to cart
            },
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              // Navigate to profile
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.deepPurple.shade400,
                    Colors.pinkAccent.shade400,
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Discover Amazing Game Deals',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Get the best prices on PC, PlayStation, Xbox, and Nintendo games. Instant delivery guaranteed!',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.white.withOpacity(0.9),
                        ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pinkAccent,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                    child: const Text('Shop Now'),
                  ),
                ],
              ),
            ),

            // Categories Section
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Popular Categories',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _categories.length,
                      itemBuilder: (context, index) {
                        return CategoryCard(category: _categories[index]);
                      },
                    ),
                  ),
                ],
              ),
            ),

            // Featured Games Section
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Featured Games',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 16),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.7,
                    ),
                    itemCount: _featuredProducts.length,
                    itemBuilder: (context, index) {
                      return ProductCard(product: _featuredProducts[index]);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Browse',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class ProductSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text('Search results for: $query'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
      child: Text('Start typing to search for games...'),
    );
  }
}


