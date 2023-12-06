import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '\tHello World',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 10),
            TextFormField(
              maxLines: null,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 18),
              cursorColor: Colors.black,
              decoration: const InputDecoration(),
            )
          ],
        ),
      ),
      floatingActionButton: Stack(
        children: [
          Positioned(
            bottom: 20.0,
            right: 20.0,
            child: FloatingActionButton.extended(
              onPressed: () {
                Navigator.pushNamed(context, '/details');
              },
              label: Row(
                children: <Widget>[
                  Text('Next',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.black)),
                  const SizedBox(width: 16),
                  const Icon(Icons.arrow_forward_ios_rounded,
                      color: Colors.black),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
