import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {
  AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "October 30, 2023",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text("Today", style: TextStyle(color: Colors.black54)),
          ],
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text("  + Add Task", style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
