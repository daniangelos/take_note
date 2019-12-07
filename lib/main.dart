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
          return _buildNoteItem(_notesTaken[index], index);
        }
      },
    );
  }

  Widget _buildNoteItem(String note, int index) {
    return new ListTile(
      title: Text(note),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        color: Colors.red,
        tooltip: 'Delete note',
        onPressed: () {
          _removeNote(index);
        },
      ),
    );
  }

  void _addNote(String note) {
    setState(() {
      if (note.length > 0) {
        _notesTaken.add(note);
      }
    });
  }

  void _removeNote(int index) {
    setState(() {
      _notesTaken.removeAt(index);
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
        onPressed: _pushAddTodoScreen,
        tooltip: 'Add new note',
        child: Icon(Icons.add),
      ),
    );
  }

  void _pushAddTodoScreen() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Add new note'),
        ),
        body: new TextField(
          autofocus: true,
          onSubmitted: (val) {
            _addNote(val);
            Navigator.pop(context);
          },
          decoration: InputDecoration(
              hintText: 'What are you thinking? ',
              contentPadding: const EdgeInsets.all(16.0)),
        ),
      );
    }));
  }
}
