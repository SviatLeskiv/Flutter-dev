import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v_temi/bloc/avatar_bloc.dart';
import 'package:v_temi/consts.dart';

import 'my_friends.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  int _selectedBar = 1;

  void _onSelectedBar(int index) {
    if (_selectedBar == index) return;
    setState(() {
      _selectedBar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: IndexedStack(
        index: _selectedBar,
        children: [
          const MyMassageWidget(),
          BlocProvider(
            create: (_) => AvatarBloc(),
            child: const MyPageWidget(),
          ),
          const MyFriendsWidget(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedBar,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.orange,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Повідомлення',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo),
            label: 'Моя сторінка',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Друзі',
          )
        ],
        onTap: _onSelectedBar,
      ),
    );
  }
}

class MyPageWidget extends StatelessWidget {
  const MyPageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh_outlined),
        backgroundColor: Colors.orange,
        onPressed: () => context.read<AvatarBloc>().add(ChangeAvatar()),
      ),
      body: BlocBuilder<AvatarBloc, AvatarState>(
        builder: (context, state) {
          if (state is AvatarInitial) {
            return const Center(
              child: Text(
                'Initial state',
                style: MyFonts.onBlack,
              ),
            );
          }
          if (state is AvatarLoaded) {
            return AvatarWidget(
              avatar: state.url,
            );
          }
          return const Text('Error');
        },
      ),
    );
  }
}

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    Key? key,
    required this.avatar,
  }) : super(key: key);

  final String avatar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SizedBox(
          width: double.infinity,
          child: Image.asset(avatar),
        ),
      ),
    );
  }
}

class MyMassageWidget extends StatelessWidget {
  const MyMassageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Повідомлення',
        style: MyFonts.onBlack,
      ),
    );
  }
}
