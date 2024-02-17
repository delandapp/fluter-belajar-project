import 'package:flutter/material.dart';

class visibleWidget extends StatelessWidget {
  const visibleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.yellow,
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.red,
                ),
                Container(
                  width: 25,
                  height: 25,
                  color: Colors.green,
                ),
              ],
            ),
            Container(
              width: 100,
              height: 50,
              color: Colors.green,
            ),
            Container(
              width: 300,
              height: 50,
              color: Colors.red,
            ),
            Container(
              width: 400,
              height: 50,
              color: Colors.blue,
            ),
            Container(
              width: 500,
              height: 50,
              color: Colors.yellow,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 50,
                  height: 110,
                  color: Colors.blue,
                ),
                Container(
                  width: 50,
                  height: 200,
                  color: Colors.green,
                ),
                Container(
                  width: 50,
                  height: 160,
                  color: Colors.red,
                ),
              ],
            )
          ],
        );
  }
}