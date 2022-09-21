import 'package:check_iban/check_iban.dart';

void main() {
  IbanChecker checker = IbanChecker();
  String validIban = 'FR7611315000011234567890138';
  String invalidIban = 'FR5311315000011233567896765';

  print(checker.checkIban(validIban)); // returns true
  print(checker.checkIban(invalidIban)); // returns false
}
