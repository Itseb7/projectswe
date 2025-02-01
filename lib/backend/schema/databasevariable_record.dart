import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DatabasevariableRecord extends FirestoreRecord {
  DatabasevariableRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "confirrmpassword" field.
  String? _confirrmpassword;
  String get confirrmpassword => _confirrmpassword ?? '';
  bool hasConfirrmpassword() => _confirrmpassword != null;

  // "feedback" field.
  String? _feedback;
  String get feedback => _feedback ?? '';
  bool hasFeedback() => _feedback != null;

  // "cardnumber" field.
  int? _cardnumber;
  int get cardnumber => _cardnumber ?? 0;
  bool hasCardnumber() => _cardnumber != null;

  // "expdate" field.
  String? _expdate;
  String get expdate => _expdate ?? '';
  bool hasExpdate() => _expdate != null;

  // "cvv" field.
  int? _cvv;
  int get cvv => _cvv ?? 0;
  bool hasCvv() => _cvv != null;

  // "emailreset" field.
  String? _emailreset;
  String get emailreset => _emailreset ?? '';
  bool hasEmailreset() => _emailreset != null;

  void _initializeFields() {
    _confirrmpassword = snapshotData['confirrmpassword'] as String?;
    _feedback = snapshotData['feedback'] as String?;
    _cardnumber = castToType<int>(snapshotData['cardnumber']);
    _expdate = snapshotData['expdate'] as String?;
    _cvv = castToType<int>(snapshotData['cvv']);
    _emailreset = snapshotData['emailreset'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('databasevariable');

  static Stream<DatabasevariableRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DatabasevariableRecord.fromSnapshot(s));

  static Future<DatabasevariableRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => DatabasevariableRecord.fromSnapshot(s));

  static DatabasevariableRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DatabasevariableRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DatabasevariableRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DatabasevariableRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DatabasevariableRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DatabasevariableRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDatabasevariableRecordData({
  String? confirrmpassword,
  String? feedback,
  int? cardnumber,
  String? expdate,
  int? cvv,
  String? emailreset,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'confirrmpassword': confirrmpassword,
      'feedback': feedback,
      'cardnumber': cardnumber,
      'expdate': expdate,
      'cvv': cvv,
      'emailreset': emailreset,
    }.withoutNulls,
  );

  return firestoreData;
}

class DatabasevariableRecordDocumentEquality
    implements Equality<DatabasevariableRecord> {
  const DatabasevariableRecordDocumentEquality();

  @override
  bool equals(DatabasevariableRecord? e1, DatabasevariableRecord? e2) {
    return e1?.confirrmpassword == e2?.confirrmpassword &&
        e1?.feedback == e2?.feedback &&
        e1?.cardnumber == e2?.cardnumber &&
        e1?.expdate == e2?.expdate &&
        e1?.cvv == e2?.cvv &&
        e1?.emailreset == e2?.emailreset;
  }

  @override
  int hash(DatabasevariableRecord? e) => const ListEquality().hash([
        e?.confirrmpassword,
        e?.feedback,
        e?.cardnumber,
        e?.expdate,
        e?.cvv,
        e?.emailreset
      ]);

  @override
  bool isValidKey(Object? o) => o is DatabasevariableRecord;
}
