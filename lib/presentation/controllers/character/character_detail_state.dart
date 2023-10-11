import 'package:equatable/equatable.dart';

abstract class CharacterState extends Equatable {
  const CharacterState();

  @override
  List<Object> get props => [];
}

class CharacterInitial extends CharacterState {}

class CharacterLoading extends CharacterState {}

class CharacterLoaded extends CharacterState {}

class CharacterFailure extends CharacterState {
  final String message;

  const CharacterFailure(this.message);
}
