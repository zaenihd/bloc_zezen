part of 'surat_bloc.dart';

sealed class SuratEvent extends Equatable {
  const SuratEvent();

  @override
  List<Object> get props => [];
}

class GetSuratEvent extends SuratEvent {}
class Increment extends SuratEvent {}
class Decrement extends SuratEvent {}
