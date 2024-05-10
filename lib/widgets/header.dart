import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Text('Choose your',
                  style: TextStyle(color: Colors.grey, fontSize: 18)),
              Text('Laptop or SmartPhone',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage('assets/ahmed.jpg'),
          ),
        ),
      ],
    );
  }
}
