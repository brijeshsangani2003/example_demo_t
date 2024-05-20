import 'package:example_demo_t/screen/Post_Comment_screen.dart';
import 'package:example_demo_t/screen/Todo_Album_screen.dart';
import 'package:example_demo_t/screen/User_Photo_screen.dart';
import 'package:flutter/material.dart';

import '../generated/l10n.dart';
import 'anime_screen.dart';
import 'localiztion_screen.dart';

class BottomNavigatorBar extends StatefulWidget {
  const BottomNavigatorBar({super.key});

  @override
  State<BottomNavigatorBar> createState() => _BottomNavigatorBarState();
}

class _BottomNavigatorBarState extends State<BottomNavigatorBar> {
  int pageSelected = 0;

  List screens = [
    const localizationScreen(),
    TodoAlbumScreen(),
    PostCommentScreen(),
    UserPhotoScreen(),
    const AnimeScreen(),
  ];

  List bottomIcon = [
    {'icons': Icons.language_outlined},
    {'icons': Icons.grid_view_sharp},
    {'icons': Icons.list},
    {'icons': Icons.person},
    {'icons': Icons.animation},
  ];

  late List<Map<String, dynamic>> _bottomName;

  void _initBottomNames() {
    _bottomName = [
      {'title': S.of(context).localization},
      {'title': S.of(context).todoAlbum},
      {'title': S.of(context).postComment},
      {'title': S.of(context).userPhoto},
      {'title': S.of(context).anime},
    ];
  }

  @override
  Widget build(BuildContext context) {
    _initBottomNames();
    return Scaffold(
      body: screens[pageSelected],
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              screens.length,
              (index) => InkWell(
                onTap: () {
                  setState(() {
                    pageSelected = index;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      bottomIcon[index]['icons'],
                      size: 24,
                      color:
                          pageSelected == index ? Colors.orange : Colors.grey,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      _bottomName[index]['title'],
                      style: TextStyle(
                        fontSize: 12,
                        color:
                            pageSelected == index ? Colors.orange : Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
