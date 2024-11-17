import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ExpandableListView(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ExpandableListView extends StatefulWidget {
  @override
  _ExpandableListViewState createState() => _ExpandableListViewState();
}

class _ExpandableListViewState extends State<ExpandableListView> {
  final List<Map<String, dynamic>> data = [
    {
      'header': 'Fruits',
      'items': ['Apple', 'Banana', 'Cherry', 'Grapes', 'Orange'],
    },
    {
      'header': 'Vegetables',
      'items': ['Carrot', 'Broccoli', 'Spinach', 'Tomato', 'Cucumber'],
    },
    {
      'header': 'Animals',
      'items': ['Cat', 'Dog', 'Elephant', 'Tiger', 'Lion'],
    },
  ];

  int? _expandedIndex; // To track which tile is expanded

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expandable ListView'),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          final category = data[index];
          return ExpansionTile(
            title: Text(category['header']),
            initiallyExpanded: _expandedIndex == index, // Expand if this is the selected index
            onExpansionChanged: (expanded) {
              setState(() {
                // Collapse the current expanded tile and expand the new one
                if (expanded) {
                  _expandedIndex = index; // Set the expanded index
                } else {
                  _expandedIndex = null; // Collapse the tile
                }
              });
            },
            children: category['items'].map<Widget>((item) {
              return ListTile(
                title: Text(item),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
