import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

/// A base class for Hydrated Blocs that provides utility methods.
abstract class BaseHydratedBloc<Event, State>
    extends HydratedBloc<Event, State> {
  BaseHydratedBloc(super.initialState);

  /// Emits the [state] if the bloc is not closed. Otherwise, does nothing.
  ///
  /// This method is useful for safely emitting states in situations where
  /// the bloc might have been closed.
  @protected
  void emitIfNotClosed(Emitter<State> emit, State state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
