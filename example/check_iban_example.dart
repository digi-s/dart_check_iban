import 'package:check_iban/check_iban.dart';

void main() {
  String validIban = 'FR7611315000011234567890138';
  String invalidIban = 'FR5311315000011233567896765';

  print(checkIban(validIban)); // returns true
  print(checkIban(invalidIban)); // returns false
}
