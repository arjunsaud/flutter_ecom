import 'package:flutter/material.dart';

import '../global_variables.dart';
import 'product_card.dart';
import '../pages/product_detail.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = const [
    'All',
    'Nike',
    'Addidas',
    'Jorden',
    'Caliber'
  ];

  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(50),
      ),
      borderSide: BorderSide(
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
    );
    //safe area ignores the bottom bar and top notch of the screen , like notch and bar present in iphone

    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "Shoes\nCollections",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const Expanded(
                //This Expanded takes as much as space available in row or column
                child: TextField(
                  decoration: InputDecoration(
                    border: border,
                    enabledBorder: border,
                    focusedBorder: border,
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              itemBuilder: (context, index) {
                final filter = filters[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilter = filter;
                      });
                    },
                    child: Chip(
                      backgroundColor: selectedFilter == filter
                          ? Theme.of(context).colorScheme.primary
                          : const Color.fromRGBO(245, 247, 249, 1),
                      side: const BorderSide(
                        color: Color.fromRGBO(245, 247, 249, 1),
                      ),
                      label: Text(filter),
                      labelStyle: const TextStyle(
                        fontSize: 16,
                      ),
                      padding: const EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: LayoutBuilder(builder: (context, constraints) {
              if (constraints.maxWidth > 1080) {
                return GridView.builder(
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.75,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: ((context, index) {
                    final product = products[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) {
                            return ProductDetail(product: product);
                          }),
                        );
                      },
                      child: ProductCard(
                        imageUrl: product['imageUrl'] as String,
                        price: product['price'] as double,
                        title: product['title'] as String,
                      ),
                    );
                  }),
                );
              } else {
                return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: ((context, index) {
                    final product = products[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) {
                            return ProductDetail(product: product);
                          }),
                        );
                      },
                      child: ProductCard(
                        imageUrl: product['imageUrl'] as String,
                        price: product['price'] as double,
                        title: product['title'] as String,
                      ),
                    );
                  }),
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
