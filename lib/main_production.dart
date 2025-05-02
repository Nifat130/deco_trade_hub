import 'package:deco_trade_hub/bootstrap.dart';
import 'package:deco_trade_hub/services/environments/environments.dart';

Future<void> main() async {
  // run the app with the production environment
  await bootstrap(const ProductionEnvironment());
}
