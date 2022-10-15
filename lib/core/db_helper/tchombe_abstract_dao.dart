import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:tchombe/core/model/abstract_dto.dart';
import 'package:tchombe/core/model/abstract_summary_dto.dart';

abstract class TchombeAbstractDao<D extends AbstractDto> {
  final CollectionReference _tchombeStore =
      FirebaseFirestore.instance.collection(D.toString());

  Future insert(D dto) async {
    await _tchombeStore.add(dto.toJsonMap());
  }

  Future delete(String id) async {
    await _tchombeStore.doc(id).delete();
  }

  Future update(D dto, String id) async {
    _tchombeStore.doc(id).update(dto.toJsonMap());
  }

  Future<List<AbstractSummaryDto<D>>> searchAll() async {
    final recordSnapshots = await _tchombeStore.get();
    debugPrint(recordSnapshots.docs.toString());
    return recordSnapshots.docs
        .map((snapshot) {
          final D dto = toSummaryDto(snapshot.data()) as D;
          final String id = snapshot.id;
          return AbstractSummaryDto(dto, id);
        })
        .toList()
        .cast<AbstractSummaryDto<D>>();
  }

  D? toSummaryDto(dynamic json);
}
