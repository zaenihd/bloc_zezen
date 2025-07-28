// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_bloc_zezen/quran/data/model/surat_detail_model.dart';
import 'package:flutter_bloc_zezen/quran/data/repository/surat_repository.dart';

part 'detail_surat_state.dart';

class DetailSuratCubit extends Cubit<DetailSuratState> {
  DetailSuratCubit(
    this.suratRepository,
  ) : super(DetailSuratInitial());

  final SuratRepository suratRepository;

  void getDetailSurat(int idSurat) async {
    emit(DetailSuratLoading());
    try {
      final response = await suratRepository.getDetailSurat(idSurat);
      emit(DetailSuratSuccess(dataSurat: response));
    } catch (e) {
      emit(DetailSuratError(message: e.toString()));
    }
  }
}
