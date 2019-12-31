class Certificate{
  String title, dateTime, assignedTo;

  Certificate({this.title, this.assignedTo, this.dateTime});

  Map <String, dynamic> toMap(){
    return {
      'title': title,
      'reciever': assignedTo,
      'datetime': dateTime
    };
  }
}