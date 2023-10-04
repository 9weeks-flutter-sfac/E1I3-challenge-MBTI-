import 'package:flutter/material.dart';
import 'package:your_type_mbti/util/app_textstyle.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text('유어타입', style: AppTextstyle.koPtBold36(),)
          ],
        ),
      ),
    );
  }
}