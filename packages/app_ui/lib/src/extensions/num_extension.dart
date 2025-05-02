import 'package:gap/gap.dart';

extension NumExtension on num {
  Gap get gap => Gap(toDouble());
}
