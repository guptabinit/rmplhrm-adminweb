import 'package:cloud_firestore/cloud_firestore.dart';

class HolidayModel {
  final String holidayID;
  final String date;
  final String title;
  final String formattedDate;

  const HolidayModel({
    required this.holidayID,
    required this.date,
    required this.title,
    required this.formattedDate,
  });

  Map<String, dynamic> toJson() => {
    'holidayID': holidayID,
    'date': date,
    'title': title,
    'formattedDate': formattedDate,
  };

  static HolidayModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return HolidayModel(
      holidayID: snapshot['holidayID'],
      date: snapshot['date'],
      title: snapshot['title'],
      formattedDate: snapshot['formattedDate'],
    );
  }
}
