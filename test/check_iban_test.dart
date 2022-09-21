import 'dart:math';

import 'package:check_iban/check_iban.dart';
import 'package:test/test.dart';

void main() {
  group('Test check IBAN FR valid', () {
    test('Check Banque de France IBAN', () {
      expect(checkIban('FR7630001007941234567890185'), isTrue);
    });
    test('Check BNP Paribas IBAN', () {
      expect(checkIban('FR7630004000031234567890143'), isTrue);
    });
    test('Check Crédit Agricole IBAN', () {
      expect(checkIban('FR7630006000011234567890189'), isTrue);
    });
    test('Check Banque Populaire IBAN', () {
      expect(checkIban('FR7610107001011234567890129'), isTrue);
    });
    test('Check Caisse d\'Epargne IBAN', () {
      expect(checkIban('FR7611315000011234567890138'), isTrue);
    });
    test('Check Crédit Lyonnais (LCL)	IBAN', () {
      expect(checkIban('FR7630002032531234567890168'), isTrue);
    });
    test('Check HSBC IBAN', () {
      expect(checkIban('FR7630056009271234567890182'), isTrue);
    });
    test('Check Crédit Mutuel	IBAN', () {
      expect(checkIban('FR7611808009101234567890147'), isTrue);
    });
    test('Check La Banque Postale	IBAN', () {
      expect(checkIban('FR7610011000201234567890188'), isTrue);
    });
    test('Check Crédit du Nord IBAN', () {
      expect(checkIban('FR7630076020821234567890186'), isTrue);
    });
    test('Check Dexia Banque IBAN', () {
      expect(checkIban('FR7614410000011234567890163'), isTrue);
    });
    test('Check AXA Banque IBAN', () {
      expect(checkIban('FR7612548029981234567890161'), isTrue);
    });
    test('Check Natixis Banque IBAN', () {
      expect(checkIban('FR7630007000111234567890144'), isTrue);
    });
    test('Check Credit Cooperatif IBAN', () {
      expect(checkIban('FR7642559000011234567890121'), isTrue);
    });
    test('Check Credit Industriel et Commercial IBAN', () {
      expect(checkIban('FR7641199110541234567890180'), isTrue);
    });
  });

  group('Test check IBAN FR invalid', () {
    test('Test empty string', () {
      expect(checkIban(''), isFalse);
    });
    test('Check slightly modified IBAN', () {
      expect(checkIban('FR7610011000201234567390188'), isFalse);
    });
    test('Check Random String input', () {
      const chars =
          'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
      Random rnd = Random();
      int rndLgth = Random().nextInt(30);
      String rndmStrng = String.fromCharCodes(Iterable.generate(
          rndLgth, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
      expect(checkIban(rndmStrng), isFalse);
    });
  });
}
