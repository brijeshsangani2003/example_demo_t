import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  void initState() {
    getUserData();
    super.initState();
  }

  void getUserData() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    await userProvider.getUserData();
    print('userList ========> ${userProvider.userList}');
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                        leading:
                            Text(userProvider.userList[index].name.toString()),
                        trailing: Text(userProvider
                            .userList[index].address!.zipcode
                            .toString()),
                      );
                    },
                    itemCount: userProvider.userList.length,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
