part of 'dogs_bloc.dart';

sealed class DogsEvent extends Equatable {
  const DogsEvent();
}

class LoadDogsInfo extends DogsEvent{
  @override
  List<Object?> get props => [];
}
