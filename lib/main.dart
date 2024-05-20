import 'package:example_demo_t/generated/l10n.dart';
import 'package:example_demo_t/provider/PostComment_provider.dart';
import 'package:example_demo_t/provider/TodoAlbum_provider.dart';
import 'package:example_demo_t/provider/UserPhoto_provider.dart';
import 'package:example_demo_t/provider/counter_provider.dart';
import 'package:example_demo_t/provider/localiztion_provider.dart';
import 'package:example_demo_t/provider/provider.dart';
import 'package:example_demo_t/screen/anime_screen.dart';
import 'package:example_demo_t/screen/bottom_navigation_bar_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'core/utils/preference.dart';
import 'screen/multi_dropdown_screen.dart';
import 'screen/multiple_dropdown_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Preferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => TodoAlbumProvider()),
        ChangeNotifierProvider(create: (context) => PostCommentProvider()),
        ChangeNotifierProvider(create: (context) => UserPhotoProvider()),
        ChangeNotifierProvider(create: (context) => LocalizationProvider()),
      ],
      child: Consumer<LocalizationProvider>(
        builder: (context, localizationProvider, child) {
          return MaterialApp(
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            supportedLocales: S.delegate.supportedLocales,
            locale: localizationProvider.locale,
            debugShowCheckedModeBanner: false,
            // home: BottomNavigatorBar(),
            // home: multiDropDownScreen(),
            //   home: MultipleDropDownScreen(),
            home: AnimeScreen(),
          );
        },
      ),
    );
  }
}
