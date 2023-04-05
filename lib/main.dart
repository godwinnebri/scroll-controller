import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController scrollController;

  Color borderColor = Colors.white;
  int containerIndex = 0;

  @override
  void initState() {
    scrollController = ScrollController()
      ..addListener(() {
        if (scrollController.offset == 0 && scrollController.offset < 215) {
          borderColor = Colors.green;
          containerIndex = 0;
        } else if (scrollController.offset > 215 &&
            scrollController.offset < 430) {
          borderColor = Colors.blue;
          containerIndex = 1;
        } else if (scrollController.offset > 430 &&
            scrollController.offset < 650) {
          borderColor = Colors.red;
          containerIndex = 2;
        } else if (scrollController.offset > 650 &&
            scrollController.offset < 860) {
          borderColor = Colors.purple;
          containerIndex = 3;
        }
        debugPrint(scrollController.offset.toString());
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.all(8),
              width: 400,
              height: 200,
              color: index == containerIndex ? borderColor : Colors.grey,
            );
          },
          controller: scrollController,
        ),
      ),
    );
  }
}
