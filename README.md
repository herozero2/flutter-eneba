
# Eneba Clone - Flutter Ecommerce App

A Flutter ecommerce app UI kit inspired by Eneba, built with Material Design principles and following Flutter best practices.

## Features

- 🏠 **Home Screen** - Featured products, categories, and hero section
- 🛍️ **Product Grid** - Beautiful product cards with discount badges
- 🛒 **Shopping Cart** - Full cart functionality with quantity management
- 🔍 **Search** - Built-in search functionality
- 📱 **Responsive Design** - Works on mobile and tablet devices
- 🎨 **Material Design** - Follows Flutter's Material Design guidelines
- 🏷️ **Categories** - Organized product categories with icons
- 💰 **Discount Display** - Clear pricing with discount information

## Project Structure

```
lib/
├── main.dart                 # App entry point with MaterialApp setup
├── models/
│   ├── product.dart         # Product and Category data models
│   └── cart.dart            # Cart and CartItem models
├── screens/
│   ├── home_screen.dart     # Main home screen with featured content
│   ├── cart_screen.dart     # Shopping cart screen
│   └── product_detail_screen.dart # Individual product details
├── services/
│   └── cart_service.dart    # Cart state management service
└── widgets/
    ├── product_card.dart    # Reusable product card widget
    └── category_card.dart   # Reusable category card widget
```

## Getting Started

### Prerequisites
- Flutter SDK (version 3.0.0 or higher)
- Dart SDK (version 3.0.0 or higher)

### Installation
1. Clone this repository
2. Run `flutter pub get` to install dependencies
3. Run `flutter run` to start the app

### Dependencies
- `provider: ^6.1.1` - State management
- `cupertino_icons: ^1.0.2` - Icon library

## Screens

### Home Screen
- Hero section with promotional content
- Horizontal category list
- Grid view of featured products
- Bottom navigation bar

### Product Cards
- Product image placeholder with gradient
- Title and description
- Platform badges
- Pricing with discount information
- Add to cart button

### Cart Screen
- List of cart items with quantity controls
- Total price calculation
- Clear cart functionality
- Checkout button

### Product Detail Screen
- Expanded product image
- Detailed product information
- Feature list
- Add to cart and buy now buttons

## State Management

The app uses the Provider package for state management:
- `CartService` manages the shopping cart state
- Uses `ChangeNotifier` for reactive updates
- Cart state persists across screen navigation

## Customization

### Colors
The app uses a deep purple and pink accent color scheme:
- Primary: `Colors.deepPurple`
- Secondary: `Colors.pinkAccent`
- Can be customized in `main.dart`

### Adding Products
Add products in `home_screen.dart` by extending the `_featuredProducts` list.

### Adding Categories
Add categories in `home_screen.dart` by extending the `_categories` list.

## Future Enhancements

- [ ] User authentication
- [ ] Wishlist functionality
- [ ] Product reviews and ratings
- [ ] Payment integration
- [ ] Order history
- [ ] Push notifications
- [ ] Dark mode support
- [ ] Localization

## License

This project is for educational purposes and is inspired by Eneba's design.

## Contributing

Feel free to fork this project and submit pull requests for any improvements.
