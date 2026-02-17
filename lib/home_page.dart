import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled16/ropostory_game.dart';
import 'uyin_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 180,
              child: Center(child: Lottie.asset("assets/loadingcat.json")),
            ),
            SizedBox(height: 25,),
            InkWell(
              onTap: () {
                Global.list = List.from(Global.animals);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const UyinPage(image: 'assets/img_3.png'),
                  ),
                );
              },
              child: itemPost(context, "assets/animal.png", "Animal Page"),
            ),
            InkWell(
              onTap: () {
                Global.list = List.from(Global.fruits);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const UyinPage(image: 'assets/img_2.png'),
                  ),
                );
              },
              child: itemPost(context, "assets/fruits.png", "Fruits Page"),
            ),
            SizedBox(height: 25),
            Text(
              "Powered by Farrukh",
              style: TextStyle(
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget itemPost(BuildContext context, String image, String name) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.7,
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 6, color: Colors.brown.shade700),
      ),
      child: Column(
        children: [
          Expanded(child: Image.asset(image)),
          Text(
            name,
            style: const TextStyle(
              color: Colors.brown,
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
