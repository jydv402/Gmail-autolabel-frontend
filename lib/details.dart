import 'package:flutter/material.dart';

import 'dart:convert';
import 'dart:io';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  Map<String, String> map = {};

  @override
  void initState() {
    super.initState();
    initializeData();
  }

  Future<void> initializeData() async {
    var input = await File('user_info.json').readAsString();
    map = jsonDecode(input)['label_mapping'];
  }

  Future<Map<String, String>> readJsonFile(String filePath) async {
    var input = await File('user_info.json').readAsString();
    var map = jsonDecode(input);
    return map['label_mapping'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: DataTable(
          columns: const <DataColumn>[
            DataColumn(label: Text('Label')),
            DataColumn(label: Text('Description')),
            DataColumn(label: Text('Edit')),
          ],
          rows: map.entries
              .map((entry) => DataRow(cells: [
                    DataCell(Text(entry.key)),
                    DataCell(Text(entry.value)),
                    const DataCell(
                        Text('Edit')), // Replace with your edit widget
                  ]))
              .toList(),
        ),
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
                Navigator.pushNamed(context, '/label');
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

class Labels extends StatefulWidget {
  const Labels({super.key});

  @override
  State<Labels> createState() => _LabelsState();
}

class _LabelsState extends State<Labels> {
  final labelController = TextEditingController();

  final descriptionController = TextEditingController();

  Future<void> writeToJson() async {
    var input = await File('user_info.json').readAsString();
    var map = jsonDecode(input);
    map['label_mapping'][labelController.text] = descriptionController.text;
    await File('user_info.json').writeAsString(jsonEncode(map));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 10.0),
              child: Text(
                "Label",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            TextFormField(
              controller: labelController,
              maxLines: null,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                  fontFamily: 'Product'),
              cursorColor: Colors.black,
              decoration: const InputDecoration(),
            ),
            const SizedBox(height: 36),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 10.0),
              child: Text(
                "Description",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            TextFormField(
              controller: descriptionController,
              maxLines: null,
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
        children: <Widget>[
          Positioned(
            bottom: 20.0,
            right: 20.0,
            child: FloatingActionButton.extended(
              onPressed: () {
                writeToJson();
                Navigator.pushNamed(context, '/details');
              },
              label: Text('Save',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.black)),
            ),
          ),
        ],
      ),
    );
  }
}
