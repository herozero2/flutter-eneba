

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:eneba_ecommerce/screens/home_screen.dart';
import 'package:eneba_ecommerce/services/cart_service.dart';
import 'package:eneba_ecommerce/services/auth_service.dart';

void main() {
  runApp(const EnebaEcommerceApp());
}

class EnebaEcommerceApp extends StatelessWidget {
  const EnebaEcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
        ChangeNotifierProvider(create: (context) => CartService()),
      ],
      child: MaterialApp(
        title: 'GameTopUp',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
            primary: Colors.deepPurple,
            secondary: Colors.purple,
          ),
          useMaterial3: true,
          fontFamily: 'Roboto',
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black87,
            elevation: 1,
            centerTitle: false,
          ),
        ),
        home: const HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

