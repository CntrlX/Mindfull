import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mindfull/src/data/models/note.dart';
import 'package:mindfull/src/data/services/live_coach.dart';

class Note extends StatefulWidget {
  const Note({super.key});

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {
  List<note_model> note=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mindfull"),),
      body: Container(
        child: ListView.builder(
          itemCount: note.length,
          itemBuilder: (context, index) {
          return noteWidget(content: note[index].note_content, feedback:  note[index].note_feedback);
        },)
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
showDialog(context: context, builder: (context) {
  TextEditingController a = TextEditingController();
  return
          Container(
            height: 200,
            child: AlertDialog(
              content: Column(
                children: [
                  TextField(
                    controller: a,
                  )
                ],
              ),
              actions: [
                IconButton(onPressed: () async{
                  final response = await coach().checkNote(a.text);
              setState(() {
                note.add(note_model(note_content: a.text, note_id:1,note_feedback: response ));
              });
              Navigator.pop(context);
              log("LOG: "+note.length.toString());
                }, icon: Icon(Icons.add) )
              ],
            ),
          );
},);
          
      },),
    );
  }
}


class noteWidget extends StatelessWidget {
  String content;
  String? feedback;
  noteWidget({super.key, required this.content, this.feedback });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
       
        width: 600,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.amber.shade200,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: Column(
            children: [
              Text(content),
              Divider(),
              Text(feedback!),
            ],
          )),
        ),
      ),
    );
  }
}