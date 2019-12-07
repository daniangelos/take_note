import 'package:flutter/material.dart';

void main() => runApp(MyNotes());

class MyNotes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Note Taking', home: NoteList());
  }
}

class NoteList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NoteListState();
  }
}

class NoteListState extends State<NoteList> {
  List<String> _notesTaken = [];

  Widget _buildNotesList() {
    return new ListView.builder(
      itemBuilder: (context, index) {
        if (index < _notesTaken.length) {
          return _buildNoteItem(_notesTaken[index]);
        }
      },
    );
  }

  Widget _buildNoteItem(String note) {
    return new ListTile(
      title: Text(note),
    );
  }

  void _addNote() {
    setState(() {
      int index = _notesTaken.length;
      _notesTaken.add('This is note ' + index.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Notes!'),
      ),
      body: _buildNotesList(),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNote,
        tooltip: 'Add new note',
        child: Icon(Icons.add),
      ),
    );
  }
}
