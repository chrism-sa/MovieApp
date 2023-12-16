import 'package:flutter/material.dart';

class AboutMePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Me"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: const CircleAvatar(
                radius: 75,
                foregroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwo9-MlxhkfQWsBBiNMhik6sPbj_OZkoluEW1xWlIWTcsF7I0XU6F2JVHi8qLb3-b99FM&usqp=CAU'),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Admin",
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(height: 10),
            Text(
              "admin@gmail.com",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(height: 30),
            Text(
              "Hi, I'm the administrator of this awesome app. "
              "Feel free to explore and enjoy your time here!",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
              },
              child: const Text("0813-3333-4444"),
            ),
          ],
        ),
      ),
    );
  }
}
