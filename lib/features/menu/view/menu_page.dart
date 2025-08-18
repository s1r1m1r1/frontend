// Assuming you have a theme with these colors
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/menu/logic/letters.bloc.dart';
import 'package:frontend/features/menu/logic/chat_member.bloc.dart';
import 'package:frontend/features/menu/logic/ws_connection_cubit.dart';

import '../../../inject/get_it.dart';

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

        BlocProvider(
          lazy: false,
          create: (_) => getIt<LettersBloc>()..add(LettersEvent.started()),
        ),
        BlocProvider(
          lazy: false,
          create: (_) => getIt<WsConnectionCubit>()..listenConnection(),
        ),
      ],
      child: BlocListener<WsConnectionCubit, WsConnectionStatus>(
        listener: (context, status) {
          switch (status) {
            case WsConnectionStatus.init:
            case WsConnectionStatus.connecting:
            case WsConnectionStatus.reconnecting:
              break;
            case WsConnectionStatus.reconnected:
            case WsConnectionStatus.connected:
              break;
            case WsConnectionStatus.disconnecting:
            case WsConnectionStatus.disconnected:
              break;
          }
        },
        child: const MenuView(),
      ),
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
                  BlocBuilder<ChatMemberBloc, ChatMemberState>(
                    builder: (context, state) {
                      switch (state) {
                        case InitialState():
                          return Text('-0-');
                        case SuccessState():
                          return Text('${state.memberIds.length}');
                      }
                    },
                  ),
                  const Spacer(),
                  BlocBuilder<WsConnectionCubit, WsConnectionStatus>(
                    builder: (context, state) {
                      return Text(
                        state.name.toString(),
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
                  _buildMiddleButton(
                    'ТОРГОВЛЯ',
                    const Color.fromARGB(255, 95, 0, 52),
                  ),
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
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          context.read<LettersBloc>().add(
                            LettersEvent.newPressed(
                              'New Letter ${context.read<LettersBloc>().state.letters.length + 1}',
                            ),
                          );
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
            child: BlocBuilder<LettersBloc, LettersState>(
              builder: (context, state) {
                if (state.letters.isEmpty) {
                  return const Center(child: Text('No letters'));
                }
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final letter = state.letters[index];
                    return ListTile(
                      // selected: letter.senderId == ,
                      title: Text(letter.content),
                      subtitle: Text('From: ${letter.senderId}'),
                      trailing: (letter.id != null)
                          ? IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => context.read<LettersBloc>().add(
                                LettersEvent.deletePressed(letter.id!),
                              ),
                            )
                          : null,
                    );
                  },
                  itemCount: state.letters.length,
                );
              },
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
                          return ListTile(
                            title: Text(
                              'id:${member.unitId} , name: ${member.name}',
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
