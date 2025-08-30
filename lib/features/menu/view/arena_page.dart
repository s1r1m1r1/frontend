import 'dart:async';

import 'package:flutter/material.dart';
import 'package:frontend/app/logger/log_colors.dart';
import 'package:frontend/features/menu/logic/arena_board_notifier.dart';
import 'package:frontend/features/menu/logic/joined_broadcast_notifier.dart';
import 'package:frontend/inject/get_it.dart';
import 'package:provider/provider.dart';
import 'package:sha_red/sha_red.dart';

class ArenaPage extends StatelessWidget {
  const ArenaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      lazy: false,
      create: (_) => getIt<ArenaBoardNotifier>()..subscribe(),
      child: _ArenaView(),
    );
  }
}

class _ArenaView extends StatelessWidget {
  const _ArenaView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: ArenaBoardView()));
  }
}

class ArenaBoardView extends StatefulWidget {
  const ArenaBoardView({super.key});

  @override
  State<ArenaBoardView> createState() => _ArenaBoardViewState();
}

class _ArenaBoardViewState extends State<ArenaBoardView> {
  late final BroadcastInfoNotifier _broadInfoNotifier;
  @override
  void initState() {
    super.initState();
    debugPrint('$magenta initState ArenaPage $reset\n ');
    _broadInfoNotifier = context.read<BroadcastInfoNotifier>();
    _broadInfoNotifier.addListener(_listenBroads);
    _listenBroads();
  }

  @override
  void dispose() {
    super.dispose();
    _broadInfoNotifier.removeListener(_listenBroads);
  }

  void _listenBroads() {
    final broads = _broadInfoNotifier.value.joinedBroads;
    final hasArena = broads.any((i) => i.family == BroadcastFamily.arena);
    debugPrint('$magenta listen ARENA $reset \n\n\n');
    if (!hasArena) {
      context.read<ArenaBoardNotifier>().joinArena();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arena Board'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Consumer<BroadcastInfoNotifier>(
                builder: (context, ntf, _) {
                  return TextButton(
                    child: Text(ntf.value.joinedBroads.toString()),
                    onPressed: () {
                      ntf.fetchBroads();
                    },
                  );
                },
              ),
              Row(
                children: [
                  const Text(
                    'Available Battles',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  Spacer(),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.deepPurple,
                      side: BorderSide(color: Colors.deepPurple),
                    ),
                    child: const Text('Create new battle'),
                    onPressed: () {
                      context.read<ArenaBoardNotifier>().createEdict();
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Using a ListView.builder for efficient rendering of a large list.
              Expanded(
                child: Consumer<ArenaBoardNotifier>(
                  builder: (context, ntf, _) {
                    if (ntf.value.edicts.isEmpty) {
                      return Center(child: Text('No edicts'));
                    }
                    return ListView.builder(
                      itemCount: ntf.value.edicts.length,
                      itemBuilder: (context, index) {
                        final edict = ntf.value.edicts[index];
                        return _EdictCard(edict: edict);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EdictCard extends StatefulWidget {
  final EdictDto edict;
  const _EdictCard({required this.edict});

  @override
  State<_EdictCard> createState() => _EdictCardState();
}

class _EdictCardState extends State<_EdictCard> {
  Timer? _timer;
  Duration _remainingTime = Duration.zero;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    // Calculate the initial remaining time
    final now = DateTime.now();
    _remainingTime = widget.edict.battleStartIn.difference(now);

    // If the time has already passed, set it to zero
    if (_remainingTime.isNegative) {
      _remainingTime = Duration.zero;
    }

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime.inSeconds > 0) {
          _remainingTime = _remainingTime - const Duration(seconds: 1);
        } else {
          // Timer has reached zero, so we cancel it
          _timer?.cancel();
        }
      });
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    final twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.edict.id.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.deepPurple[800],
                        ),
                      ),
                      Text(
                        // Displaying member names and participant count
                        'Members: ${widget.edict.members.map((m) => m.unitName).join(', ')}\nParticipants: ${widget.edict.maxMembers}',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: Text(
                    _formatDuration(_remainingTime),
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: _remainingTime.inSeconds <= 60
                          ? Colors
                                .red // Highlight when time is running out
                          : Colors.black,
                    ),
                  ),
                ),

                SizedBox(
                  width: 100,
                  child: ElevatedButton(
                    onPressed: !widget.edict.isFull
                        ? () => _joinBattle(context, widget.edict.id)
                        : null, // Disable button if battle is full.
                    style: ElevatedButton.styleFrom(
                      backgroundColor: !widget.edict.isFull
                          ? Colors.deepPurple
                          : Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      !widget.edict.isFull ? 'Join' : 'Full',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // A function to handle the "Join" button press.
  void _joinBattle(BuildContext context, int battleId) {
    // In a real application, you would connect to your backend here
    // to send a request to join the battle.
    debugPrint('Attempting to join battle with ID: $battleId');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Joining battle...'),
        duration: Duration(seconds: 1),
      ),
    );
  }
}
