import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_zezen/quran/data/model/surat_model.dart';
import 'package:flutter_bloc_zezen/quran/page/detail_surat/view/detail_surat.dart';
import 'package:flutter_bloc_zezen/quran/page/surat/bloc/surat/surat_bloc.dart';

class SuratView extends StatefulWidget {
  const SuratView({super.key});

  @override
  State<SuratView> createState() => _SuratViewState();
}

class _SuratViewState extends State<SuratView> {
  @override
  void initState() {
    // context.read<SuratCubit>().getAllSurat();
    context.read<SuratBloc>().add(GetSuratEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              heroTag: null,
              child: const Icon(Icons.remove),
              onPressed: () {
                context.read<SuratBloc>().add(Decrement());
              },
            ),
            const SizedBox(
              width: 20.0,
            ),
            FloatingActionButton(
              heroTag: null,
              child: const Icon(Icons.add),
              onPressed: () {
                context.read<SuratBloc>().add(Increment());
              },
            ),
          ],
        ),
        appBar: AppBar(
          title: const Text('Surat'),
        ),
        body: BlocBuilder<SuratBloc, SuratState>(
          builder: (context, state) {
            if (state.isLoading == true) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state.allSurat != null) {
              return Column(
                children: [
                  Text("${state.increment ?? 0}"),
                  SizedBox(
                      height: MediaQuery.sizeOf(context).height / 1.4,
                      child: _listSurat(state)),
                ],
              );
            }
            if (state.error != null) {
              return Center(child: Text(state.error!));
            }
            return const Center(
              child: Text('No data'),
            );
          },
        ));
  }

  ListView _listSurat(SuratState state) {
    return ListView.builder(
      itemCount: state.allSurat!.length,
      itemBuilder: (context, index) {
        final surat = state.allSurat![index];
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
