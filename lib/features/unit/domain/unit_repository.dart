import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sha_red/sha_red.dart';

import '../../../core/network/protected_api_service.dart';
import 'unit.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UnitRepository {
  UnitRepository(this._api);
  final ProtectedApiService _api;

  final selectedUnitNtf = ValueNotifier<Unit?>(null);
  final listUnitNtf = ValueNotifier<List<Unit>>([]);

  @override
  Future<(int selectedId, List<Unit> units)?> fetchUnits() async {
    final listDto = await _api.fetchListUnit();
    if (listDto == null) return null;

    return (
      listDto.selectedId,
      listDto.list
          .map(
            (i) => Unit(
              id: i.id,
              name: i.name,
              atk: i.atk,
              def: i.def,
              vitality: i.vitality,
            ),
          )
          .toList(),
    );
  }

  Future<bool> createUnit(CreateUnitDto dto) async {
    final unit = await _api.createUnit(dto);
    return true;
  }

  FutureOr<Unit?> setSelectedUnit(int unitId) async {
    final dto = await _api.setSelectedUnit(unitId: unitId);
    if (dto == null) return null;
    final unit = Unit.fromDto(dto);
    selectedUnitNtf.value = unit;
    return unit;
  }

  FutureOr<Unit?> fetchSelectedUnit() async {
    final dto = await _api.fetchSelectedUnit();
    if (dto == null) return null;
    final unit = Unit.fromDto(dto);
    selectedUnitNtf.value = unit;
    return unit;
  }
}
