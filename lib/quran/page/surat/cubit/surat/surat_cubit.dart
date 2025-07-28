// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_bloc_zezen/quran/data/model/surat_model.dart';
import 'package:flutter_bloc_zezen/quran/data/repository/surat_repository.dart';

part 'surat_state.dart';

class SuratCubit extends Cubit<SuratState> {
  SuratCubit(
    this.suratRepository,
  ) : super(SuratInitial());

  final SuratRepository suratRepository;

  void getAllSurat() async {
    emit(SuratLoading());
    try {
      List<Surat> result = await suratRepository.getAllSurat();
      emit(SuratSuccess(allSurat: result));
    } catch (e) {
      emit(SuratError(error: e.toString()));
    }
  }
}
