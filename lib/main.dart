import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'joshua app',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(title: 'joshua app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isPlayer = true;
  String message;
  List<String> display = List<String>(9);
  List<int> windisplay = List<int>(3);

  int xScore = 0;
  int oScore = 0;

  @override
  void initState() {
    super.initState();
    display = List.generate(9, (index) => "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Joshua app'),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 16,
            ),
            Text(
              (message != null)
                  ? "$message"
                  : "Next Player ${isPlayer ? "Ayo" : "Bola"}",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            Spacer(),
            GridView.builder(
              itemCount: 9,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2 / 2,
              ),
              itemBuilder: (BuildContext context, int index) {
                // CalcItem item = calcList[index];
                return InkWell(
                  onTap: () {
                    if (message != null) {
                      reset();
                    }
                    display[index] = display[index].isEmpty
                        ? (isPlayer ? "X" : "O")
                        : display[index];
                    isPlayer = !isPlayer;
                    checkWin();
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: windisplay.contains(index) ? Colors.red : null,
                      border: Border.all(color: Colors.black, width: .1),
                    ),
                    child: Center(
                      child: Text(
                        "${display[index] ?? ""}",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        "$xScore",
                        style: TextStyle(
                          fontSize: 36,
                        ),
                      ),
                      Text(
                        "Ayo",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "(X)",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "$oScore",
                        style: TextStyle(
                          fontSize: 36,
                        ),
                      ),
                      Text(
                        "Bola",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "(O)",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  child: RaisedButton(
                    onPressed: () {
                      setState(() {
                        display = List.generate(9, (index) => "");
                        message = null;
                      });
                    },
                    child: Center(child: Text("Clear")),
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    onPressed: () {
                      setState(() {
                        display = List.generate(9, (index) => "");
                        message = null;
                        xScore = 0;
                        oScore = 0;
                      });
                    },
                    child: Center(child: Text("Reset")),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  reset() {
    setState(() {
      display = List.generate(9, (index) => "");
      message = null;
      windisplay.clear();
    });
  }

  //TODO: check for win logic
  checkWin() {
    if ((display[0] != '') &&
        (display[0] == display[1]) &&
        (display[1] == display[2])) {
      // if any user Win update the message state
      setState(() {
        windisplay = [0, 1, 2];
        this.message = '${this.display[0]} wins';

        if ("${this.display[0]}" == "X") {
          xScore += 1;
        } else {
          oScore += 1;
        }
        //this.Delay();
      });
    } else if ((display[3] != '') &&
        (display[3] == display[4]) &&
        (display[4] == display[5])) {
      setState(() {
        windisplay = [3, 4, 5];
        this.message = '${this.display[3]} wins';
        if ("${this.display[3]}" == "X") {
          xScore += 1;
        } else {
          oScore += 1;
        }
        //this.Delay();
      });
    } else if ((display[6] != '') &&
        (display[6] == display[7]) &&
        (display[7] == display[8])) {
      setState(() {
        windisplay = [6, 7, 8];
        this.message = '${this.display[6]} wins';
        //this.Delay();
        if ("${this.display[6]}" == "X") {
          xScore += 1;
        } else {
          oScore += 1;
        }
      });
    } else if ((display[0] != '') &&
        (display[0] == display[3]) &&
        (display[3] == display[6])) {
      setState(() {
        windisplay = [0, 3, 6];
        this.message = '${this.display[0]} wins';
        if ("${this.display[0]}" == "X") {
          xScore += 1;
        } else {
          oScore += 1;
        }
        //this.Delay();
      });
    } else if ((display[1] != '') &&
        (display[1] == display[4]) &&
        (display[4] == display[7])) {
      setState(() {
        windisplay = [1, 4, 7];
        this.message = '${this.display[1]} wins';
        if ("${this.display[1]}" == "X") {
          xScore += 1;
        } else {
          oScore += 1;
        }
        //this.Delay();
      });
    } else if ((display[2] != '') &&
        (display[2] == display[5]) &&
        (display[5] == display[8])) {
      setState(() {
        windisplay = [2, 5, 8];
        this.message = '${this.display[2]} wins';
        if ("${this.display[2]}" == "X") {
          xScore += 1;
        } else {
          oScore += 1;
        }
        //this.Delay();
      });
    } else if ((display[0] != '') &&
        (display[0] == display[4]) &&
        (display[4] == display[8])) {
      setState(() {
        windisplay = [0, 4, 8];
        this.message = '${this.display[0]} wins';
        if ("${this.display[0]}" == "X") {
          xScore += 1;
        } else {
          oScore += 1;
        }
        //this.Delay();
      });
    } else if ((display[2] != '') &&
        (display[2] == display[4]) &&
        (display[4] == display[6])) {
      setState(() {
        windisplay = [2, 4, 6];
        this.message = '${this.display[2]} wins';
        if ("${this.display[2]}" == "X") {
          xScore += 1;
        } else {
          oScore += 1;
        }
        //this.Delay();
      });
    } else if (!display.contains('')) {
      setState(() {
        this.message = 'Game Draw';
        //this.Delay();
      });
    }
  }
}
