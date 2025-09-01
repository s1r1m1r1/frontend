import 'dart:async';

import 'package:flutter/material.dart';
import 'package:frontend/app/router/routes.dart';
import 'package:frontend/features/unit/logic/create_unit_notifier.dart';
import 'package:provider/provider.dart';

import '../../../inject/get_it.dart';

class CreateUnitPage extends StatelessWidget {
  const CreateUnitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => getIt<CreateUnitNotifier>()..started(),
      child: _CreateCharPageView(),
    );
  }
}

// Create Character Page
class _CreateCharPageView extends StatefulWidget {
  const _CreateCharPageView();

  @override
  State<_CreateCharPageView> createState() => _CreateCharPageViewState();
}

class _CreateCharPageViewState extends State<_CreateCharPageView> {
  late CreateUnitNotifier _notifier;
  @override
  void initState() {
    super.initState();
    _notifier = context.read<CreateUnitNotifier>();
    _notifier.addListener(_listen);
    WidgetsBinding.instance.addPostFrameCallback((_) => _listen());
  }

  void _listen() {
    final state = _notifier.value;
    switch (state.status) {
      case UnitStateStatus.initial:
      case UnitStateStatus.editing:
      case UnitStateStatus.valid:
        break;
      case UnitStateStatus.created:
        PendingRoute().go(context);
    }
  }

  @override
  void dispose() {
    _notifier.removeListener(_listen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Column: All character information sections, made scrollable
              Expanded(
                flex: 2,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const _CharacterHeader(),
                      const SizedBox(height: 16),
                      const _StatsSection(),

                      const SizedBox(height: 32),
                      Selector<CreateUnitNotifier, CreateUnitState>(
                        shouldRebuild: (previous, next) {
                          return previous.status != next.status;
                        },
                        selector: (_, ntf) {
                          return ntf.value;
                        },
                        builder: (context, state, _) {
                          return OutlinedButton(
                            onPressed: state.status == UnitStateStatus.valid
                                ? () {
                                    context
                                        .read<CreateUnitNotifier>()
                                        .createUnit();
                                  }
                                : null,
                            child: const Text('Create Unit'),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 16),
                      // Skills section
                      const _SkillsSection(),
                      const SizedBox(height: 16),
                      // Resistances section
                      const _ResistancesSection(),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),

              const SizedBox(width: 16),
              // Right Column: Placeholder for character image/3D model
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Center(
                    child: Text(
                      'Character Portrait / 3D Model',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white30,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(child: const _MiscStatsSection()),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget for the character name and class at the top
class _CharacterHeader extends StatelessWidget {
  const _CharacterHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Selector<CreateUnitNotifier, String>(
          shouldRebuild: (previous, next) => previous != next,
          selector: (_, ntf) => ntf.value.name,
          builder: (context, name, _) {
            return TextFormField(
              initialValue: name,
              onChanged: (value) =>
                  context.read<CreateUnitNotifier>().nameChanged(value),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter character name',
              ),
            );
          },
        ),
      ],
    );
  }
}

// Widget for a section with a title and a list of items
class _CharacterSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _CharacterSection({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const Divider(color: Colors.white12),
            ...children,
          ],
        ),
      ),
    );
  }
}

// Widget for a single stat item with increment/decrement buttons
class _StatItemWithButtons extends StatelessWidget {
  final String label;
  final int value;
  final IconData? icon;
  final VoidCallback? onIncrement;
  final VoidCallback? onDecrement;

  const _StatItemWithButtons({
    required this.label,
    required this.value,
    required this.onIncrement,
    required this.onDecrement,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (icon != null) ...[
                Icon(icon, color: Colors.deepPurple),
                const SizedBox(width: 8),
              ],
              Text(label, style: const TextStyle(fontSize: 16)),
            ],
          ),
          Row(
            children: [
              IconButton(
                style: IconButton.styleFrom(foregroundColor: Colors.white),
                icon: const Icon(Icons.remove),
                onPressed: onDecrement,
                visualDensity: VisualDensity.compact,
              ),
              SizedBox(
                width: 30,
                child: Text(
                  value.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                style: IconButton.styleFrom(foregroundColor: Colors.white),
                icon: const Icon(Icons.add),
                onPressed: onIncrement,
                visualDensity: VisualDensity.compact,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Section for core stats (Body, Agility, etc.)
class _StatsSection extends StatelessWidget {
  const _StatsSection();

  @override
  Widget build(BuildContext context) {
    return _CharacterSection(
      title: 'Stats',
      children: [
        Selector<CreateUnitNotifier, int>(
          selector: (_, ntf) => ntf.value.freePoint,
          shouldRebuild: (previous, next) => previous != next,

          builder: (context, freePoint, _) {
            return Text(
              'Free Points: $freePoint',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            );
          },
        ),

        Selector<CreateUnitNotifier, CreateUnitState>(
          selector: (_, ntf) => ntf.value,
          shouldRebuild: (previous, next) =>
              previous.vitality != next.vitality ||
              previous.freePoint > 0 != next.freePoint > 0,

          builder: (context, state, _) {
            return _StatItemWithButtons(
              label: 'vitality',
              value: state.vitality,
              onIncrement: state.freePoint > 0
                  ? () => context.read<CreateUnitNotifier>().increment(
                      StatType.vitality,
                    )
                  : null,
              onDecrement: state.vitality > 0
                  ? () => context.read<CreateUnitNotifier>().decrement(
                      StatType.vitality,
                    )
                  : null,
            );
          },
        ),

        Selector<CreateUnitNotifier, CreateUnitState>(
          selector: (_, ntf) => ntf.value,
          shouldRebuild: (previous, next) =>
              previous.atk != next.atk ||
              previous.freePoint > 0 != next.freePoint > 0,

          builder: (context, state, _) {
            return _StatItemWithButtons(
              label: 'atk',
              value: state.atk,
              onIncrement: state.atk > 0
                  ? () => context.read<CreateUnitNotifier>().increment(
                      StatType.atk,
                    )
                  : null,
              onDecrement: state.atk > 0
                  ? () => context.read<CreateUnitNotifier>().decrement(
                      StatType.atk,
                    )
                  : null,
            );
          },
        ),

        Selector<CreateUnitNotifier, CreateUnitState>(
          selector: (_, ntf) => ntf.value,
          shouldRebuild: (previous, next) =>
              previous.def != next.def ||
              previous.freePoint > 0 != next.freePoint > 0,

          builder: (context, state, _) {
            return _StatItemWithButtons(
              label: 'def',
              value: state.def,
              onIncrement: state.def > 0
                  ? () => context.read<CreateUnitNotifier>().increment(
                      StatType.def,
                    )
                  : null,
              onDecrement: state.def > 0
                  ? () => context.read<CreateUnitNotifier>().decrement(
                      StatType.def,
                    )
                  : null,
            );
          },
        ),
      ],
    );
  }
}

// Widget for a single stat item (label and value), used for non-editable stats
class _StatItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData? icon;

  const _StatItem({required this.label, required this.value, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (icon != null) ...[
                Icon(icon, color: Colors.deepPurple),
                const SizedBox(width: 8),
              ],
              Text(label, style: const TextStyle(fontSize: 16)),
            ],
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

// Section for skills
class _SkillsSection extends StatelessWidget {
  const _SkillsSection();

  @override
  Widget build(BuildContext context) {
    return _CharacterSection(
      title: 'Skills',
      children: const [
        _StatItem(label: 'Blade', value: '15'),
        _StatItem(label: 'Axe', value: '12'),
        _StatItem(label: 'Bludgeon', value: '10'),
        _StatItem(label: 'Pike', value: '8'),
        _StatItem(label: 'Shooting', value: '5'),
      ],
    );
  }
}

// Section for resistances
class _ResistancesSection extends StatelessWidget {
  const _ResistancesSection();

  @override
  Widget build(BuildContext context) {
    return _CharacterSection(
      title: 'Resistances',
      children: const [
        _StatItem(label: 'Fire', value: '25%'),
        _StatItem(label: 'Water', value: '10%'),
        _StatItem(label: 'Air', value: '5%'),
        _StatItem(label: 'Earth', value: '15%'),
        _StatItem(label: 'Astral', value: '20%'),
      ],
    );
  }
}

// Section for miscellaneous stats like Weight, XP, etc.
class _MiscStatsSection extends StatelessWidget {
  const _MiscStatsSection();

  @override
  Widget build(BuildContext context) {
    return _CharacterSection(
      title: 'Other Attributes',
      children: [
        // Using a Wrap widget to handle multiple items in a single row
        Wrap(
          spacing: 16.0,
          runSpacing: 8.0,
          children: const [
            _MiscStatItem(label: 'Weight', value: '50/150'),
            _MiscStatItem(label: 'XP', value: '12500'),
            _MiscStatItem(label: 'Sight', value: 'Normal'),
            _MiscStatItem(label: 'Speed', value: '1.2m/s'),
          ],
        ),
      ],
    );
  }
}

// Widget for a single miscellaneous stat item
class _MiscStatItem extends StatelessWidget {
  final String label;
  final String value;

  const _MiscStatItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 14, color: Colors.white54),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
