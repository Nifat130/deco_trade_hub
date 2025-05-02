import 'package:bloc/bloc.dart';
import 'package:deco_trade_hub/services/dependencies/src/dependency_injection.dart';
import 'package:deco_trade_hub/services/dependencies/src/dependency_injection_instance_names.dart';
import 'package:deco_trade_hub/services/environments/environments.dart';

@Service()
class CounterCubit extends Cubit<int> {
  CounterCubit()
      : super(ServiceProvider.get<Environment>().initialCounterValue);

  final int _incrementValue = ServiceProvider.get<int>(
    instanceName: DependencyInjectionInstances.incrementValue,
  );

  void increment() => emit(state + _incrementValue);

  void decrement() => emit(state - _incrementValue);
}
