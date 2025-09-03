import 'dart:io';
import 'package:flutter/material.dart';
import 'package:taskati/features/AddTask/widgets/addtask_widget.dart';
import '../widgets/header.dart';
import '../widgets/task_card.dart';

class HomeScreen extends StatelessWidget {
  final String? userName;
  final String? userImagePath;

  HomeScreen({super.key, this.userName, this.userImagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(userName: userName, userImagePath: userImagePath),
              SizedBox(height: 20),
              AddTask(),
              SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: [
                    TaskCard(
                      title: "Flutter Task - 1",
                      time: "02:25 AM - 02:40 AM",
                      description: "I will do This Task",
                      color: Color(0xFF4F5DFF),
                    ),
                    TaskCard(
                      title: "Flutter Task - 2",
                      time: "4:27 PM - 6:42 PM",
                      description: "I will do This Task",
                      color: Color(0xFFFF4F64),
                    ),
                    TaskCard(
                      title: "Flutter Task - 3",
                      time: "7:27 PM - 9:43 PM",
                      description: "I will do This Task",
                      color: Color(0xFFFF9C4F),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
