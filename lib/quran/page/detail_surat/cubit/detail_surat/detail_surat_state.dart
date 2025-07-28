part of 'detail_surat_cubit.dart';

sealed class DetailSuratState extends Equatable {
  const DetailSuratState();

  @override
  List<Object> get props => [];
}

final class DetailSuratInitial extends DetailSuratState {}
final class DetailSuratLoading extends DetailSuratState {}
final class DetailSuratSuccess extends DetailSuratState {
  final DataSurat dataSurat;

  const DetailSuratSuccess({required this.dataSurat});

  @override

  List<Object> get props => [dataSurat];
}
final class DetailSuratError extends DetailSuratState {
  final String message;

  const DetailSuratError({required this.message});

  @override

  List<Object> get props => [message];
}
