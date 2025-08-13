import 'dart:async';

import 'package:sha_red/sha_red.dart';

import '../../../core/network/protected_api_service.dart';
import 'unit.dart';
import 'package:injectable/injectable.dart';

abstract class UnitRepository {
  Future<(int selectedId, List<Unit> units)?> fetchUnits();
  Future<bool> createUnit(CreateUnitDto dto);

  FutureOr<bool> setSelectedUnit(int unitId);
}

@LazySingleton(as: UnitRepository)
class UnitRepositoryImpl extends UnitRepository {
  UnitRepositoryImpl(this._api);
  final ProtectedApiService _api;

  @override
  Future<(int selectedId, List<Unit> units)?> fetchUnits() async {
    final listDto = await _api.fetchListUnit();
    if (listDto == null) return null;

    return (
      listDto.selectedId,
      listDto.list.map((i) => Unit(id: i.id, name: i.name, atk: i.atk, def: i.def, vitality: i.vitality)).toList(),
    );
  }

  @override
  Future<bool> createUnit(CreateUnitDto dto) async {
    final unit = await _api.createUnit(dto);
    return true;
  }

  @override
  FutureOr<bool> setSelectedUnit(int unitId) async {
    return await _api.setSelectedUnit(unitId: unitId);
  }
}
