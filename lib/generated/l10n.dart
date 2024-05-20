// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `HELLO`
  String get hello {
    return Intl.message(
      'HELLO',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `WELCOME TO MY APP`
  String get message {
    return Intl.message(
      'WELCOME TO MY APP',
      name: 'message',
      desc: '',
      args: [],
    );
  }

  /// `Choose a language`
  String get chooseLanguage {
    return Intl.message(
      'Choose a language',
      name: 'chooseLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get changeLanguage {
    return Intl.message(
      'Change Language',
      name: 'changeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Todo Screen`
  String get todoScreen {
    return Intl.message(
      'Todo Screen',
      name: 'todoScreen',
      desc: '',
      args: [],
    );
  }

  /// `Album Screen`
  String get albumScreen {
    return Intl.message(
      'Album Screen',
      name: 'albumScreen',
      desc: '',
      args: [],
    );
  }

  /// `Post Screen`
  String get postScreen {
    return Intl.message(
      'Post Screen',
      name: 'postScreen',
      desc: '',
      args: [],
    );
  }

  /// `Comment Screen`
  String get commentScreen {
    return Intl.message(
      'Comment Screen',
      name: 'commentScreen',
      desc: '',
      args: [],
    );
  }

  /// `User Screen`
  String get userScreen {
    return Intl.message(
      'User Screen',
      name: 'userScreen',
      desc: '',
      args: [],
    );
  }

  /// `Photo Screen`
  String get photoScreen {
    return Intl.message(
      'Photo Screen',
      name: 'photoScreen',
      desc: '',
      args: [],
    );
  }

  /// `Search...`
  String get search {
    return Intl.message(
      'Search...',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Data not found`
  String get dataNotFound {
    return Intl.message(
      'Data not found',
      name: 'dataNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Id:-`
  String get id {
    return Intl.message(
      'Id:-',
      name: 'id',
      desc: '',
      args: [],
    );
  }

  /// `Title:-`
  String get title {
    return Intl.message(
      'Title:-',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Completed:-`
  String get completed {
    return Intl.message(
      'Completed:-',
      name: 'completed',
      desc: '',
      args: [],
    );
  }

  /// `Name:-`
  String get name {
    return Intl.message(
      'Name:-',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Email:-`
  String get email {
    return Intl.message(
      'Email:-',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `User Id:-`
  String get userId {
    return Intl.message(
      'User Id:-',
      name: 'userId',
      desc: '',
      args: [],
    );
  }

  /// `User Name:-`
  String get userName {
    return Intl.message(
      'User Name:-',
      name: 'userName',
      desc: '',
      args: [],
    );
  }

  /// `Body:-`
  String get body {
    return Intl.message(
      'Body:-',
      name: 'body',
      desc: '',
      args: [],
    );
  }

  /// `Localization`
  String get localization {
    return Intl.message(
      'Localization',
      name: 'localization',
      desc: '',
      args: [],
    );
  }

  /// `TodoAlbum`
  String get todoAlbum {
    return Intl.message(
      'TodoAlbum',
      name: 'todoAlbum',
      desc: '',
      args: [],
    );
  }

  /// `PostComment`
  String get postComment {
    return Intl.message(
      'PostComment',
      name: 'postComment',
      desc: '',
      args: [],
    );
  }

  /// `UserPhoto`
  String get userPhoto {
    return Intl.message(
      'UserPhoto',
      name: 'userPhoto',
      desc: '',
      args: [],
    );
  }

  /// `Anime`
  String get anime {
    return Intl.message(
      'Anime',
      name: 'anime',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'hi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
