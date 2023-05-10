import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late Size size;

  @override
  void didChangeDependencies() {
    size = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 32),
                  padding: const EdgeInsets.fromLTRB(15, 30, 15, 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(170),
                      bottomRight: Radius.circular(170),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _card(const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black, size: 20)),
                          _card(Icon(Icons.favorite_border_rounded, color: Colors.red[700], size: 20)),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text('Chipotle Cheesy Chicken', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Text('A signature flame-grilled chicken patty topped with smoked beef', style: TextStyle(color: Colors.grey), textAlign: TextAlign.center),
                      ),
                      const SizedBox(height: 50),
                      Image.asset('assets/images/burge2.png', width: size.width / 2, height: size.width / 2, fit: BoxFit.cover),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          const SizedBox(width: 40),
                          _card(const Text(' S ', style: TextStyle(fontSize: 18))),
                          const Spacer(),
                          _card(const Text(' L ', style: TextStyle(fontSize: 18))),
                          const SizedBox(width: 40),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: size.width / 2 - 20,
                  child: _card(const Text(' M ', style: TextStyle(fontSize: 18, color: Colors.white)), secondary: true),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.remove_circle_rounded, color: Colors.redAccent.withOpacity(0.7), size: 35),
                const SizedBox(width: 20),
                const Text('1', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(width: 20),
                Icon(Icons.add_circle_rounded, color: Colors.redAccent.withOpacity(0.7), size: 35),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 15),
        height: 50,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Price', style: TextStyle(color: Colors.grey)),
                Text('\$ 41.90', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.red[700],
                elevation: 0,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                minimumSize: Size(size.width / 2 - 20, 50),
              ),
              onPressed: () {},
              child: Row(
                children: const [
                  Icon(Icons.card_travel_rounded),
                  Text('  Go to Cart', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _card(Widget child, {bool secondary = false}) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: secondary ? Colors.red[700] : Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: child,
    );
  }
}
