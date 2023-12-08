import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: const Center(
        child: Text("Result"),
      ),
      floatingActionButton: Stack(
        children: [
          Positioned(
            bottom: 20.0,
            left: 50,
            child: FloatingActionButton.extended(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              label: Row(
                children: <Widget>[
                  const Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
                  const SizedBox(width: 16),
                  Text('Back',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.black)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
