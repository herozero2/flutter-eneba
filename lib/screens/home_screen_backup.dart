


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:eneba_ecommerce/models/product.dart';
import 'package:eneba_ecommerce/widgets/product_card.dart';
import 'package:eneba_ecommerce/widgets/category_card.dart';
import 'package:eneba_ecommerce/services/auth_service.dart';
import 'package:eneba_ecommerce/screens/login_screen.dart';
import 'package:eneba_ecommerce/screens/profile_screen.dart';

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
      type: ProductType.game,
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
      type: ProductType.game,
    ),
    Product(
      id: '3',
      title: '1000 Coins',
      description: 'Instant delivery to your account',
      price: 9.99,
      originalPrice: 12.99,
      imageUrl: '',
      category: 'Top Up',
      discount: 23,
      isFeatured: true,
      platforms: ['Mobile'],
      type: ProductType.topup,
      gameName: 'PUBG Mobile',
      amount: 1000,
    ),
    Product(
      id: '4',
      title: 'Steam Wallet Code',
      description: 'Redeem instantly on Steam platform',
      price: 49.99,
      originalPrice: 49.99,
      imageUrl: '',
      category: 'Gift Cards',
      discount: 0,
      isFeatured: true,
      platforms: ['PC'],
      type: ProductType.giftcard,
      amount: 50,
    ),
    Product(
      id: '5',
      title: '2400 Valorant Points',
      description: 'Get premium skins and battle pass',
      price: 19.99,
      originalPrice: 24.99,
      imageUrl: '',
      category: 'Top Up',
      discount: 20,
      isFeatured: true,
      platforms: ['PC'],
      type: ProductType.topup,
      gameName: 'Valorant',
      amount: 2400,
    ),
    Product(
      id: '6',
      title: 'PlayStation Network Card',
      description: 'Buy games, DLCs and subscriptions',
      price: 24.99,
      originalPrice: 24.99,
      imageUrl: '',
      category: 'Gift Cards',
      discount: 0,
      isFeatured: true,
      platforms: ['PS5', 'PS4'],
      type: ProductType.giftcard,
      amount: 25,
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
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text(
          'GameTopUp',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (context) => CupertinoActionSheet(
                    title: const Text('Search Products'),
                    message: const Text('Search functionality coming soon'),
                    actions: [
                      CupertinoActionSheetAction(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('OK'),
                      ),
                    ],
                    cancelButton: CupertinoActionSheetAction(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'),
                    ),
                  ),
                );
              },
              child: const Icon(CupertinoIcons.search, size: 22),
            ),
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                // Navigate to cart
              },
              child: const Icon(CupertinoIcons.cart, size: 22),
            ),
            Consumer<AuthService>(
              builder: (context, authService, child) {
                return CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    if (authService.isLoggedIn) {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const ProfileScreen(),
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    }
                  },
                  child: Icon(
                    authService.isLoggedIn ? CupertinoIcons.person : CupertinoIcons.person_crop_circle_badge_plus,
                    size: 22,
                  ),
                );
              },
            ),
          ],
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            // Hero Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: CupertinoColors.systemPurple,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: CupertinoColors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          CupertinoIcons.game_controller,
                          color: CupertinoColors.white,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'GameTopUp',
                              style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle.copyWith(
                                    color: CupertinoColors.white,
                                    fontSize: 24,
                                  ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Games, Top Ups & Gift Cards',
                              style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                                    color: CupertinoColors.white.withOpacity(0.9),
                                    fontSize: 14,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Instant Delivery • Best Prices • 24/7 Support',
                    style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                          color: CupertinoColors.white.withOpacity(0.9),
                          fontSize: 13,
                        ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      CupertinoButton.filled(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        borderRadius: BorderRadius.circular(8),
                        onPressed: () {},
                        child: const Text(
                          'Browse Games',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      CupertinoButton(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        borderRadius: BorderRadius.circular(8),
                        color: CupertinoColors.white.withOpacity(0.2),
                        onPressed: () {},
                        child: const Text(
                          'Top Ups',
                          style: TextStyle(
                            color: CupertinoColors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
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
                    style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 100,
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

            // Featured Products Section
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Featured Products',
                    style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: 16),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
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


