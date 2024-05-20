import 'package:example_demo_t/screen/anime_detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../generated/l10n.dart';
import '../provider/localiztion_provider.dart';
import '../provider/provider.dart';

class AnimeScreen extends StatefulWidget {
  const AnimeScreen({super.key});

  @override
  State<AnimeScreen> createState() => _AnimeScreenState();
}

class _AnimeScreenState extends State<AnimeScreen> {
  ScrollController scrollController = ScrollController();
  int _currentPage = 0;
  bool _isLoadingMore = false;

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<UserProvider>(context, listen: false)
        .getAnimeData(_currentPage);
    loadMoreData();
    scrollController.addListener(scroll);
  }

  void loadMoreData() {
    if (!_isLoadingMore) {
      setState(() {
        _isLoadingMore = true;
      });
      _currentPage++;
      Provider.of<UserProvider>(context, listen: false)
          .getAnimeData(_currentPage)
          .then((_) {
        setState(() {
          _isLoadingMore = false;
        });
      });
    }
  }

  void scroll() {
    ///pixel means k tme scroll karo eni position and aa maxscrollExtent etle aa jya sudhi hse tya sudhi avse.
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      loadMoreData();
    }
  }

  Future<void> refresh() async {
    await Provider.of<UserProvider>(context, listen: false)
        .getAnimeData(_currentPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Consumer2<UserProvider, LocalizationProvider>(
            builder: (context, userProvider, localizationProvider, child) {
              if (userProvider.loading && userProvider.animeList.isEmpty) {
                return const Center(
                  child: CupertinoActivityIndicator(
                    radius: 20,
                  ),
                );
              }
              return RefreshIndicator(
                onRefresh: () => refresh(),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: searchController,
                        onChanged: (value) {
                          userProvider.search(value);
                        },
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          // hintText: 'Search...',
                          hintText: S.of(context).search,
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          hintStyle: const TextStyle(color: Colors.grey),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Expanded(
                      child: userProvider.searchAnimeResult.isEmpty
                          ? Center(
                              // child: Text('No data found'),
                              child: Text(S.of(context).dataNotFound),
                            )
                          : GridView.builder(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              controller: scrollController,

                              ///(_isLoadingMore ? 1 : 0),(1 hoy etle new data avse and 0 hse etle je data pela j batavo hse aa avse.)
                              itemCount: userProvider.searchAnimeResult.length +
                                  (_isLoadingMore ? 1 : 0),
                              itemBuilder: (context, index) {
                                if (index <
                                    userProvider.searchAnimeResult.length) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    AnimeDetailScreen(
                                                        animeModel: userProvider
                                                            .animeList[index]),
                                              ));
                                          print(
                                              'animeList====${userProvider.animeList[index]}');
                                        },
                                        child: Container(
                                          height: 180,
                                          decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                  userProvider
                                                          .searchAnimeResult[
                                                              index]
                                                          .images?['jpg']
                                                          ?.imageUrl
                                                          .toString() ??
                                                      'https://tse4.mm.bing.net/th?id=OIP.8OiVkQhe8Kc4VBXoKf9IkAHaLG&pid=Api&P=0&h=180',
                                                ),
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            //  'Title:-',
                                            S.of(context).title,
                                            maxLines: 2,
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Flexible(
                                            child: Text(
                                              userProvider
                                                  .searchAnimeResult[index]
                                                  .title
                                                  .toString(),
                                              maxLines: 2,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                } else {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }
                              },
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 10,

                                      ///mainAxisExtent aa 1 container thi 2 container lagin ni space nu kam kare.
                                      mainAxisExtent: 250,
                                      mainAxisSpacing: 15),
                            ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
