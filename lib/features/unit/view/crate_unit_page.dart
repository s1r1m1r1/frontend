import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/app/router/user_routes.dart';
import 'package:frontend/features/unit/logic/create_unit_bloc.dart';

import '../../../inject/get_it.dart';

class CreateUnitPage extends StatelessWidget {
  const CreateUnitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<CreateUnitBloc>()..add(const CreateUnitEvent.started()),
      child: _CreateCharPageView(),
    );
  }
}

// Create Character Page
class _CreateCharPageView extends StatelessWidget {
  const _CreateCharPageView();

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateUnitBloc, CreateUnitState>(
      listener: (context, state) {
        switch (state.status) {
          case UnitStateStatus.initial:
          case UnitStateStatus.editing:
          case UnitStateStatus.valid:
            break;
          case UnitStateStatus.created:
            PendingRoute().go(context);
        }
      },
      child: Scaffold(
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
                        BlocBuilder<CreateUnitBloc, CreateUnitState>(
                          buildWhen: (previous, current) =>
                              previous.status != current.status,
                          builder: (context, state) {
                            return OutlinedButton(
                              onPressed: state.status == UnitStateStatus.valid
                                  ? () {
                                      context.read<CreateUnitBloc>().add(
                                        const CreateUnitEvent.create(),
                                      );
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
        BlocBuilder<CreateUnitBloc, CreateUnitState>(
          buildWhen: (previous, current) => previous.name != current.name,
          builder: (context, state) {
            return TextFormField(
              initialValue: state.name,
              onChanged: (value) => context.read<CreateUnitBloc>().add(
                CreateUnitEvent.nameChanged(value),
              ),
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
        BlocBuilder<CreateUnitBloc, CreateUnitState>(
          buildWhen: (previous, current) =>
              previous.freePoint != current.freePoint ||
              previous.freePoint > 0 != current.freePoint > 0,
          builder: (context, state) {
            return Text(
              'Free Points: ${state.freePoint}',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            );
          },
        ),

        BlocBuilder<CreateUnitBloc, CreateUnitState>(
          buildWhen: (previous, current) =>
              previous.vitality != current.vitality ||
              previous.freePoint > 0 != current.freePoint > 0,
          builder: (context, state) {
            return _StatItemWithButtons(
              label: 'vitality',
              value: state.vitality,
              onIncrement: state.freePoint > 0
                  ? () => context.read<CreateUnitBloc>().add(
                      CreateUnitEvent.incrementStats(StatType.vitality),
                    )
                  : null,
              onDecrement: state.vitality > 0
                  ? () => context.read<CreateUnitBloc>().add(
                      CreateUnitEvent.decrementStats(StatType.vitality),
                    )
                  : null,
            );
          },
        ),

        BlocBuilder<CreateUnitBloc, CreateUnitState>(
          buildWhen: (previous, current) =>
              previous.atk != current.atk ||
              previous.freePoint > 0 != current.freePoint > 0,
          builder: (context, state) {
            return _StatItemWithButtons(
              label: 'atk',
              value: state.atk,
              onIncrement: state.freePoint > 0
                  ? () => context.read<CreateUnitBloc>().add(
                      CreateUnitEvent.incrementStats(StatType.atk),
                    )
                  : null,
              onDecrement: state.atk > 0
                  ? () => context.read<CreateUnitBloc>().add(
                      CreateUnitEvent.decrementStats(StatType.atk),
                    )
                  : null,
            );
          },
        ),

        BlocBuilder<CreateUnitBloc, CreateUnitState>(
          buildWhen: (previous, current) =>
              previous.def != current.def ||
              previous.freePoint > 0 != current.freePoint > 0,
          builder: (context, state) {
            return _StatItemWithButtons(
              label: 'def',
              value: state.def,
              onIncrement: state.freePoint > 0
                  ? () => context.read<CreateUnitBloc>().add(
                      CreateUnitEvent.incrementStats(StatType.def),
                    )
                  : null,
              onDecrement: state.def > 0
                  ? () => context.read<CreateUnitBloc>().add(
                      CreateUnitEvent.decrementStats(StatType.def),
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
