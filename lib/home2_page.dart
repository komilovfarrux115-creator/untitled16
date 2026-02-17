import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled16/ropostory_game.dart';
import 'package:untitled16/toast_services/url_Launcher_services.dart';
import 'uyin_page.dart';

class Home2Page extends StatelessWidget {
  const Home2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 180,
              child: Center(
                child: SizedBox(
                  height: 150,
                  child: Lottie.asset("assets/loadingcat.json"),
                ),
              ),
            ),
            SizedBox(height: 25),

            InkWell(
              onTap: () {
                Global.list = List.from(Global.animals);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => UyinPage(image: 'assets/img_3.png'),
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
                    builder: (_) => UyinPage(image: 'assets/img_2.png'),
                  ),
                );
              },
              child: itemPost(context, "assets/fruits.png", "Fruits Page"),
            ),

            SizedBox(height: 15),

            ElevatedButton.icon(
              onPressed: () {
                UrlLauncherServices.makePhoneCall('+998887350200');
              },
              icon: Icon(Icons.call, color: Colors.blueAccent),
              label: Text("Call me"),
            ),

            SizedBox(height: 15),

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
      height: MediaQuery.of(context).size.width * 0.6,
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 5, color: Colors.brown.shade700),
      ),
      child: Column(
        children: [
          Expanded(child: Image.asset(image, fit: BoxFit.contain)),
          SizedBox(height: 5),
          Text(
            name,
            style: TextStyle(
              color: Colors.brown,
              fontSize: 26,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
