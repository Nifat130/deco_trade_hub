import 'package:deco_trade_hub/services/global/failures.dart';
import 'package:fpdart/fpdart.dart';
import 'package:shared/shared.dart'; // where Failure is defined
import 'package:supabase_flutter/supabase_flutter.dart';

Future<Either<Failure, T>> safeSupabaseCall<T>(
  Future<T> Function() action,
) async {
  try {
    final result = await action();
    return Right(result);
  } on PostgrestException catch (e) {
    return Left(Failure('[Postgrest] ${e.message}'));
  } on AuthException catch (e) {
    return Left(Failure('[Auth] ${e.message}'));
  } on FormatException catch (e) {
    return Left(Failure('[Format] ${e.message}'));
  } on TypeError catch (e) {
    return Left(Failure('[TypeError] ${e.toString()}'));
  } on StateError catch (e) {
    return Left(Failure('[StateError] ${e.message}'));
  } catch (e, st) {
    logE('[Unknown Error] $e\n$st');
    return Left(Failure('[Unknown] ${e.toString()}'));
  }
}
