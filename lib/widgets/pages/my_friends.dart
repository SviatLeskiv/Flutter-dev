// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:v_temi/consts.dart';

class Friend {
  final String imageName;
  final String friendName;
  final String commonFriend;

  Friend(
      {required this.imageName,
      required this.friendName,
      required this.commonFriend});
}

class MyFriendsWidget extends StatefulWidget {
  MyFriendsWidget({Key? key}) : super(key: key);

  @override
  State<MyFriendsWidget> createState() => _MyFriendsWidgetState();
}

class _MyFriendsWidgetState extends State<MyFriendsWidget> {
  final _friends = [
    Friend(
        imageName: MyImages.avatar,
        friendName: 'Ivan',
        commonFriend: '15 common friends'),
    Friend(
        imageName: MyImages.avatar,
        friendName: 'Sergiy',
        commonFriend: '15 common friends'),
    Friend(
        imageName: MyImages.avatar,
        friendName: 'Sviatoslav',
        commonFriend: '15 common friends'),
    Friend(
        imageName: MyImages.avatar,
        friendName: 'Igor',
        commonFriend: '15 common friends'),
    Friend(
        imageName: MyImages.avatar,
        friendName: 'Vasyl',
        commonFriend: '15 common friends'),
    Friend(
        imageName: MyImages.avatar,
        friendName: 'Stepan',
        commonFriend: '15 common friends'),
    Friend(
        imageName: MyImages.avatar,
        friendName: 'Oleg',
        commonFriend: '15 common friends'),
    Friend(
        imageName: MyImages.avatar,
        friendName: 'Volodymyr',
        commonFriend: '15 common friends'),
    Friend(
        imageName: MyImages.avatar,
        friendName: 'Mykola',
        commonFriend: '15 common friends'),
    Friend(
        imageName: MyImages.avatar,
        friendName: 'Andriy',
        commonFriend: '15 common friends'),
    Friend(
        imageName: MyImages.avatar,
        friendName: 'Roman',
        commonFriend: '15 common friends')
  ];

  var _filteredFriends = <Friend>[];

  final _searchController = TextEditingController();

  void _searchFriends() {
    final query = _searchController.text;
    if (query.isEmpty) {
      _filteredFriends = _friends;
    } else {
      _filteredFriends = _friends.where((Friend friend) {
        return friend.friendName.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _filteredFriends = _friends;
    _searchController.addListener(_searchFriends);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ListView.builder(
          padding: EdgeInsets.only(top: 100),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemCount: _filteredFriends.length,
          itemExtent: 80,
          itemBuilder: (BuildContext context, int index) {
            final friend = _filteredFriends[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: InkWell(
                splashColor: Colors.orangeAccent[100],
                borderRadius: BorderRadius.all(Radius.circular(30)),
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.orange),
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.orange.withOpacity(0.05),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ]),
                  clipBehavior: Clip.hardEdge,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(friend.imageName),
                      ),
                      Padding(padding: EdgeInsets.only(right: 7)),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              friend.friendName,
                              style: MyFonts.onBlack,
                              maxLines: 1,
                            ),
                            SizedBox(height: 5),
                            Text(
                              friend.commonFriend,
                              style: TextStyle(
                                  fontSize: 13, color: Colors.orange[300]),
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.message, color: Colors.orange)
                    ],
                  ),
                ),
              ),
            );
          }),
      Padding(
        padding: EdgeInsets.only(top: 50),
        child: TextField(
          cursorColor: Colors.orange,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.black.withAlpha(235),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.orange)),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.orange)),
            hintStyle: TextStyle(color: Colors.orange[700]),
            hintText: 'Пошук',
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          ),
          style: MyFonts.onBlack,
          controller: _searchController,
        ),
      ),
    ]);
  }
}
