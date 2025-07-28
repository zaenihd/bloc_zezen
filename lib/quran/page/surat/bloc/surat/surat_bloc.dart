import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_zezen/quran/data/model/surat_model.dart';
import 'package:flutter_bloc_zezen/quran/data/repository/surat_repository.dart';

part 'surat_event.dart';
part 'surat_state.dart';

class SuratBloc extends Bloc<SuratEvent, SuratState> {
  final suratRepo = SuratRepository();
  SuratBloc() : super(const SuratState()) {
    on<SuratEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<GetSuratEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      try {
        List<Surat> result = await suratRepo.getAllSurat();
        emit(state.copyWith(allSurat: result));
        emit(state.copyWith(isLoading: false));
      } catch (e) {}
      emit(state.copyWith(isLoading: false));
      // TODO: implement event handler
    });
    on<Increment>((event, emit) {
      emit(state.copyWith(increment: state.increment + 1));
    });
    on<Decrement>((event, emit) {
      emit(state.copyWith(increment: state.increment - 1));
    });
  }
}
