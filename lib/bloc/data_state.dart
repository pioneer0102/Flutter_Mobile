part of 'data_bloc.dart';

abstract class DataState {}

class Initial extends DataState {}

class UpdatedState extends DataState {
  final int count;

  UpdatedState(this.count);
}
