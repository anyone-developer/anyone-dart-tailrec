// ignore_for_file: prefer_typing_uninitialized_variables

/*
 * @Author: Edward Zhang 
 * @Date: 2022-10-13 09:29:18 
 * @Last Modified by: Edward Zhang
 * @Last Modified time: 2022-10-13 12:11:02
 */
typedef ConditionCallback = bool Function<T>(T);
typedef ResultCallback = T Function<T>(T);
typedef RecurringParamComputeCallback = T Function<T>(T);

/// Tailrec class. you need to create instance before use it.
/// Constructor would config execution callback.
/// [T] is input and output type. it also support [dynamic] type
class Tailrec<T extends dynamic> {
  final conditionCallback;
  final resultCallback;
  final recurringParamComputeCallback;

  /// constructor that you need to pass callbacks to make it work.
  /// [conditionCallback] is callback that to calculate condition to decide execute next invocation or return the result.
  /// [resultCallback] is callback that if condition is not fulfilled. the result callback would calculate result before return from tailrec.
  /// [recurringParamComputeCallback] is callback that calculate input parameters before next invocation.
  Tailrec({
    required ConditionCallback this.conditionCallback,
    required ResultCallback this.resultCallback,
    required RecurringParamComputeCallback this.recurringParamComputeCallback,
  });

  /// apply execution and return result of [T].
  /// [firstValue] is initiate value for this recursive functions.
  T apply(T firstValue) {
    var value = firstValue;
    while (true) {
      final condition = conditionCallback.call(value);
      if (condition) return resultCallback.call(value);
      value = recurringParamComputeCallback.call(value);
    }
  }
}
