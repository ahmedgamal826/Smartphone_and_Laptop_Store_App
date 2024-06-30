import 'package:flutter/material.dart';
import 'package:phones_and_laptops_store_app/Screens/home_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/logo.jpg'),
          const Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Text(
                    'Find Your Best 🤜 👌 🤛',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    textAlign: TextAlign.start,
                    'Smartphone 📱 and Laptop 💻',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    textAlign: TextAlign.start,
                    'All time your order are available',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
              child: const Padding(
                padding:
                    EdgeInsets.only(left: 130, right: 130, top: 10, bottom: 10),
                child: Text(
                  'Next',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ))
        ],
      ),
    );
  }
}
