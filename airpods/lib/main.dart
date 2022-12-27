import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(
          bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Colors.transparent,
        elevation: 20,
      )),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomSheet: Container(
        height: 370,
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(left: 24.0, top: 24, right: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Airpods Pro",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Icon(
                  Icons.favorite,
                  color: Colors.grey.shade800,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            alignment: Alignment.centerLeft,
            child: const Text(
              "Wireless Noise cancelling airpods",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(231, 255, 255, 255),
              ),
            ),
          ),
          SizedBox(height: 1),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            alignment: Alignment.centerLeft,
            child: Text(
              "AirPods Pro have been designed to deliver Active Noise Cancellation for immersive sounds. Transparency mode so you can hear your surroundings.",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white54,
              ),
            ),
          )
        ]),
      ),
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 0,
              vertical: 24,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/logo.png",
                      width: 40,
                    ),
                    const Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                  ],
                ),

                Container(
                  height: 300,
                  child: PageView(
                    controller: PageController(
                      initialPage: 0,
                    ),
                    children: [
                      AirpodImage(index: 0),
                      AirpodImage(index: 1),
                      AirpodImage(index: 2),
                    ],
                    onPageChanged: (value) {
                      setState(() {
                        _index = value;
                      });
                    },
                    physics: ClampingScrollPhysics(),
                    pageSnapping: false,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Icon(
                        Icons.circle,
                        size: 18,
                        color: _index == 0 ? Colors.white : Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Icon(
                        Icons.circle,
                        size: 18,
                        color: _index == 1 ? Colors.white : Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Icon(
                        Icons.circle,
                        size: 18,
                        color: _index == 2 ? Colors.white : Colors.grey,
                      ),
                    ),
                  ],
                ),

                // Expanded(
                //     child: Container(
                //   decoration: BoxDecoration(
                //     color: Colors.grey[900],
                //     borderRadius: const BorderRadius.only(
                //       topLeft: Radius.circular(50),
                //       topRight: Radius.circular(50),
                //     ),
                //   ),
                // )),
              ],
            )),
      ),
    );
  }
}

class AirpodImage extends StatelessWidget {
  final int index;

  AirpodImage({super.key, required this.index});
  final List<String> img_array = [
    "assets/open.png",
    "assets/case.png",
    "assets/ears.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300,
      alignment: Alignment.center,
      child: Image.asset(
        img_array[index],
        width: 250,
        height: 250,
      ),
    );
  }
}
