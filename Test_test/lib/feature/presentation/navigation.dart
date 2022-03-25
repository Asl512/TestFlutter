import 'package:flutter/material.dart';
import 'package:test_test/feature/presentation/widgets/item_menu.dart';

import '../../common/icons.dart';
import 'pages/chat/chat_page.dart';
import 'pages/main/main_page.dart';
import 'pages/menu/menu_page.dart';
import 'pages/posts/posts_page.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _page = 1;

  static List<Widget> _pagesWidget = <Widget>[
    MainPage(),
    PostsPage(),
    ChatPage(),
    MenuPage(),
  ];

  static final List<List> _itemsMenu =[
    ["Main",iconMain],
    ["Posts",iconPost],
    ["Chat",iconChat],
    ["Menu",iconMenu]
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _pagesWidget.elementAt(_page),

      bottomNavigationBar: BottomNavigationBar(
        type:BottomNavigationBarType.fixed,
        elevation: 0.0,
        selectedFontSize: 0,
        items: _itemsMenu.map((itemMenu) =>
          ItemMenu(
              label: itemMenu.first,
              icon: itemMenu.last,
              index: [_itemsMenu.indexOf(itemMenu),_page]
          ).call()
        ).toList(),
        currentIndex: _page,
        onTap:(index)=> setState(()=>_page = index),
      ),

    );
  }
}
