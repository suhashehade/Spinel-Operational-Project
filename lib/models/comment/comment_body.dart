class CommentBody {
  int masterID;
  int typeID;
  String note;

  CommentBody(
    this.masterID,
    this.typeID,
    this.note,
  );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'masterID': masterID,
      'typeID': typeID,
      'note': note,
    };
    return map;
  }
}
