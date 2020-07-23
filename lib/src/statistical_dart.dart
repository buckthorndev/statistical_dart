import 'dart:math';

/// Statistical class
class Statistical {
  /// Create a new object that provide all statistical methods.
  ///
  /// Example
  /// ```
  /// Statistical statistical = Statistical();
  /// ````
  const Statistical();

  /// Return the smallest value of the numbers list.
  ///
  /// Example
  /// ```
  /// print(Statistical().arrMin([0.1,9,0,8,12,-1]));
  /// //output -1
  /// ```
  arrMin(List numbers) {
    numbers.sort();
    return numbers[0];
  }

  /// Return the biggest value of the numbers.
  ///
  /// Example
  /// ```
  /// print(Statistical().arrMax([0.1,9,0,8,12,-1]));
  /// //output 12
  /// ```
  arrMax(List numbers) {
    numbers.sort();
    return numbers[numbers.length - 1];
  }

  /// The sum of all numbers
  ///
  /// Example
  /// ```
  /// print(Statistical().arrSum([0.1,9,0,8,12,-1]));
  /// //output 28.1
  /// ```

  arrSum(List numbers) => numbers.reduce((a, b) => a + b);

  ///In statistics and probability theory, a median is a value separating the higher half from the lower half of a data sample,
  /// a population or a probability distribution. For a data set,
  /// it may be thought of as "the middle" value.
  ///
  ///👉 [Source](https://en.wikipedia.org/wiki/Median)
  ///
  /// Example
  /// ```
  /// print(Statistical().arrMedian([0.1,9,0,8,12,-1]));
  /// //output 4.05
  /// ```
  arrMedian(List numbers) {
    var middle = numbers.length ~/ 2;
    bool isEven = numbers.length % 2 == 0;
    numbers.sort();
    return isEven
        ? (numbers[middle - 1] + numbers[middle]) / 2
        : numbers[middle];
  }

  ///The mode of a set of data values is the value that appears most often.[1] If X is a discrete random variable, the mode is the value x (i.e, X = x) at which the probability mass function takes its maximum value.
  ///In other words, it is the value that is most likely to be sampled.
  ///
  ///👉 [Source](https://en.wikipedia.org/wiki/Mode)
  ///
  ///Example
  /// ```
  /// print(Statistical().arrMode([0.1,9,0,8,12,-1]));
  /// //output 0.1
  /// ```
  arrMode(List numbers) {
    double maxValue = 0;
    int maxCount = 0;

    for (int i = 0; i < numbers.length; ++i) {
      int count = 0;
      for (int j = 0; j < numbers.length; ++j) {
        if (numbers[j] == numbers[i]) ++count;
      }
      if (count > maxCount) {
        maxCount = count;
        maxValue = numbers[i];
      }
    }
    return maxValue;
  }

  /// There are several kinds of mean in mathematics, especially in statistics.
  /// In probability and statistics, the population mean, or expected value, is a measure of the central tendency either of a probability distribution or of the random variable characterized by that distribution
  ///
  ///👉 [Source](https://en.wikipedia.org/wiki/Mean)
  ///
  ///Example
  /// ```
  /// print(Statistical().arrMean([0.1,9,0,8,12,-1]));
  /// //output 4.683333333333334
  /// ```
  arrMean(List numbers) => this.arrSum(numbers) / numbers.length;

  ///In probability theory and statistics, variance is the expectation of the squared deviation of a random variable from its mean. Informally, it measures how far a set of numbers are spread out from their average value.
  ///
  ///👉 [Source](https://en.wikipedia.org/wiki/Variance)
  ///
  ///Example
  /// ```
  /// print(Statistical().arrVariance([0.1,9,0,8,12,-1]));
  /// //output 26.40138888888889
  /// ```
  arrVariance(List numbers) {
    var sqDiff = 0.0;
    var mean = this.arrMean(numbers);
    for (int i = 0; i < numbers.length; i++) {
      sqDiff += ((numbers[i] - mean) * (numbers[i] - mean));
    }
    return sqDiff / numbers.length;
  }

  ///In statistics, the standard deviation is a measure of the amount of variation or dispersion of a set of values
  ///
  ///👉 [Source](https://en.wikipedia.org/wiki/Standard_deviation)
  ///
  ///Example
  /// ```
  /// print(Statistical().arrStdDeviation([0.1,9,0,8,12,-1]));
  /// //output 5.138228185755172
  /// ```
  arrStdDeviation(List numbers) => sqrt(this.arrVariance(numbers));

  ///In mathematics, the factorial of a positive integer n, denoted by n!, is the product of all positive integers less than or equal to n.
  ///
  ///👉 [Source](https://en.wikipedia.org/wiki/Factorial)
  ///
  ///Example
  /// ```
  /// print(Statistical().factorial(5));
  /// //output 120
  /// ```
  factorial(int number) {
    var factorialResult = 1;
    for (int i = 2; i <= number; i++) {
      factorialResult *= i;
    }
    return factorialResult;
  }

  ///In mathematics, the geometric mean is a mean or average, which indicates the central tendency or typical value of a set of numbers by using the product of their values (as opposed to the arithmetic mean which uses their sum). The geometric mean is defined as the nth root of the product of n numbers, i.e., for a set of numbers x1, x2, ..., xn.
  ///
  ///👉 [Source](https://en.wikipedia.org/wiki/Factorial)
  ///
  ///Example
  /// ```
  /// print(Statistical().arrGeometricMean([1, 2, 3, 4, 5, 6, 7]));
  /// //output 3.380015159141296
  /// ```
  arrGeometricMean(List numbers) => pow(
      numbers.reduce((accumulator, current) => accumulator * current),
      1 / numbers.length);

  ///In mathematics, the harmonic mean (sometimes called the subcontrary mean) is one of several kinds of average, and in particular, one of the Pythagorean means. Typically, it is appropriate for situations when the average of rates is desired.
  ///
  ///👉 [Source](https://en.wikipedia.org/wiki/Harmonic_mean)
  ///
  ///Example
  /// ```
  /// print(Statistical().arrHarmonicMean([13.5, 14.5, 14.8, 15.2, 16.1 ]));
  /// //output 14.770
  /// ```
  arrHarmonicMean(List numbers) {
    var sm = 0.0;
    for (int i = 0; i < numbers.length; i++) {
      sm = sm + (1) / numbers[i];
    }
    return numbers.length / sm;
  }

  /// The sample mean and sample covariance are estimators of the population mean and population covariance, where the term population refers to the set from which the sample was taken.
  ///
  ///In probability theory and statistics, the binomial distribution with parameters n and p is the discrete probability distribution of the number of successes in a sequence of n independent experiments, each asking a yes–no question, and each with its own boolean-valued outcome: success/yes/true/one (with probability p) or failure/no/false/zero (with probability q = 1 − p). A single success/failure experiment is also called a Bernoulli trial or Bernoulli experiment and a sequence of outcomes is called a Bernoulli process; for a single trial, i.e., n = 1, the binomial distribution is a Bernoulli distribution. The binomial distribution is the basis for the popular binomial test of statistical significance.
  ///
  ///Example
  /// ```
  /// print(Statistical().arrCovariance([65.21, 64.75, 65.26, 65.76, 65.96] ,[67.25, 66.39, 66.12, 65.70, 66.64]));
  /// //output -0.0580
  /// ```
  arrCovariance(List num1, List num2) {
    if (num1.length != num2.length) return;
    var sum = 0.0;
    for (int i = 0; i < num2.length; i++) {
      sum += ((num1[i] - arrMean(num1)) * (num2[i] - arrMean(num2)));
    }
    return sum / (num1.length - 1);
  }

  _fct(int n) {
    if (n < 0)
      return null;
    else if (n == 1)
      return 1;
    else
      return n * _fct(n - 1);
  }

  _combinations(n, k) {
    if (k > n) return 0;
    var nFact = _fct(n);
    var kFact = _fct(k);
    var nkFact = _fct(n - k);
    var numerator = nFact;
    var denominator = kFact * nkFact;

    var ans = numerator / denominator;
    return ans;
  }

  ///In probability theory and statistics, the binomial distribution with parameters n and p is the discrete probability distribution of the number of successes in a sequence of n independent experiments, each asking a yes–no question, and each with its own boolean-valued outcome: success/yes/true/one (with probability p) or failure/no/false/zero (with probability q = 1 − p). A single success/failure experiment is also called a Bernoulli trial or Bernoulli experiment and a sequence of outcomes is called a Bernoulli process; for a single trial, i.e., n = 1, the binomial distribution is a Bernoulli distribution. The binomial distribution is the basis for the popular binomial test of statistical significance.
  ///
  /// 👉 [Source](https://en.wikipedia.org/wiki/Binomial_distribution)
  ///
  /// trials = number of trials
  ///
  /// successes = probability of success in each trial
  ///
  /// probofsuccess = number of success in n trials
  ///
  /// Example
  ///```
  ///print(Statistical().binomial(5,2,0.5));
  /////output 0.3125
  ///```
  binomial(trials, successes, probofsuccess) =>
      _combinations(trials, successes) *
      pow(probofsuccess, successes) *
      pow(1 - probofsuccess, trials - successes);
}
