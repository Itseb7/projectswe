import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserdeatilssRecord extends FirestoreRecord {
  UserdeatilssRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _image = snapshotData['image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userdeatilss');

  static Stream<UserdeatilssRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserdeatilssRecord.fromSnapshot(s));

  static Future<UserdeatilssRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserdeatilssRecord.fromSnapshot(s));

  static UserdeatilssRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserdeatilssRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserdeatilssRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserdeatilssRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserdeatilssRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserdeatilssRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserdeatilssRecordData({
  String? name,
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserdeatilssRecordDocumentEquality
    implements Equality<UserdeatilssRecord> {
  const UserdeatilssRecordDocumentEquality();

  @override
  bool equals(UserdeatilssRecord? e1, UserdeatilssRecord? e2) {
    return e1?.name == e2?.name && e1?.image == e2?.image;
  }

  @override
  int hash(UserdeatilssRecord? e) =>
      const ListEquality().hash([e?.name, e?.image]);

  @override
  bool isValidKey(Object? o) => o is UserdeatilssRecord;
}
