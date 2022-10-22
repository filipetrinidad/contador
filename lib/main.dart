import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  int count = 0;

  void increment(){
    setState(() {
      count++;
    });
  }

  void decrement(){
    setState(() {
      count--;
    });
  }


  bool get isEmpty => count == 0;
  bool get isFull => count == 20;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/img.jpg'),
              fit: BoxFit.fill
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isFull ? 'Lotado' : 'Pode entrar',
              style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            Padding(
              padding: EdgeInsets.all(40),
              child: Text(
                count.toString(),
                style: TextStyle(fontSize: 100, color: Colors.white),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                TextButton(
                  onPressed: isEmpty? null : decrement,
                  child: const Text(
                    "Saiu",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: isEmpty ? Colors.white.withOpacity(0.2) : Colors.white,
                      fixedSize: const Size(100, 100),
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)
                      )
                  ),
                ),
                SizedBox(width: 24,),
                TextButton(
                  onPressed: isFull ? null : increment,
                  child: const Text(
                    "Oi",
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: isFull ? Colors.white.withOpacity(0.2) : Colors.white,
                      fixedSize: Size(100, 100),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)
                      )
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
