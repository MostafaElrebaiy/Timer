import 'package:flutter/material.dart';
import 'dart:async';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  Timer? repeatedFunction;
  Duration duration = Duration(seconds: 0);
  bool isrunning = false;

  startTimer() {
    repeatedFunction = Timer.periodic(Duration(seconds: 1), (test) {
      setState(() {
        int newSecond = duration.inSeconds + 1;
        duration = Duration(seconds: newSecond);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 33, 40, 43),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.only(bottom: 22),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16)),
                      child: Text(
                        duration.inHours.toString().padLeft(2, "0"),
                        style: TextStyle(fontSize: 77, color: Colors.black),
                      ),
                    ),
                    Text(
                      "Hours",
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  width: 22,
                ),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.only(bottom: 22),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16)),
                      child: Text(
                        duration.inMinutes
                            .remainder(60)
                            .toString()
                            .padLeft(2, "0"),
                        style: TextStyle(fontSize: 77, color: Colors.black),
                      ),
                    ),
                    Text(
                      "minutes",
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  width: 22,
                ),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.only(bottom: 22),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16)),
                      child: Text(
                        duration.inSeconds
                            .remainder(60)
                            .toString()
                            .padLeft(2, "0"),
                        style: TextStyle(fontSize: 77, color: Colors.black),
                      ),
                    ),
                    Text(
                      "Second",
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 55,
            ),
            isrunning? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {

                     if(repeatedFunction!.isActive)
                     {
                       setState(() {
                         repeatedFunction!.cancel();
                       });


                     }else
                     {
                       startTimer();
                     }

                  },
                  child: Text(

                    (repeatedFunction!.isActive) ? "Stop" : "Resume" ,
                    style: TextStyle(
                      fontSize: 23,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 25, 120, 197)),
                    padding: MaterialStateProperty.all(EdgeInsets.all(14)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9))),
                  ),
                ),
                SizedBox(width: 22,),
                ElevatedButton(
                  onPressed: () {
                    repeatedFunction!.cancel();
                    setState(() {
                      isrunning=false;
                       duration = Duration(seconds: 0);

                    });
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      fontSize: 23,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 25, 120, 197)),
                    padding: MaterialStateProperty.all(EdgeInsets.all(14)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9))),
                  ),
                ),
              ],
            ):ElevatedButton(
              onPressed: () {
                startTimer();
                setState(() {
                  isrunning=true;
                });
              },
              child: Text(
                "Start Timer",
                style: TextStyle(
                  fontSize: 23,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Color.fromARGB(255, 25, 120, 197)),
                padding: MaterialStateProperty.all(EdgeInsets.all(14)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9))),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
