import 'package:statistical_dart/statistical_dart.dart';

void main() {
  Statistical statistical = Statistical();
  List numbers = [1, 3, 5, 8, -19, -10, 1, 0.2];
  // Array sum
  print(statistical.arrSum(numbers));
  // Array min
  print(statistical.arrMin(numbers));
  // Array max
  print(statistical.arrMax(numbers));
  // Array median
  print(statistical.arrMedian(numbers));
  // Array mode
  print(statistical.arrMode([0.1,9,0,8,12,-1]));
  // Array mean
  print(statistical.arrMean(numbers));
  // Array Variance
  print(statistical.arrVariance(numbers));
  // Array standard deviation
  print(statistical.arrStdDeviation(numbers));
  // Factorial
  print(statistical.factorial(5));
  // Array geometric mean
  print(statistical.arrGeometricMean(numbers));
  // Array harmonic mean
  print(statistical.arrHarmonicMean(numbers));
  // Array covariance
  print(statistical.arrCovariance(numbers,numbers));
  // Binomial
  print(statistical.binomial(5, 2, 0.4));
}
