/*
 * @Author: Edward Zhang 
 * @Date: 2022-10-13 09:30:56 
 * @Last Modified by: Edward Zhang
 * @Last Modified time: 2022-10-13 11:09:16
 */
import 'dart:math';

import 'package:tailrec/tailrec.dart';
import 'package:test/test.dart';

void main() {
  var eps = 1E-10;

  group('A group of tests', () {
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

    setUp(() {
      //increase precision to 1E-30
      eps = 1E-16;
    });

    test('calculate cos(x) fixed point', () {
      final fixedPoint = tailrec.apply(Random().nextDouble());
      expect(fixedPoint, 0.7390851332151607);
    });
  });
}
