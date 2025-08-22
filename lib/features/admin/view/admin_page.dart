import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/app/router/user_routes.dart';
import 'package:frontend/features/admin/logic/admin.cubit.dart';
import 'package:frontend/features/auth/domain/session.dart';
import 'package:frontend/features/auth/domain/ws_game_option.dart';
import 'package:frontend/features/menu/logic/ws_connection_cubit.dart';
import 'package:frontend/features/menu/logic/ws_join_cubit.dart';

import '../../../inject/get_it.dart';
import 'admin_menu_view.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<AdminCubit>()),
        BlocProvider(create: (_) => getIt<WsJoinCubit>()..subscribe()),
        BlocProvider(
          create: (_) => getIt<WsConnectionCubit>()..listenConnection(),
        ),
      ],
      child: _AdminView(),
    );
  }
}

class _AdminView extends StatelessWidget {
  const _AdminView();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: true),
      body: BlocBuilder<AdminCubit, AdminState>(
        builder: (context, state) {
          return Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    color: Colors.blueGrey[900],
                    height: 100,
                    child: state.fakes.isEmpty
                        ? Center(child: Text('no fakes'))
                        : ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.fakes.length,
                            padding: EdgeInsets.symmetric(horizontal: 64),
                            itemBuilder: (context, index) {
                              final fake = state.fakes[index];
                              return GestureDetector(
                                onTap: () {
                                  context.read<AdminCubit>().selectFake(fake);
                                },
                                child: Card(
                                  borderOnForeground: true,
                                  shape: RoundedRectangleBorder(
                                    side:
                                        state.selectedFakeUser?.user.id ==
                                            fake.user.id
                                        ? BorderSide(color: Colors.white)
                                        : BorderSide.none,
                                    borderRadius: BorderRadiusGeometry.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          '${fake.email},\nid; ${fake.user.id}',
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                  Center(
                    child: SizedBox(
                      width: 500,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 32),
                          TextButton(
                            onPressed: () {
                              context.read<AdminCubit>().loadFakes();
                            },
                            child: Text('Load fakes'),
                          ),
                          SizedBox(height: 32),

                          BlocBuilder<WsJoinCubit, WsJoinState>(
                            builder: (context, state) {
                              return Text('${state}');
                            },
                          ),
                          BlocBuilder<WsConnectionCubit, WsConnectionStatus>(
                            builder: (context, state) {
                              return Text('${state}');
                            },
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '${state.adminSession.runtimeType}',
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  context.read<AdminCubit>().login();
                                },
                                child: Text('login'),
                              ),
                            ],
                          ),
                          switch (state.adminSession) {
                            null => Text(''),
                            PendingSession() => Text('pending'),
                            WelcomeSession() => TextButton(
                              child: Text('welcome'),
                              onPressed: () {
                                UnitRoute().go(context);
                              },
                            ),
                            GameReadySession() => TextButton(
                              onPressed: () {
                                context.read<WsJoinCubit>().wsJoin();
                              },
                              child: Text('game ready'),
                            ),
                            GameJoinedSession() => TextButton(
                              child: Text('game joined'),
                              onPressed: () {},
                            ),
                            GameFinishedSession() => TextButton(
                              onPressed: () {},
                              child: Text('game finished'),
                            ),
                          },
                          SizedBox(height: 24),
                          _MakeFakeContainer(),
                        ],
                      ),
                    ),
                  ),
                  if (state.adminSession case ISessionWS(
                    gameOption: WsGameOption(:final mainRoomId),
                  ))
                    SizedBox(
                      height: 450,
                      child: AdminMenuView(roomId: mainRoomId),
                    )
                  else
                    Text('no room id'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _MakeFakeContainer extends StatefulWidget {
  const _MakeFakeContainer();

  @override
  State<_MakeFakeContainer> createState() => _MakeFakeContainerState();
}

class _MakeFakeContainerState extends State<_MakeFakeContainer> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(controller: _emailController),
        TextField(controller: _passwordController),
        TextButton(
          onPressed: () async {
            await context.read<AdminCubit>().addFake(
              email: _emailController.text,
              password: _passwordController.text,
            );
          },
          child: Text('add fake'),
        ),
        SizedBox(height: 24),
        TextButton(
          onPressed: () {
            _emailController.clear();
            _passwordController.clear();
          },
          child: Text('clear'),
        ),
      ],
    );
  }
}
