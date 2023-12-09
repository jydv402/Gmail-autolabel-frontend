import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'dart:io';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  List<List<dynamic>> csvTable = [];

  @override
  void initState() {
    super.initState();
    readCSV();
  }

  void readCSV() async {
    File csvPath = File('logs.csv');
    String csvData = await csvPath.readAsString();
    setState(() {
      csvTable = const CsvToListConverter().convert(csvData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.06),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                DataTable(
                  // dataRowMinHeight: 20,
                  dataRowMaxHeight: 80,
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
                  rows: [
                    for (List<dynamic> row in csvTable)
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text(row[0].toString(),
                              style: row[0].toString() == "SUCCESS"
                                  ? Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                          color: Colors.green.shade400,
                                          fontSize: 12)
                                  : Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                          color: Colors.red, fontSize: 12))),
                          DataCell(Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Text(row[1].toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        color: Colors.white, fontSize: 16)),
                          )),
                          DataCell(Text(row[2].toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      color: Colors.white, fontSize: 16))),
                          DataCell(Text(row[3].toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      color: Colors.white, fontSize: 16))),
                        ],
                      ),
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
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
