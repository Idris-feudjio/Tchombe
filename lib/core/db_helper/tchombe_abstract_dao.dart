import 'package:tchombe/core/db_helper/tchombe_database.dart';
import 'package:tchombe/core/model/abstract_dto.dart';
import 'package:sembast/sembast.dart';
import 'package:tchombe/core/model/abstract_summary_dto.dart';

abstract class TchombeAbstractDao<D extends AbstractDto> {
  final _tchombeStore = intMapStoreFactory.store(D.toString());

  Future<Database> get _db async => await AppDatabase.instance.database;

  Future insert(D dto) async {
    await _tchombeStore.add(
      await _db,
      dto.toJsonMap(),
    );
  }

  Future update(D dto, int id) async {
    final finder = Finder(filter: Filter.byKey(id));
    await _tchombeStore.update(
      await _db,
      dto.toJsonMap(),
      finder: finder,
    );
  }

  Future delete(int? id) async {
    final finder = Finder(filter: Filter.byKey(id));
    await _tchombeStore.delete(
      await _db,
      finder: finder,
    );
  }

  Future<List<AbstractSummaryDto<D>>> searchAll(
      {Filter? filter, List<SortOrder>? sortOrders}) async {
    final finder = Finder(sortOrders: sortOrders, filter: filter);
    final recordSnapshots = await _tchombeStore.find(
      await _db,
      finder: finder
    );

    return recordSnapshots
        .map((snapshot) {
          final D dto = toSummaryDto(snapshot.value) as D;
          final int id = snapshot.key;
          return AbstractSummaryDto(dto, id);
        })
        .toList()
        .cast<AbstractSummaryDto<D>>();
  }

  D? toSummaryDto(dynamic json);
}
