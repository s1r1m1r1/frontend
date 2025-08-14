// Assuming you have a theme with these colors
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/menu/logic/chat_member.bloc.dart';

import '../../../inject/get_it.dart';
import '../../auth/logic/with_token/ws_with_token.bloc.dart';

const Color primaryColor = Color(0xFF1A237E); // A dark blue for the header/buttons
const Color secondaryColor = Color.fromARGB(255, 0, 138, 67); // A dark brown for the main area background
const Color accentColor = Color.fromARGB(255, 0, 235, 235); // A gold/yellow for outlines and text
const Color buttonColor = Color(0xFF2C3E50); // A deep blue/grey for buttons
const Color chatBackgroundColor = Color.fromARGB(255, 135, 21, 1); // A dark brown for the chat box

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('MENU PAGE BUILD');
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (_) {
            final bloc = getIt<ChatMemberBloc>();
            bloc.add(const ChatMemberEvent.started());
            return bloc;
          },
        ),
        BlocProvider(create: (_) => getIt<WsWithTokenBloc>()..add(SubscribeEvent())),
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
                  Container(width: 30, height: 30, color: accentColor),
                  const Spacer(),
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
                    color: Colors.blueGrey[900], // Simulating the wooden background
                    border: Border.all(color: accentColor, width: 2),
                  ),
                  child: Center(
                    // Placeholder for the main game UI content
                    child: Column(
                      children: [
                        Text('Game UI Content', style: TextStyle(color: accentColor)),
                        BlocBuilder<WsWithTokenBloc, WithTokenState>(
                          builder: (context, state) {
                            return Text(state.status.toString());
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
                  _buildMiddleButton('В БОЙ', Colors.green),
                  _buildMiddleButton('ТОРГОВЛЯ', const Color.fromARGB(255, 95, 0, 52)),
                  _buildMiddleButton('БАНК', Colors.blue),
                  _buildMiddleButton('НАСТРОЙКИ', Colors.grey),
                ],
              ),
            ),
            // Bottom Chat Box
            Container(
              color: chatBackgroundColor,
              height: 200,
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
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'Enter message...',
                            hintStyle: const TextStyle(color: Colors.white54),
                            filled: true,
                            fillColor: Colors.black,
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Color.fromARGB(255, 235, 0, 24)),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Color.fromARGB(255, 235, 0, 24)),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          context.read<ChatMemberBloc>().add(ChatMemberEvent.membersUpdated([]));
                          context.read<ChatMemberBloc>().add(ChatMemberEvent.started());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          foregroundColor: accentColor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                        ),
                        child: const Text('Send'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
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

  Widget _buildMiddleButton(String text, Color color) {
    return ElevatedButton(
      onPressed: () {},
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
            child: Center(
              child: Text('Chat History', style: TextStyle(color: Colors.white70)),
            ),
          ),
          Expanded(
            child: DefaultTextStyle(
              style: TextStyle(color: Colors.white70),
              child: BlocBuilder<ChatMemberBloc, ChatMemberState>(
                builder: (context, state) {
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
                          return ListTile(title: Text('id:${member.unitId} , name: ${member.name}'));
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
