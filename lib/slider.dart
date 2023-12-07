import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({super.key});

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _value = 0;

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
              //display the value of slider
              Row(
                children: [
                  Expanded(
                    child: Slider(
                      activeColor: Colors.purple,
                      inactiveColor: Colors.white,
                      thumbColor: Colors.white,
                      min: 0,
                      max: 20,
                      divisions: 20,
                      value: _value,
                      label: _value.toStringAsFixed(0),
                      onChanged: (double newValue) {
                        setState(() {
                          _value = newValue;
                        });
                      },
                    ),
                  ),
                  Text(_value.toStringAsFixed(0)),
                ],
              ),
            ]),
      ),
      floatingActionButton: Stack(
        children: [
          Positioned(
            bottom: 20.0,
            right: 20.0,
            child: FloatingActionButton.extended(
              onPressed: () {
                // Navigator.pushNamed(context, '/');
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
            left: 50,
            child: FloatingActionButton.extended(
              onPressed: () {
                Navigator.pushNamed(context, '/details');
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
