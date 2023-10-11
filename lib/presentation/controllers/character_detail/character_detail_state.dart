import 'package:equatable/equatable.dart';

abstract class CharacterDetailsState extends Equatable {
  const CharacterDetailsState();

  @override
  List<Object> get props => [];
}

class CharacterDetailsInitial extends CharacterDetailsState {}

class CharacterDetailsLoading extends CharacterDetailsState {}

class CharacterDetailsLoaded extends CharacterDetailsState {}

class CharacterDetailsFailure extends CharacterDetailsState {
  final String message;

  const CharacterDetailsFailure(this.message);
}
