<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->
A package to check if an IBAN is valid.

## Features

- Take an IBAN in input and return true if its valid and false if its not.
- Only works with French IBAN at the moment.

## Getting started

- Install the package
- Use it

## Usage

```dart
    IbanChecker checker = IbanChecker();
    String validIban = 'FR7611315000011234567890138';
    String invalidIban = 'FR5311315000011233567896765';

    print(checker.checkIban(validIban)); // returns true
    print(checker.checkIban(invalidIban)); // returns false
```