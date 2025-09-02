// Assuming you have a theme with these colors
import 'package:flutter/material.dart';
import 'package:frontend/app/router/routes.dart';
import 'package:frontend/features/auth/domain/session.dart';
import 'package:frontend/features/auth/logic/session_notifier.dart';
import 'package:frontend/features/menu/logic/joined_broadcast_notifier.dart';
import 'package:frontend/features/menu/logic/letters_notifier.dart';
import 'package:frontend/features/menu/logic/chat_member_notifier.dart';
import 'package:frontend/features/menu/logic/ws_connection_notifier.dart';
import 'package:provider/provider.dart';
import 'package:get_it/get_it.dart';

import '../../../inject/get_it.dart';

class MenuPage extends StatelessWidget {
  final int roomId;
  final int senderId;
  const MenuPage({super.key, required this.roomId, required this.senderId});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: getIt<SessionNotifier>()),
        ChangeNotifierProvider.value(
          value: getIt<ChatMemberNotifier>()..subscribe(),
        ),

        ChangeNotifierProvider(
          lazy: false,
          create: (_) =>
              GetIt.I.get<LettersNotifier>(param1: roomId, param2: senderId)
                ..subscribed()
                ..joinRoom(),
        ),

        // ..add(LettersEvent.joinRoom(roomId)
        // ),
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => getIt<WsConnectionNotifier>()..listenConnection(),
        ),
      ],

      child: const MenuView(),
    );
  }
}

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: SafeArea(
        child: Column(
          children: [
            // Top Bar
            Container(
              height: 50,
              color: primaryColor,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  // Placeholder for the top-left icon
                  Container(
                    color: accentColor,
                    child: IconButton(
                      icon: Icon(Icons.exit_to_app, color: Colors.black),
                      onPressed: () {
                        context.read<SessionNotifier>().logout();
                      },
                    ),
                  ),
                  const Spacer(),
                  Consumer<ChatMemberNotifier>(
                    builder: (context, ntf, _) {
                      final state = ntf.value;
                      switch (state) {
                        case InitialState():
                          return Text('-0-');
                        case SuccessState():
                          return Text('${state.memberIds.length}');
                      }
                    },
                  ),

                  const Spacer(),
                  Consumer<WsConnectionNotifier>(
                    builder: (context, ntf, _) {
                      return Text(
                        ntf.value.name.toString(),
                        style: TextStyle(fontSize: 8),
                      );
                    },
                  ),
                  const SizedBox(width: 8),
                  // Top buttons
                  _buildTopButton('КАРТА'),
                  const SizedBox(width: 8),
                  _buildTopButton('РЮКЗАК'),
                  const SizedBox(width: 8),
                  _buildTopButton('ПРОФЕССИЯ'),
                ],
              ),
            ),
            // Main Content Area
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors
                        .blueGrey[900], // Simulating the wooden background
                    border: Border.all(color: accentColor, width: 2),
                  ),
                  child: Center(
                    // Placeholder for the main game UI content
                    child: Column(
                      children: [
                        Text(
                          'Game UI Content',
                          style: TextStyle(color: accentColor),
                        ),
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
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // Middle Button Bar
            Container(
              height: 50,
              color: primaryColor,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildMiddleButton('В БОЙ', Colors.green, context),
                  _buildMiddleButton(
                    'ТОРГОВЛЯ',
                    const Color.fromARGB(255, 95, 0, 52),
                    context,
                  ),
                  _buildMiddleButton('БАНК', Colors.blue, context),
                  _buildMiddleButton('НАСТРОЙКИ', Colors.grey, context),
                ],
              ),
            ),

            // Bottom Chat Box
            const _ChatView(),
          ],
        ),
      ),
    );
  }

  Widget _buildTopButton(String text) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        foregroundColor: accentColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Text(text),
    );
  }

  Widget _buildMiddleButton(String text, Color color, BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        ArenaRoute().push(context);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(text),
    );
  }
}

class _ChatView extends StatefulWidget {
  const _ChatView();

  @override
  State<_ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<_ChatView> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: chatBackgroundColor,
      height: 400,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // Chat history area
          Expanded(child: _ChatBody()),
          const SizedBox(height: 8),
          // Chat input area
          Row(
            children: [
              Expanded(
                child: TextField(
                  // Assign the controller to the TextField
                  controller: _controller,
                  // Set the maximum length for the input
                  maxLength: 1000,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Enter message...',
                    hintStyle: const TextStyle(color: Colors.white54),
                    filled: true,
                    fillColor: Colors.black,
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 235, 0, 24),
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 235, 0, 24),
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    // counterText:  '',
                  ),
                ),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {
                  final message = _controller.text;

                  context.read<LettersNotifier>().newPressed(message);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  foregroundColor: accentColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: const Text('Send'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ChatBody extends StatelessWidget {
  const _ChatBody();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(color: accentColor),
      ),
      child: Row(
        children: [
          Expanded(
            child: Consumer<SessionNotifier>(
              builder: (context, ntf, _) {
                final int senderId;
                if (ntf.value case WsSession(:final unit)) {
                  senderId = unit.id;
                } else {
                  senderId = -1;
                }
                return Consumer<LettersNotifier>(
                  builder: (context, ntf, _) {
                    final state = ntf.value;
                    if (state.letters.isEmpty) {
                      return const Center(child: Text('No letters'));
                    }
                    return Material(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          final letter = state.letters[index];
                          final own = letter.senderId == senderId;
                          return ListTile(
                            selectedColor: Colors.white,
                            tileColor: Colors.black,
                            selectedTileColor: Colors.blue[900],
                            selected: own,
                            title: Text(letter.content),
                            subtitle: Text('From: ${letter.senderId}'),
                            trailing: own
                                ? IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () {
                                      context
                                          .read<LettersNotifier>()
                                          .deletePressed(letter.id);
                                    },
                                  )
                                : null,
                          );
                        },
                        itemCount: state.letters.length,
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Expanded(
            child: DefaultTextStyle(
              style: TextStyle(color: Colors.white70),
              child: Consumer<ChatMemberNotifier>(
                builder: (context, ntf, _) {
                  final state = ntf.value;
                  switch (state) {
                    case InitialState():
                      return const Center(child: Text('Initial State'));
                    case SuccessState():
                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: state.memberIds.length,
                        itemBuilder: (context, index) {
                          if (state.memberIds.isEmpty) {
                            return const Center(child: Text('No members'));
                          }
                          final member = state.memberIds[index];
                          return ListTile(
                            title: Text(
                              'id:${member.unitId}, name: ${member.name},bot: ${member.isBot}',
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        },
                      );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const Color primaryColor = Color(
  0xFF1A237E,
); // A dark blue for the header/buttons
const Color secondaryColor = Color.fromARGB(
  255,
  0,
  138,
  67,
); // A dark brown for the main area background
const Color accentColor = Color.fromARGB(
  255,
  0,
  235,
  235,
); // A gold/yellow for outlines and text
const Color buttonColor = Color(0xFF2C3E50); // A deep blue/grey for buttons
const Color chatBackgroundColor = Color.fromARGB(
  255,
  135,
  21,
  1,
); // A dark brown for the chat box
