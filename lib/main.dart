import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_zezen/home.dart';
import 'package:flutter_bloc_zezen/quran/page/detail_surat/cubit/detail_surat/detail_surat_cubit.dart';
import 'package:flutter_bloc_zezen/quran/page/surat/cubit/surat/surat_cubit.dart';
import 'package:flutter_bloc_zezen/quran/data/repository/surat_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SuratCubit(SuratRepository()),
        ),
        BlocProvider(
          create: (context) => DetailSuratCubit(SuratRepository()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
