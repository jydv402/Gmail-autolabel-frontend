import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String userInfo = "";
  Map<String, String> labelMapping = {};
  late final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    initializeData();
  }

  Future<void> initializeData() async {
    var input = await File('user_info.json').readAsString();
    var map = jsonDecode(input);
    labelMapping = Map<String, String>.from(map['label_mapping'] as Map);
    userInfo = map['user_info'];
    setState(() {
      _controller.text = userInfo;
    });
  }

  void writeToJson() async {
    final text = _controller.text;
    final file = File('user_info.json');
    final String jsonText;
    if (file.existsSync()) {
      jsonText = jsonEncode(
          {"user_info": text, "label_mapping": labelMapping, "max_results": 0});
    } else {
      jsonText = jsonEncode(
          {"user_info": text, "label_mapping": {}, "max_results": 0});
    }
    await file.writeAsString(jsonText);
  }

  void submitForm() {
    writeToJson();
    Navigator.pushNamed(context, '/details');
  }

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
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'What defines you the best?',
                  textStyle: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.white),
                  speed: const Duration(milliseconds: 50),
                ),
              ],
              totalRepeatCount: 1,
            ),
            const SizedBox(height: 10),
            TextFormField(
              keyboardType: TextInputType.text, // Adjust as needed
              textInputAction: TextInputAction.done,
              controller: _controller,
              onFieldSubmitted: (value) {
                submitForm();
              },
              maxLines: null,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                  fontFamily: 'Product'),
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
                submitForm();
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
