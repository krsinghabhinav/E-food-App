import 'package:demoteteee/providers/provider_provider.dart';
import 'package:demoteteee/providers/userProvider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'View/screen/authorize/Singupauth.dart';
import 'providers/review_cart_provider.dart';
import 'providers/wishlist_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  get disable => null;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => ReviewCartProvider()),
        ChangeNotifierProvider(create: (_) => WishlistProvider()),
      ],
      child: GetMaterialApp(
        theme: ThemeData(useMaterial3: disable),
        title: 'Flutter Demo',
        home: const SignInView(),
      ),
    );
  }
}
