import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Task-10 - Business Card',
      home: Scaffold(
        body: BusinessCard(),
      ),
    );
  }
}

class BusinessCard extends StatelessWidget {
  const BusinessCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[5000],
      elevation: 8.0,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        height: 550,
        width: 550,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset("lib/images/logo.svg", width: 100),
                    const SizedBox(height: 150),
                    Icon(
                      Icons.person,
                      color: Colors.lightBlue[800],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      width: 150,
                      color: Colors.black54,
                      height: 2,
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Кудрявцев Арсений',
                      style: TextStyle(fontFamily: 'Roboto'),
                    ),
                    const Text(
                      'Flutter-Developer',
                      style: TextStyle(
                          fontFamily: 'Roboto', fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'Kazan, Russia',
                      style: TextStyle(fontFamily: 'Roboto'),
                    ),
                    const SizedBox(height: 60),
                    const Text(
                      '1 year in FLutter',
                      style: TextStyle(fontFamily: 'Roboto'),
                    ),
                    const Text(
                      'Sport lover',
                      style: TextStyle(fontFamily: 'Roboto'),
                    ),
                    const Text(
                      'Life enjoyer',
                      style: TextStyle(
                          fontFamily: 'Roboto', fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Image.asset("lib/images/me.png"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
