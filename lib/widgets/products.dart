import 'package:flutter/material.dart';

class Product {
  final String name;
  final String imageUrl;
  final double price;
  
  Product({required this.name, required this.imageUrl, required this.price});
}



class ProductListingWidget extends StatefulWidget {

  

  @override
  _ProductListingWidgetState createState() => _ProductListingWidgetState();
}



class _ProductListingWidgetState extends State<ProductListingWidget> {
  final List<Product> products = [
    Product(
        name: "Product 1",
        imageUrl:
            "assets/pexels-madebymath-90946.jpg",
        price: 19.99),
    Product(
        name: "Product 2",
        imageUrl: "assets/pexels-laryssa-suaid-798122-1667088.jpg",
        price: 24.99),
    Product(
        name: "Product 3",
        imageUrl: "assets/pexels-olenkabohovyk-3646165.jpg",
        price: 15.49),
    Product(
        name: "Product 4",
        imageUrl: "assets/pexels-pixabay-258244.jpg",
        price: 29.99),
    Product(
        name: "Product 5",
        imageUrl: "assets/pexels-karolina-grabowska-4202924.jpg",
        price: 12.99),
  ];

  final List<Product> cart = [];


  void addToCart(Product product) {
    setState(() {
      cart.add(product);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("${product.name} added to cart!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 10) ,
      padding: const EdgeInsets.all(8.0),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return Card(
          
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: Padding(padding:const  EdgeInsets.all(8.0) , child:Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Image.asset(product.imageUrl,width: 400, height: 300, fit: BoxFit.cover,),

            const SizedBox(height: 20),

            Text(product.name),
            const SizedBox(height: 20),

            Text("\$${product.price.toStringAsFixed(2)}",style: const TextStyle(
              color: Colors.green,
              fontSize: 24,
              fontWeight: FontWeight.w600
              
            ),),
            const SizedBox(height: 20),
            
            
            ElevatedButton(
              onPressed: () => addToCart(product),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                side: const BorderSide(width: 1,color: Colors.black),
              ),
              child: const Text("Add to Cart"),
            ),],
            
          ), ) 
        );
      },
    );
  }
}
