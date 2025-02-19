import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dogs_we_love/data/repositories/dogsRepository.dart';
import 'package:dogs_we_love/model/dog.dart';
import 'package:equatable/equatable.dart';

part 'dogs_event.dart';

part 'dogs_state.dart';

class DogsBloc extends Bloc<DogsEvent, DogsState> {
  final DogsRepository dogsRepository;

  DogsBloc({required this.dogsRepository})
    : super(const DogsState()) {
    on<LoadDogsInfo>(_onLoadDogsInfo);
  }

  Future<void> _onLoadDogsInfo(
    LoadDogsInfo event,
    Emitter<DogsState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));

    try {
      var dogsList = await dogsRepository.loadDogsInfo();
        emit(state.copyWith(status: Status.success, dogs: dogsList));
    } catch (e) {
      emit(state.copyWith(status: Status.failure, message: "Error: $e"));
    }
  }
}
