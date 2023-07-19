import 'package:flutter/material.dart';

class PortraitScreen extends StatelessWidget {
  const PortraitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage(
                "https://scontent.fdac147-1.fna.fbcdn.net/v/t39.30808-6/307344552_1528904620878058_2222338820037627893_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=174925&_nc_ohc=Tn8t1XwdHG4AX_pgTLN&_nc_ht=scontent.fdac147-1.fna&oh=00_AfDF9Zgltv_oZG0KH-RWpvfYi3TPwtNud2E2XUhXWcF45Q&oe=64B84BCE"),
            radius: 100,
          ),
          const SizedBox(height: 10),
          const Text(
            "Mostafejur Rahman",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
          ),
          const SizedBox(height: 10),
          const Text(
              "As a beginner cross platform application developer, I am passionate about using my skills in Flutter and Android Studio to build intuitive and useful mobile applications. I am constantly learning and seeking new challenges to improve my abilities and expand my knowledge of the field. I am excited to work with a team and contribute to the development and success of innovative projects."),
          const SizedBox(
            height: 10,
          ),
          GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: 6,
              itemBuilder: (context, int index) {
                return Image.network(
                    "https://scontent.fdac147-1.fna.fbcdn.net/v/t39.30808-6/307344552_1528904620878058_2222338820037627893_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=174925&_nc_ohc=Tn8t1XwdHG4AX_pgTLN&_nc_ht=scontent.fdac147-1.fna&oh=00_AfDF9Zgltv_oZG0KH-RWpvfYi3TPwtNud2E2XUhXWcF45Q&oe=64B84BCE");
              })
        ],
      ),
    );
  }
}
