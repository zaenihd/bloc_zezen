// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'surat_bloc.dart';

class SuratState extends Equatable {
  final List<Surat>? allSurat;
  final int increment;
  final bool isLoading;
  final String? error;

  const SuratState(
      {this.allSurat, this.increment = 0, this.isLoading = false, this.error});

  @override
  // TODO: implement props
  List<Object?> get props => [allSurat, increment, isLoading];

  SuratState copyWith({
    List<Surat>? allSurat,
    int? increment,
    bool? isLoading,
    String? error,
  }) {
    return SuratState(
      allSurat: allSurat ?? this.allSurat,
      increment: increment ?? this.increment,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
