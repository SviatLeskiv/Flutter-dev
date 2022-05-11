import 'package:flutter/material.dart';
import 'package:v_temi/consts.dart';
import 'package:v_temi/widgets/pages/my_friends.dart';

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
          MyMassageWidget(),
          MyPageWidget(),
          MyFriendsWidget(),
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

class MyMassageWidget extends StatelessWidget {
  const MyMassageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Повідомлення',
      style: MyFonts.onBlack,
    );
  }
}

class MyPageWidget extends StatelessWidget {
  const MyPageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(50),
        child: AvatarWidget()),
    );
  }
}

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ClipOval(
          child: Image(image: AssetImage(MyImages.avatar)),
        ),
        Padding(
          padding:  EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Text(
                'Sviatoslav Leskiv',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '+380989550472',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.orange,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
