import 'package:flutter/material.dart';
import 'package:software_en/widgets/products.dart';

// علي صالح: Set up the main entry point and overall app structure.
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter project',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Pickmart store'),
    );
  }
}

Color floatingBtnColor = const Color(0xff123456);

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500, letterSpacing: 2),
        ),
        backgroundColor: Colors.black,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Logged in successfully"),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                icon: const Icon(Icons.supervised_user_circle, size: 30)),
          )
        ],
      ),
      // نوارة حسن: Implemented the floating action button to show cart items.
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {},
        tooltip: "Show my items",
        backgroundColor: floatingBtnColor,
        child: IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Your cart items"),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            icon: const Icon(Icons.shopping_cart_outlined)),
      ),
      body: ProductListingWidget(),
    );
  }
}