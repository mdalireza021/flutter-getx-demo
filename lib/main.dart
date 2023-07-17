import 'package:flutter/material.dart';
import 'package:getx_demo/pages/product_details.dart';
import 'package:getx_demo/view/Home.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  initialLocation: '/home',
  routes: <RouteBase>[
    GoRoute(
      path: '/home',
      builder: ( context,  state) {
        return const Home();
      },
      routes: <RouteBase>[
        GoRoute(
          name: "details",
          path: 'details/:id/:name/:shortDescription/:fullDescription/:productPrice/:imageUrl/:fullSizeImageUrl',
          builder: ( context,  state) {

            return ProductDetails(
              id : state.pathParameters['id'] ?? "",
              name : state.pathParameters['name'] ?? "",
              shortDescription : state.pathParameters['shortDescription'] ?? "",
              fullDescription : state.pathParameters['fullDescription'] ?? "",
              productPrice : state.pathParameters['productPrice'] ?? "",
              imageUrl : state.pathParameters['imageUrl'] ?? "",
              fullSizeImageUrl: state.pathParameters['fullSizeImageUrl'] ?? "",
            );
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}
