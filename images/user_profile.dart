// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, camel_case_types

import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  List<MenuRowData> firstMenuRow = [
    MenuRowData(Icons.save, 'Збережене'),
    MenuRowData(Icons.call, 'Недавні виклики'),
    MenuRowData(Icons.computer, 'Пристрої'),
    MenuRowData(Icons.folder_open, 'Теки для читачів'),
  ];
  List<MenuRowData> secondMenuRow = [
    MenuRowData(Icons.notifications, 'Сповіщення та звука'),
    MenuRowData(Icons.privacy_tip, 'Приватність та безпека'),
    MenuRowData(Icons.date_range, 'Дані та сховище'),
    MenuRowData(Icons.looks, 'Вигляд'),
    MenuRowData(Icons.language, 'Мова'),
    MenuRowData(Icons.emoji_emotions, 'Наліпка та емоджі'),
  ];
  List<MenuRowData> thirdMenuRow = [
    MenuRowData(Icons.question_answer, 'Поставити запитання'),
    MenuRowData(Icons.question_answer_sharp, 'ЧаПи Telegram'),
    MenuRowData(Icons.light, 'Можливості Telegram'),
  ];
  UserProfile();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black,
          width: double.infinity,
          child: Column(
            children: [
              _userInfo(),
              _menuBlock(menuRow: firstMenuRow),
              _menuBlock(menuRow: secondMenuRow),
              _menuBlock(menuRow: thirdMenuRow),
            ],
          ),
        ),
      ),
    );
  }
}

class _menuBlock extends StatelessWidget {
  final List<MenuRowData> menuRow;
  const _menuBlock({Key? key, required this.menuRow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
          color: Colors.grey[900],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.0),
          )),
      margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
      width: double.infinity,
      child: Column(
        children: menuRow.map((data) => _menuBlockRow(data: data)).toList(),
      ),
    );
  }
}

class MenuRowData {
  final IconData icon;
  final String text;

  MenuRowData(this.icon, this.text);
}

class _menuBlockRow extends StatelessWidget {
  final MenuRowData data;

  const _menuBlockRow({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Icon(data.icon),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              data.text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
          Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}

class _userInfo extends StatelessWidget {
  const _userInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: Colors.black,
      child: Column(
        children: [
          SizedBox(height: 30),
          _avatar(),
          SizedBox(height: 15),
          _userName(),
          _phoneNumber(),
        ],
      ),
    );
  }
}

class _phoneNumber extends StatelessWidget {
  const _phoneNumber({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '+380 98 955 0472 • @JLpaBwa',
      style: TextStyle(
        fontSize: 16,
        color: Colors.grey[700],
      ),
    );
  }
}

class _userName extends StatelessWidget {
  const _userName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Sviatoslav Leskiv',
      style: TextStyle(
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _avatar extends StatelessWidget {
  const _avatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
      ),
      width: 100, 
      height: 100, 
      child: Image.network('https://i.ibb.co/9hZZSyG/Test.jpg'));
  }
}
