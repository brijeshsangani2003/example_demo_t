import 'package:example_demo_t/provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AlbumsScreen extends StatefulWidget {
  const AlbumsScreen({super.key});

  @override
  State<AlbumsScreen> createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends State<AlbumsScreen> {
  @override
  void initState() {
    albumsData();
    super.initState();
  }

  void albumsData() async {
    final albumsProvider = Provider.of<UserProvider>(context, listen: false);
    await albumsProvider.getAlbumsData();
    print('albumsList ========> ${albumsProvider.albumsList}');
  }

  @override
  Widget build(BuildContext context) {
    final albumsProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Consumer<UserProvider>(
              builder: (context, value, child) {
                if (value.loading) {
                  return const Center(
                    child: CupertinoActivityIndicator(
                        color: Colors.black, radius: 20),
                  );
                }
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title:
                          Text(albumsProvider.albumsList[index].id.toString()),
                      subtitle: Text(
                          albumsProvider.albumsList[index].title.toString()),
                    );
                  },
                  itemCount: albumsProvider.albumsList.length,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
