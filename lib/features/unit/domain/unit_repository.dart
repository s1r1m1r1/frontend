import 'dart:async';

import 'package:flutter/material.dart';
import 'package:frontend/core/network/with_token_api.dart';
import 'package:sha_red/sha_red.dart';

import 'unit.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UnitRepository {
  UnitRepository(this._api);
  final WithTokenApi _api;

  final selectedUnitNtf = ValueNotifier<Unit?>(null);
  final listUnitNtf = ValueNotifier<List<Unit>>([]);

  @override
  Future<(int selectedId, List<Unit> units)?> fetchUnits() async {
    final resp = await _api.fetchListUnit();
    final listDto = resp.body;
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
    final resp = await _api.setSelectedUnit(unitId);
    final dto = resp.body;
    if (dto == null) return null;
    final unit = Unit.fromDto(dto);
    selectedUnitNtf.value = unit;
    return unit;
  }

  FutureOr<Unit?> fetchSelectedUnit() async {
    final resp = await _api.fetchSelectedUnit();
    final dto = resp.body;
    if (dto == null) return null;
    final unit = Unit.fromDto(dto);
    selectedUnitNtf.value = unit;
    return unit;
  }
}
