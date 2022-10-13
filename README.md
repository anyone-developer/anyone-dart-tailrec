<p align="left">
  <img src="https://badgen.net/pub/v/tailrec" alt="pub version">
  <img src="https://badgen.net/pub/points/tailrec" alt="points">
  <img src="https://badgen.net/pub/likes/tailrec" alt="likes">
  <img src="https://badgen.net/pub/popularity/tailrec" alt="popularity">
  <img src="https://badgen.net/pub/sdk-version/tailrec" alt="sdk">
  <img src="https://badgen.net/pub/flutter-platform/tailrec" alt="platform">
</p>

# Tailrec (anyone-dart-tailrec)

This package help you to convert recursive function into the while-loop codes. so that program won't meet out of memory that caused by stack overflow. inspired by kotlin ```tailrec``` keywords. ([https://kotlinlang.org/docs/functions.html#tail-recursive-functions](https://kotlinlang.org/docs/functions.html#tail-recursive-functions))

*If you like my module, please buy me a coffee.*

*More and more tiny and useful GitHub action modules are on the way. Please donate to me. I accept a part-time job contract. if you need, please contact me: zhang_nan_163@163.com*

## How to use

### Math concepts

<img src="https://raw.githubusercontent.com/anyone-developer/anyone-dart-tailrec/main/misc/concept.png" alt="tailrec">

### Calculate fixed point for cos(x)

```dart
import 'dart:core';
import 'package:tailrec/tailrec.dart';
import 'dart:math';

final eps = 1E-10; //precision

void main() {
  final firstValue = 1;

  var tailrec = Tailrec(
    conditionCallback: <double>(dynamic x) {
      final y = cos(x);
      final temp = (x - y).abs();
      return temp < eps;
    },
    recurringParamComputeCallback: <double>(dynamic x) {
      return cos(x) as double;
    },
    resultCallback: <double>(dynamic x) {
      return x;
    },
  );

  final fixedPoint = tailrec.apply(firstValue);
  print(fixedPoint);
}

```

### Conclusion
#### cos(x) fixed point approximately equal to 0.7390851332151607
##### cos(0.7390851332151607) ≈ 0.7390851332151607

## Donation

PalPal: https://paypal.me/nzhang4

<img src="https://raw.githubusercontent.com/anyone-developer/anyone-dart-mitt/main/misc/alipay.jpeg" width="500">

<img src="https://raw.githubusercontent.com/anyone-developer/anyone-dart-mitt/main/misc/wechat_pay.png" width="500">


