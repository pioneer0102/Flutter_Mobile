import 'package:flutter_bloc/flutter_bloc.dart';

part 'data_event.dart';
part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc() : super(Initial()) {
    on<IncrementEvent>(_onIncrementEvent);
    on<DecrementEvent>(_onDecrementEvent);
  }

  void _onIncrementEvent(IncrementEvent event, Emitter<DataState> emit) {
    if (state is UpdatedState) {
      emit(UpdatedState((state as UpdatedState).count + 1));
    }
    if (state is Initial) {
      emit(UpdatedState(0));
    }
  }

  void _onDecrementEvent(DecrementEvent event, Emitter<DataState> emit) {
    if (state is UpdatedState) {
      emit(UpdatedState((state as UpdatedState).count - 1));
    }
    if (state is Initial) {
      emit(UpdatedState(0));
    }
  }
}

// void _onFetchDataEvent(DataEvent event, Emitter<DataState> emit) async {
  //   emit(Loading());
  //   await Future.delayed(const Duration(seconds: 2));
  //   emit(Success());
  // }
