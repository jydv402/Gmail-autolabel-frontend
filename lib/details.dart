import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: const Center(
        child: Text("Success"),
      ),
      floatingActionButton: Stack(
        children: <Widget>[
          Positioned(
            bottom: 20.0,
            right: 20.0,
            child: FloatingActionButton.extended(
              onPressed: () {
                Navigator.pushNamed(context, '/slider');
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
          Positioned(
            bottom: 20.0,
            right: (MediaQuery.of(context).size.width / 2) - 44,
            child: FloatingActionButton(
              onPressed: () {
                // Add your onPressed code here
              },
              child: const Icon(Icons.add, color: Colors.black),
            ),
          ),
          Positioned(
            bottom: 20.0,
            left: 52,
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
