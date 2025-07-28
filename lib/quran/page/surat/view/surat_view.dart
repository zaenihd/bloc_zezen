import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_zezen/quran/page/detail_surat/view/detail_surat.dart';
import 'package:flutter_bloc_zezen/quran/page/surat/cubit/surat/surat_cubit.dart';

class SuratView extends StatefulWidget {
  const SuratView({super.key});

  @override
  State<SuratView> createState() => _SuratViewState();
}

class _SuratViewState extends State<SuratView> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<SuratCubit>().getAllSurat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Surat'),
        ),
        body: BlocBuilder<SuratCubit, SuratState>(
          builder: (context, state) {
            if (state is SuratLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is SuratSuccess) {
              return _listSurat(state);
            }
            if (state is SuratError) {
              return Center(child: Text(state.error));
            }
            return const Center(
              child: Text('No data'),
            );
          },
        ));
  }

  ListView _listSurat(SuratSuccess state) {
    return ListView.builder(
      itemCount: state.allSurat.length,
      itemBuilder: (context, index) {
        final surat = state.allSurat[index];
        return ListTile(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailSuratView(
                  title: surat.namaLatin,
                  idSurat: surat.nomor,
                ),
              )),
          title: Text(surat.namaLatin),
          leading: CircleAvatar(
            child: Text("${surat.nomor}"),
          ),
          subtitle: Text("${surat.jumlahAyat} ayat"),
        );
      },
    );
  }
}
