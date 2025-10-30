

import 'package:flutter/cupertino.dart';
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
      child: CupertinoApp(
        title: 'GameTopUp',
        theme: const CupertinoThemeData(
          brightness: Brightness.light,
          primaryColor: CupertinoColors.systemPurple,
          barBackgroundColor: CupertinoColors.systemBackground,
          scaffoldBackgroundColor: CupertinoColors.systemBackground,
        ),
        home: const HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

