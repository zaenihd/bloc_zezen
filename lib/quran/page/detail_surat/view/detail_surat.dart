import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_zezen/quran/page/detail_surat/cubit/detail_surat/detail_surat_cubit.dart';

class DetailSuratView extends StatefulWidget {
  DetailSuratView({super.key, required this.title, required this.idSurat});

  String title;
  int idSurat;

  @override
  State<DetailSuratView> createState() => _DetailSuratViewState();
}

class _DetailSuratViewState extends State<DetailSuratView> {
  @override
  void initState() {
    context.read<DetailSuratCubit>().getDetailSurat(widget.idSurat);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<DetailSuratCubit, DetailSuratState>(
        builder: (context, state) {
          if (state is DetailSuratLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is DetailSuratSuccess) {
            return ListView.builder(
              itemCount: state.dataSurat.ayat.length,
              itemBuilder: (context, index) {
                final ayat = state.dataSurat.ayat[index];
                return ListTile(
                  leading: CircleAvatar(child: Text("${ayat.nomorAyat}"),),
                  title: Text(ayat.teksArab),
                  subtitle: Text(ayat.teksIndonesia),
                );
              },
            );
          }
          if (state is DetailSuratError) {
            return Center(
              child: Text(state.message),
            );
          }
          return const Center(
            child: Text("No Data"),
          );
        },
      ),
    );
  }
}
