part of 'dogs_bloc.dart';

enum Status { initial, loading, success, failure }

final class DogsState extends Equatable {
  const DogsState({
    this.message = "",
    this.status = Status.initial,
    this.dogs = const [],
  });

  final Status status;
  final List<Dog> dogs;
  final String message;

  DogsState copyWith({Status? status, List<Dog>? dogs, String? message}) {
    return DogsState(
      status: status ?? this.status,
      dogs: dogs ?? this.dogs,
      message: message ?? this.message,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status, dogs, message];
}
