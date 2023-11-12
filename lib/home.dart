import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(50),
      ),
      borderSide: BorderSide(
        color: Colors.black,
      ),
    );
    return Scaffold(
      //safe area ignores the bottom bar and top notch of the screen , like notch and bar present in iphone
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Shoes\nCollections",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Expanded(
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
            )
          ],
        ),
      ),
    );
  }
}
