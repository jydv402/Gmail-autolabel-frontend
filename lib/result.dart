import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'dart:convert';
import 'dart:io';

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
      body: Center(
        child: DataTable(
          columns: <DataColumn>[
            DataColumn(
                label: Text(
              'Status',
              style: Theme.of(context).textTheme.bodyMedium,
            )),
            DataColumn(
                label: Text(
              'Subjects',
              style: Theme.of(context).textTheme.bodyMedium,
            )),
            DataColumn(
                label: Text(
              'Label',
              style: Theme.of(context).textTheme.bodyMedium,
            )),
            DataColumn(
                label: Text(
              'Reason',
              style: Theme.of(context).textTheme.bodyMedium,
            )),
          ],
          rows: const [],
        ),
      ),
      floatingActionButton: Stack(
        children: [
          Positioned(
            bottom: 20.0,
            left: 52,
            child: FloatingActionButton.extended(
              tooltip: "Go back to HomePage",
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
