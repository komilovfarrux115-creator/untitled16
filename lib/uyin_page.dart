import 'package:flutter/material.dart';
import 'package:untitled16/ropostory_game.dart';

class UyinPage extends StatefulWidget {
  const UyinPage({super.key, required this.image});

  final String image;

  @override
  State<UyinPage> createState() => _UyinPageState();
}

class _UyinPageState extends State<UyinPage> {
  int score = 0;
  int done = 0;
  List list2 = [];

  @override
  void initState() {
    super.initState();
    list2 = List.from(Global.list);
    list2.shuffle();

    for (var e in Global.list) e.isDropped = false;
    for (var e in list2) e.isDropped = false;
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height * 0.16;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.image),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: Global.list.map((e) {
                        return e.isDropped
                            ? SizedBox(height: h)
                            : Draggable(
                                data: e.value,
                                feedback: SizedBox(
                                  height: h,
                                  child: Image.asset(e.image),
                                ),
                                child: SizedBox(
                                  height: h,
                                  child: Image.asset(e.image),
                                ),
                              );
                      }).toList(),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: list2.map((e) {
                        return e.isDropped
                            ? SizedBox(height: h)
                            : DragTarget<String>(
                                onAccept: (data) {
                                  if (data == e.value) {
                                    setState(() {
                                      e.isDropped = true;
                                      Global.list
                                              .firstWhere(
                                                (x) => x.value == data,
                                              )
                                              .isDropped =
                                          true;
                                      score += 20;
                                      done++;
                                      if (done == Global.list.length)
                                        _showWin();
                                    });
                                  } else {
                                    setState(() => score -= 5);
                                  }
                                },
                                builder: (_, __, ___) => SizedBox(
                                  height: h,
                                  child: Center(
                                    child: Text(
                                      e.value,
                                      style: const TextStyle(
                                        color: Colors.orange,
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 70,
              color: Colors.white.withOpacity(0.6),
              child: Center(
                child: Text(
                  "Score: $score",
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showWin() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("You Win 🎉"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Back"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                done = 0;
                score = 0;
                list2 = List.from(Global.list)..shuffle();
                for (var e in Global.list) e.isDropped = false;
                for (var e in list2) e.isDropped = false;
              });
            },
            child: const Text("Refresh"),
          ),
        ],
      ),
    );
  }
}
