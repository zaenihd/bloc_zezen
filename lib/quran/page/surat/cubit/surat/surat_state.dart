part of 'surat_cubit.dart';

sealed class SuratState extends Equatable {
  const SuratState();

  @override
  List<Object> get props => [];
}

final class SuratInitial extends SuratState {}

final class SuratLoading extends SuratState {}

final class SuratSuccess extends SuratState {
  final List<Surat> allSurat;

  const SuratSuccess({required this.allSurat});
  @override

  List<Object> get props => [allSurat];
}

final class SuratError extends SuratState {
  final String error;

  const SuratError({required this.error});

  @override

  List<Object> get props => [error];
}
