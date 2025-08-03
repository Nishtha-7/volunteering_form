import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('lib/assets/basti ki pathshala logo.jpeg'),
            ),
            SizedBox(height: 20),
            Text(
              'Basti Ki Pathshala Foundation',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text(
              'Welcome to Basti Ki Pathshala Foundation. We are delighted to have you here. As a grassroots initiative dedicated to educating children in underserved communities, we believe that every child deserves a chance to learn, grow, and succeed. Your support helps us build brighter futures—one classroom, one child, one dream at a time.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
