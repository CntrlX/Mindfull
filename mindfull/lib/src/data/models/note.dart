class note_model {
  int note_id;
  String note_content;
  String? note_feedback;
  note_model({
    required this.note_id,
    required this.note_content,
    this.note_feedback
  });
}