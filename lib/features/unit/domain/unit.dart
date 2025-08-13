import 'package:equatable/equatable.dart';

class Unit extends Equatable {
  const Unit({required this.id, required this.name, required this.atk, required this.def, required this.vitality});
  final int id;
  final String name;

  // ------ point 1 -------------------
  final int atk; // атака ✅

  // --------- point 2 ------------------
  final int def; // защита ✅
  final int vitality; // жизненная сила ✅

  double physicMultiplier(int atk, int def) {
    if (atk > def) {
      return 1 + (atk - def) * 0.05;
    } else {
      return 1 / (1 + (atk - def) * 0.05);
    }
  }

  get baseHealth {
    return (vitality) * (10);
  }

  // 2. Base Damage Calculation
  double baseDamage(int attacker, int defender) {
    // for atk/def or mind/resist
    return attacker * physicMultiplier(attacker, defender);
  }

  Unit copyWith({int? id, String? name, int? vitality, int? atk, int? def}) {
    return Unit(
      id: id ?? this.id,
      name: name ?? this.name,
      vitality: vitality ?? this.vitality,
      atk: atk ?? this.atk,
      def: def ?? this.def,
    );
  }

  @override
  List<Object?> get props => [id, name, vitality, atk, def];
}
