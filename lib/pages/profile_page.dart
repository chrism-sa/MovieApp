import 'package:flutter/material.dart';
import 'package:movieapp/pages/aboutme_page.dart';
import 'package:movieapp/pages/first_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 15),
            child: CircleAvatar(
              radius: 62,
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: const CircleAvatar(
                radius: 60,
                foregroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwo9-MlxhkfQWsBBiNMhik6sPbj_OZkoluEW1xWlIWTcsF7I0XU6F2JVHi8qLb3-b99FM&usqp=CAU'),
              ),
            ),
          ),
          Center(
            child: Text(
              "Admin",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Center(
            child: Text(
              "admin@gmail.com",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          const SizedBox(height: 25),
          ListTile(
            title: const Text("About Me"),
            leading: const Icon(Icons.info),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AboutMePage(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text("Logout"),
            leading: const Icon(Icons.logout_outlined),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => firstPage(),
                ),);
            },
          ),
        ],
      ),
    );
  }
}
