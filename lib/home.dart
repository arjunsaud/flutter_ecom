import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //safe area ignores the bottom bar and top notch of the screen , like notch and bar present in iphone
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Shoes\nCollections",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 300,
                  //By default text field occupies 100% of device width, here in our case we have to warp it with sized box so that we can give custom width
                  child: TextField(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
