import 'package:flutter/material.dart';

class CardWidgetLesson extends StatefulWidget {
  const CardWidgetLesson({super.key});

  @override
  State<CardWidgetLesson> createState() => _CardWidgetLessonState();
}

class _CardWidgetLessonState extends State<CardWidgetLesson> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Card Widget")),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, indexS) {
          return _cardItem();
        }
      ),
    );
  }
  _cardItem(){
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              title: Text("Unknown song"),
              subtitle: Text("Prepared by Anonymous"),
              leading: Icon(Icons.music_note),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: () {}, child: Text("Play")),
                TextButton(onPressed: () {}, child: Text("Delete")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
