import 'package:flutter/material.dart';
import 'package:flutter_bloc_zezen/quran/page/surat/view/surat_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("My App"),),
      body: ListView(
        children: [
          ListTile(title: const Text("Al-Quran"),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const SuratView(),));
          },
          trailing: const Icon(Icons.arrow_forward_ios_outlined),)
        ],
      ),
    );
  }
}