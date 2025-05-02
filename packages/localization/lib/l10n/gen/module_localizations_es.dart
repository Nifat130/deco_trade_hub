// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'module_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class ModuleALocalizationsEs extends ModuleALocalizations {
  ModuleALocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get noValueSelected => 'No se ha seleccionado ningún valor';

  @override
  String valueMustBeNumericLessThan(int max) {
    return 'El valor debe ser numérico y tener menos de $max caracteres';
  }

  @override
  String valueMustBeNumericBetween(int min, int max) {
    return 'El valor debe ser numérico y estar entre $min y $max caracteres';
  }

  @override
  String get valueCannotBeEmpty => 'El valor no puede estar vacío';

  @override
  String get valueMustBeNumeric => 'El valor debe ser numérico';

  @override
  String valueMustBeNumericWithLength(int length) {
    return 'El valor debe ser numérico y tener $length caracteres';
  }

  @override
  String valueMustBeBetween(int min, int max) {
    return 'El valor debe estar entre $min y $max caracteres';
  }

  @override
  String get cancel => 'Cancelar';

  @override
  String get ok => 'Aceptar';

  @override
  String get back => 'Atrás';

  @override
  String get submit => 'Enviar';

  @override
  String get next => 'Siguiente';

  @override
  String get invalidEmailAddress => 'Correo electrónico inválido';

  @override
  String get oopsAnErrorHasOccurred => '¡Vaya! Hemos encontrado un error grave, ¡por favor contacta con soporte!';

  @override
  String get connected => 'Conectado';

  @override
  String get disconnected => 'Desconectado';

  @override
  String get networkErrorHasOccurred => 'Ha ocurrido un error de red';

  @override
  String get requestCancelled => 'Solicitud cancelada';

  @override
  String get generalApiErrorMessage => 'Ha ocurrido un error';
}
