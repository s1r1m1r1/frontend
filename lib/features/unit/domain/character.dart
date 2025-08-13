import 'package:equatable/equatable.dart';

class Character extends Equatable {
  const Character({
    required this.id,
    required this.name,

    required this.atk,
    required this.mind,

    // required this.strength,
    required this.def,
    required this.resistance,
    required this.vitality,

    required this.fury,
    required this.accuracy,
    required this.agility,

    required this.retaliation,
  });
  final int id;
  final String name;

  // ------ point 1 -------------------
  final int atk; // атака ✅
  final int mind; // разум ✅

  // способность носить оружие
  // final int strength; // сила ❌

  // --------- point 2 ------------------
  final int def; // защита ✅
  final int resistance; // сопротивление ✅
  final int vitality; // жизненная сила ✅

  // final int armor; // броня ❌
  // final int magicArmor; // магическая броня ❌
  // final int shield // щит защищает от одной любой атаки ❌

  //-------- point 3 -------------

  // угадать атаку , после чего можно будет нанести возмездие своей атакой
  // активная защита
  // не зеркало
  final int retaliation; //возмездие

  // вариант атаки
  // повышает шанс пробития блока c частичным уроном
  // крит ✅
  final int fury;

  // повышает шанс попадания
  // понижает шанс крита , пассивная защита против fury
  // повышает точность при стрельбе ✅
  final int accuracy; // точность

  // вариант защиты
  // пассивная защита
  // снижает входящий урон при рикошете ❌ , нет zero def
  // снижает шанс на возмездие
  // ловкость ✅
  final int agility;

  double physicMultiplier(int atk, int def) {
    if (atk > def) {
      return 1 + (atk - def) * 0.05;
    } else {
      return 1 / (1 + (atk - def) * 0.05);
    }
  }

  double magicMultiplier(int mind, int resistance) {
    if (mind > resistance) {
      return 1 + (mind - resistance) * 0.05;
    } else {
      return 1 / (1 + (mind - resistance) * 0.05);
    }
  }

  double getHitChance(int attackerLucky, int defenderAgility) {
    var hitChance = 0.85 + (attackerLucky - defenderAgility) * 0.01;
    if (hitChance < 0.10) {
      hitChance = 0.10; // Capping the minimum hit chance at 10%
    }
    return hitChance;
  }

  double getRetaliationChance(int attackerRetaliation, int defenderRetaliation) {
    var retaliationChance = 0.15 + (attackerRetaliation - defenderRetaliation) * 0.01;
    if (retaliationChance < 0.05) {
      retaliationChance = 0.05; // Capping the minimum critical chance at 5%
    }
    return retaliationChance;
  }

  double getCriticalChance(int attackerCriticalChance, int defenderLucky) {
    var criticalChance = 0.15 + (attackerCriticalChance - defenderLucky) * 0.01;
    if (criticalChance < 0.05) {
      criticalChance = 0.05; // Capping the minimum critical chance at 5%
    }
    return criticalChance;
  }

  final double critMultiply = 1.5;

  // vitality 100 , def 0 , resistance 0 = 1000 // 100
  // vitality 50 , def 50  , resistance 50 = 1000 // 150
  // vitality 100 , def 100 , resistance 0 = 2000 // 2000
  get baseHealth {
    return (vitality) * (12 + (def + resistance) * 0.1);
  }

  // 2. Base Damage Calculation
  double baseDamage(int attacker, int defender) {
    // for atk/def or mind/resist
    return attacker * physicMultiplier(attacker, defender);
  }

  Character copyWith({int? id, String? name, int? vitality, int? atk, int? def, int? mind, int? resistance}) {
    return Character(
      id: id ?? this.id,
      name: name ?? this.name,
      vitality: vitality ?? this.vitality,
      atk: atk ?? this.atk,
      def: def ?? this.def,
      mind: mind ?? this.mind,
      resistance: resistance ?? this.resistance,
      fury: 0,
      accuracy: 0,
      agility: 0,
      retaliation: 0,
    );
  }

  @override
  List<Object?> get props => [id, name, vitality, atk, def, mind, resistance];
}
