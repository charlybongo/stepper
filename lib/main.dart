import 'package:flutter/material.dart';
import 'package:stepper/src/presentation/campaign.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campaign',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CampaignScreen(),
    );
  }
}
