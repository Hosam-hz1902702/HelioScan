import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

// class BallotRecord extends FirestoreRecord {
//   BallotRecord._(
//     DocumentReference reference,
//     Map<String, dynamic> data,
//   ) : super(reference, data) {
//     _initializeFields();
//   }

//   // "purpose" field.
//   Purpose? _purpose;
//   Purpose? get purpose => _purpose;
//   bool hasPurpose() => _purpose != null;

//   // "ballotTracker" field.
//   String? _ballotTracker;
//   String get ballotTracker => _ballotTracker ?? '';
//   bool hasBallotTracker() => _ballotTracker != null;

//   void _initializeFields() {
//     _purpose = deserializeEnum<Purpose>(snapshotData['purpose']);
//     _ballotTracker = snapshotData['ballotTracker'] as String?;
//   }

//   static CollectionReference get collection =>
//       FirebaseFirestore.instance.collection('ballot');

//   static Stream<BallotRecord> getDocument(DocumentReference ref) =>
//       ref.snapshots().map((s) => BallotRecord.fromSnapshot(s));

//   static Future<BallotRecord> getDocumentOnce(DocumentReference ref) =>
//       ref.get().then((s) => BallotRecord.fromSnapshot(s));

//   static BallotRecord fromSnapshot(DocumentSnapshot snapshot) => BallotRecord._(
//         snapshot.reference,
//         mapFromFirestore(snapshot.data() as Map<String, dynamic>),
//       );

//   static BallotRecord getDocumentFromData(
//     Map<String, dynamic> data,
//     DocumentReference reference,
//   ) =>
//       BallotRecord._(reference, mapFromFirestore(data));

//   @override
//   String toString() =>
//       'BallotRecord(reference: ${reference.path}, data: $snapshotData)';

//   @override
//   int get hashCode => reference.path.hashCode;

//   @override
//   bool operator ==(other) =>
//       other is BallotRecord &&
//       reference.path.hashCode == other.reference.path.hashCode;
// }

class BallotRecord extends FirestoreRecord {
  BallotRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "purpose" field.
  Purpose? _purpose;
  Purpose? get purpose => _purpose;
  bool hasPurpose() => _purpose != null;

  // "ballotTracker" field.
  DocumentReference? _ballotTracker; // Change type to DocumentReference
  DocumentReference? get ballotTracker => _ballotTracker;
  bool hasBallotTracker() => _ballotTracker != null;

  void _initializeFields() {
    _purpose = deserializeEnum<Purpose>(snapshotData['purpose']);
    _ballotTracker = snapshotData['ballotTracker'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ballot');

  static Stream<BallotRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BallotRecord.fromSnapshot(s));

  static Future<BallotRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BallotRecord.fromSnapshot(s));

  static BallotRecord fromSnapshot(DocumentSnapshot snapshot) => BallotRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BallotRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BallotRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BallotRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BallotRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}


Map<String, dynamic> createBallotRecordData({
  Purpose? purpose,
  String? ballotTracker,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'purpose': purpose,
      'ballotTracker': ballotTracker,
    }.withoutNulls,
  );

  return firestoreData;
}

class BallotRecordDocumentEquality implements Equality<BallotRecord> {
  const BallotRecordDocumentEquality();

  @override
  bool equals(BallotRecord? e1, BallotRecord? e2) {
    return e1?.purpose == e2?.purpose && e1?.ballotTracker == e2?.ballotTracker;
  }

  @override
  int hash(BallotRecord? e) =>
      const ListEquality().hash([e?.purpose, e?.ballotTracker]);

  @override
  bool isValidKey(Object? o) => o is BallotRecord;
}
