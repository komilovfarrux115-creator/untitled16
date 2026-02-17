import 'package:flutter/material.dart';
import 'package:untitled16/home2_page.dart';

import 'package:untitled16/ropostory_game.dart';
import 'package:untitled16/shared_preference/service/prefs_service_page.dart';

import 'model.dart';

class GamePage extends StatefulWidget {
  final String image;

  const GamePage({super.key, required this.image});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int score = 0;
  int gameOver = 0;

  List<Content> list2 = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var e in Global.list) {
      list2.add(e);
    }

    list2.shuffle();

    for (var e in Global.list) {
      e.isDropped = false;
    }
    for (var e in list2) {
      e.isDropped = false;
    }
    PrefsService.loadScore().then((ball) {
      setState(() {
        score = ball ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.18;
    return SafeArea(
      child: Scaffold(
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
                          int i = list2.indexOf(e);

                          return Global.list[i].isDropped == true
                              ? Container(height: height)
                              : Draggable(
                                  data: Global.list[i].value,
                                  feedback: Container(
                                    height: height,
                                    child: Image.asset(Global.list[i].image),
                                  ),
                                  childWhenDragging: Container(
                                    height: height,
                                    padding: EdgeInsets.all(10),
                                  ),
                                  child: Container(
                                    height: height,
                                    padding: EdgeInsets.all(10),
                                    child: Image.asset(Global.list[i].image),
                                  ),
                                );
                        }).toList(),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: list2.map((e) {
                          int i = list2.indexOf(e);

                          return list2[i].isDropped == true
                              ? Container(height: height)
                              : DragTarget(
                                  onAccept: (data) {
                                    if (list2[i].value == data) {
                                      setState(() {
                                        for (var e in Global.list) {
                                          if (e.value == list2[i].value) {
                                            e.isDropped = true;
                                          }
                                        }
                                        list2[i].isDropped = true;
                                        score += 10;
                                        PrefsService.setScore(score);
                                        gameOver++;

                                        if (gameOver == 5) {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Text("You Win"),
                                                content: Text(
                                                  "Siz yutqazdingiz",
                                                ),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Home2Page();
                                                    },
                                                    child: Text("Back"),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        list2 = [];
                                                        gameOver = 0;
                                                        for (var e
                                                            in Global.list) {
                                                          list2.add(e);
                                                        }

                                                        list2.shuffle();

                                                        for (var e
                                                            in Global.list) {
                                                          e.isDropped = false;
                                                        }
                                                        for (var e in list2) {
                                                          e.isDropped = false;
                                                        }
                                                      });
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text("Refresh"),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        }
                                      });
                                    } else {
                                      setState(() {
                                        score -= 5;
                                        PrefsService.setScore(score);
                                      });
                                    }
                                  },
                                  builder: (context, a, r) => Container(
                                    height: height,
                                    alignment: Alignment.center,
                                    child: Text(
                                      list2[i].value,
                                      style: TextStyle(
                                        color: Colors.orange.shade600,
                                        fontSize: 32,
                                        fontWeight: FontWeight.w900,
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
                height: MediaQuery.of(context).size.height * 0.1,
                color: Colors.white.withOpacity(0.6),
                child: Center(
                  child: Text(
                    "Your Score: $score",
                    style: TextStyle(
                      color: Colors.brown,
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
