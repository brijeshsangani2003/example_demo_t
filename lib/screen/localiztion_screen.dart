import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/utils/preference.dart';
import '../generated/l10n.dart';
import '../provider/localiztion_provider.dart';

class localizationScreen extends StatefulWidget {
  const localizationScreen({super.key});

  @override
  State<localizationScreen> createState() => _localizationScreenState();
}

class _localizationScreenState extends State<localizationScreen> {
  final languages = [
    'English',
    'Hindi',
  ];
  final locales = [
    const Locale('en'),
    const Locale('hi'),
  ];

  @override
  void initState() {
    super.initState();

    ///આ કૉલબૅક ફંક્શન વર્તમાન ફ્રેમ પછી ચલાવવા માટે કૉલબૅક્સની કતારમાં ઉમેરવામાં આવે છે.
    /// એકવાર વર્તમાન ફ્રેમની બિલ્ડ પ્રક્રિયા પૂર્ણ થઈ જાય પછી, ફ્લટર એક્ઝિક્યુટ કરવા માટે નોંધાયેલ કૉલબેકને શેડ્યૂલ કરે છે.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initLocale();
    });
  }

  Future<void> initLocale() async {
    String? storedLocale = preferences.locale;
    if (storedLocale != null) {
      Provider.of<LocalizationProvider>(context, listen: false)
          .setLocale(Locale(storedLocale));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LocalizationProvider>(
      builder: (context, localizationProvider, child) {
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                S.of(context).hello,
                style: const TextStyle(fontSize: 17),
              ),
              const SizedBox(height: 15),
              Text(
                S.of(context).message,
                style: const TextStyle(fontSize: 17),
              ),
              const SizedBox(height: 15),
              Center(
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          // title: const Text('Choose a language'),
                          title: Text(S.of(context).chooseLanguage),
                          content: SizedBox(
                            width: double.maxFinite,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () async {
                                    localizationProvider
                                        .setLocale(locales[index]);
                                    // Save the selected language to shared preferences
                                    preferences.locale =
                                        locales[index].languageCode;
                                    //log('=====> country code : ${locales[index].languageCode}');
                                    Navigator.pop(context);
                                  },
                                  child: Column(
                                    children: [
                                      Text(
                                        languages[index],
                                        style: TextStyle(
                                          color: locales[index] ==
                                                  localizationProvider.locale
                                              ? Colors.blue
                                              : Colors.black,
                                          fontSize: 15,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                    ],
                                  ),
                                );
                              },
                              itemCount: languages.length,
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        // 'Change Language',
                        S.of(context).changeLanguage,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
