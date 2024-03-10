// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PurposeStruct extends FFFirebaseStruct {
  PurposeStruct({
    Purpose? purpose,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _purpose = purpose,
        super(firestoreUtilData);

  // "purpose" field.
  Purpose? _purpose;
  Purpose get purpose => _purpose ?? Purpose.checkExistance;
  set purpose(Purpose? val) => _purpose = val;
  bool hasPurpose() => _purpose != null;

  static PurposeStruct fromMap(Map<String, dynamic> data) => PurposeStruct(
        purpose: deserializeEnum<Purpose>(data['purpose']),
      );

  static PurposeStruct? maybeFromMap(dynamic data) =>
      data is Map ? PurposeStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'purpose': _purpose?.serialize(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'purpose': serializeParam(
          _purpose,
          ParamType.Enum,
        ),
      }.withoutNulls;

  static PurposeStruct fromSerializableMap(Map<String, dynamic> data) =>
      PurposeStruct(
        purpose: deserializeParam<Purpose>(
          data['purpose'],
          ParamType.Enum,
          false,
        ),
      );

  @override
  String toString() => 'PurposeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PurposeStruct && purpose == other.purpose;
  }

  @override
  int get hashCode => const ListEquality().hash([purpose]);
}

PurposeStruct createPurposeStruct({
  Purpose? purpose,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PurposeStruct(
      purpose: purpose,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PurposeStruct? updatePurposeStruct(
  PurposeStruct? purposeStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    purposeStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPurposeStructData(
  Map<String, dynamic> firestoreData,
  PurposeStruct? purposeStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (purposeStruct == null) {
    return;
  }
  if (purposeStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && purposeStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final purposeStructData =
      getPurposeFirestoreData(purposeStruct, forFieldValue);
  final nestedData =
      purposeStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = purposeStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPurposeFirestoreData(
  PurposeStruct? purposeStruct, [
  bool forFieldValue = false,
]) {
  if (purposeStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(purposeStruct.toMap());

  // Add any Firestore field values
  purposeStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPurposeListFirestoreData(
  List<PurposeStruct>? purposeStructs,
) =>
    purposeStructs?.map((e) => getPurposeFirestoreData(e, true)).toList() ?? [];
