// import 'dart:async';

// import 'package:collection/collection.dart';

// import '/backend/schema/util/firestore_util.dart';
// import '/backend/schema/util/schema_util.dart';
// import '/backend/schema/enums/enums.dart';

// import 'index.dart';
// import '/flutter_flow/flutter_flow_util.dart';

// class ElectionRecord extends FirestoreRecord {
//   ElectionRecord._(
//     DocumentReference reference,
//     Map<String, dynamic> data,
//   ) : super(reference, data) {
//     _initializeFields();
//   }

//   // "electionID" field.
//   int? _electionID;
//   int get electionID => _electionID ?? 0;
//   bool hasElectionID() => _electionID != null;

//   // "electionName" field.
//   String? _electionName;
//   String get electionName => _electionName ?? '';
//   bool hasElectionName() => _electionName != null;

//   // "ballotTracker" field.
//   DocumentReference? _ballotTracker;
//   DocumentReference? get ballotTracker => _ballotTracker;
//   bool hasBallotTracker() => _ballotTracker != null;

//   void _initializeFields() {
//     _electionID = int.parse(reference.id);
//     _electionName = snapshotData['electionName'] as String?;
//     _ballotTracker = snapshotData['ballotTracker'] as DocumentReference?;
//   }

//   static CollectionReference get collection =>
//       FirebaseFirestore.instance.collection('election');

//   static Stream<ElectionRecord> getDocument(DocumentReference ref) =>
//       ref.snapshots().map((s) => ElectionRecord.fromSnapshot(s));

//   static Future<ElectionRecord> getDocumentOnce(DocumentReference ref) =>
//       ref.get().then((s) => ElectionRecord.fromSnapshot(s));

//   static ElectionRecord fromSnapshot(DocumentSnapshot snapshot) =>
//       ElectionRecord._(
//         snapshot.reference,
//         mapFromFirestore(snapshot.data() as Map<String, dynamic>),
//       );

//   static ElectionRecord getDocumentFromData(
//     Map<String, dynamic> data,
//     DocumentReference reference,
//   ) =>
//       ElectionRecord._(reference, mapFromFirestore(data));

//   @override
//   String toString() =>
//       'ElectionRecord(reference: ${reference.path}, data: $snapshotData)';

//   @override
//   int get hashCode => reference.path.hashCode;

//   @override
//   bool operator ==(other) =>
//       other is ElectionRecord &&
//       reference.path.hashCode == other.reference.path.hashCode;
// }

// Map<String, dynamic> createElectionRecordData({
//   int? electionID,
//   String? electionName,
//   DocumentReference? ballotTracker,
// }) {
//   final firestoreData = mapToFirestore(
//     <String, dynamic>{
//       'electionID': electionID,
//       'electionName': electionName,
//       'ballotTracker': ballotTracker,
//     }.withoutNulls,
//   );

//   return firestoreData;
// }

// class ElectionRecordDocumentEquality implements Equality<ElectionRecord> {
//   const ElectionRecordDocumentEquality();

//   @override
//   bool equals(ElectionRecord? e1, ElectionRecord? e2) {
//     return e1?.electionID == e2?.electionID &&
//         e1?.electionName == e2?.electionName &&
//         e1?.ballotTracker == e2?.ballotTracker;
//   }

//   @override
//   int hash(ElectionRecord? e) => const ListEquality()
//       .hash([e?.electionID, e?.electionName, e?.ballotTracker]);

//   @override
//   bool isValidKey(Object? o) => o is ElectionRecord;
// }

import 'dart:async';

import 'package:collection/collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ElectionRecord extends FirestoreRecord {
  ElectionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "electionID" field.
  String? _electionID; // Change type to String
  String get electionID => _electionID ?? '';
  bool hasElectionID() => _electionID != null;

  // "electionName" field.
  String? _electionName;
  String get electionName => _electionName ?? '';
  bool hasElectionName() => _electionName != null;

  // "ballotTracker" field.
  DocumentReference? _ballotTracker;
  DocumentReference? get ballotTracker => _ballotTracker;
  bool hasBallotTracker() => _ballotTracker != null;

  void _initializeFields() {
    // Use the document ID as the electionID
    _electionID = reference.id;
    _electionName = snapshotData['electionName'] as String?;
    _ballotTracker = snapshotData['ballotTracker'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('election');

  static Stream<ElectionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ElectionRecord.fromSnapshot(s));

  static Future<ElectionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ElectionRecord.fromSnapshot(s));

  static ElectionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ElectionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ElectionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ElectionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ElectionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ElectionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createElectionRecordData({
  required String? electionName,
  required DocumentReference? ballotTracker,
}) {
  final Timestamp timestamp = Timestamp.now(); 
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      // No need for 'electionID' parameter here
      'electionName': electionName,
      'ballotTracker': ballotTracker,
      'createdAt': timestamp,
    }.withoutNulls,
  );

  return firestoreData;
}





class ElectionRecordDocumentEquality implements Equality<ElectionRecord> {
  const ElectionRecordDocumentEquality();

  @override
  bool equals(ElectionRecord? e1, ElectionRecord? e2) {
    return e1?.electionID == e2?.electionID &&
        e1?.electionName == e2?.electionName &&
        e1?.ballotTracker == e2?.ballotTracker;
  }

  @override
  int hash(ElectionRecord? e) => const ListEquality()
      .hash([e?.electionID, e?.electionName, e?.ballotTracker]);

  @override
  bool isValidKey(Object? o) => o is ElectionRecord;
}


