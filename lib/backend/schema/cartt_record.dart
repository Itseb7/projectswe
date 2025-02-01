import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CarttRecord extends FirestoreRecord {
  CarttRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_by" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "item" field.
  DocumentReference? _item;
  DocumentReference? get item => _item;
  bool hasItem() => _item != null;

  void _initializeFields() {
    _createdBy = snapshotData['created_by'] as DocumentReference?;
    _item = snapshotData['item'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cartt');

  static Stream<CarttRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CarttRecord.fromSnapshot(s));

  static Future<CarttRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CarttRecord.fromSnapshot(s));

  static CarttRecord fromSnapshot(DocumentSnapshot snapshot) => CarttRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CarttRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CarttRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CarttRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CarttRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCarttRecordData({
  DocumentReference? createdBy,
  DocumentReference? item,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_by': createdBy,
      'item': item,
    }.withoutNulls,
  );

  return firestoreData;
}

class CarttRecordDocumentEquality implements Equality<CarttRecord> {
  const CarttRecordDocumentEquality();

  @override
  bool equals(CarttRecord? e1, CarttRecord? e2) {
    return e1?.createdBy == e2?.createdBy && e1?.item == e2?.item;
  }

  @override
  int hash(CarttRecord? e) =>
      const ListEquality().hash([e?.createdBy, e?.item]);

  @override
  bool isValidKey(Object? o) => o is CarttRecord;
}
