/*
 * @Author: Edward Zhang 
 * @Date: 2022-10-13 09:30:38 
 * @Last Modified by: Edward Zhang
 * @Last Modified time: 2022-10-13 11:10:32
 */
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
