/*
 * @Author: Edward Zhang 
 * @Date: 2022-10-13 09:29:18 
 * @Last Modified by: Edward Zhang
 * @Last Modified time: 2022-10-13 10:33:01
 */
typedef ConditionCallback = bool Function<T>(T);
typedef ResultCallback = T Function<T>(T);
typedef RecurringParamComputeCallback = T Function<T>(T);

class Tailrec<T extends dynamic> {
  final conditionCallback;
  final resultCallback;
  final recurringParamComputeCallback;

  Tailrec({
    required ConditionCallback this.conditionCallback,
    required ResultCallback this.resultCallback,
    required RecurringParamComputeCallback this.recurringParamComputeCallback,
  });

  T apply(T firstValue) {
    var value = firstValue;
    while (true) {
      final condition = conditionCallback.call(value);
      if (condition) return resultCallback.call(value);
      value = recurringParamComputeCallback.call(value);
    }
  }
}
