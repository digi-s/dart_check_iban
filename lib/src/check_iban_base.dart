class IbanChecker {
  /// Take a string in input and returns a bool.
  /// Return true if the IBAN is valid, false if it's not.
  /// For now, only support French IBANs.
  bool checkIban(String iban) {
    // Step 1 : Verification de la longueur de l'IBAN
    if (!checkIbanLength(iban)) {
      return false;
    }
    // Step 2 : Deplacement des 4 premiers caractères à la fin du string.
    String rearrangedIban = rearrangeIban(iban);
    // Step 3 : Remplacement des lettres par des chiffres (A = 10, B = 11, etc..)
    String replacedIban = replaceIban(rearrangedIban);
    // Step 4 : Calcul et check du resultat du mod 97 de l'integer resultant du remplacement precedant
    bool isIbanValid = checkMod97Result(replacedIban);
    return isIbanValid;
  }

  bool checkIbanLength(String iban) {
    // TODO: sortir required length pour passer ca en paramètres ?
    int requiredLength = 27;
    int length = iban.length;
    if (length != requiredLength) {
      return false;
    }
    return true;
  }

  String rearrangeIban(String iban) {
    String ibanInts = iban.substring(4);
    String ibanCode = iban.substring(0, 4);
    String rearrangedIban = ibanInts + ibanCode;
    return rearrangedIban;
  }

  String replaceIban(String iban) {
    String replacedIban = iban.replaceAllMapped(RegExp(r'[A-Z]'), (match) {
      String matchedLetter = match.group(0) ?? '';
      return (matchedLetter.codeUnitAt(0) - 55).toString();
    });
    return replacedIban;
  }

  bool checkMod97Result(String iban) {
    BigInt parsedIbanInt = BigInt.parse(iban);
    BigInt result = parsedIbanInt % BigInt.from(97);
    if (result.isValidInt) {
      if (result.toInt() == 1) {
        return true;
      }
      return false;
    }
    return false;
  }
}
