class Comment {
  int? id;
  String? note;
  String? recordAddBy;
  Comment(
    this.id,
    this.note,
    this.recordAddBy,
  );
  factory Comment.fromJson(json) {
    return Comment(
      json['id'],
      json['note'],
      json['recordAddBy'],
    );
  }
}
