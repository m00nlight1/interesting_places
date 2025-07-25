/// Base class for converters.
abstract base class Converter<TResult, TFrom> {
  const Converter();

  /// Convert TFrom to TResult.
  TResult convert(TFrom input);

  /// Convert TFrom list to TResult list.
  Iterable<TResult> convertMultiple(Iterable<TFrom> inputList) =>
      inputList.map(convert);

  /// Convert nullable TFrom to nullable TResult.
  TResult? convertNullable(TFrom? input) =>
      input == null ? null : convert(input);
}

/// Base class for converters that convert to and from a type.
abstract base class ConverterToAndFrom<TResult, TFrom> {
  const ConverterToAndFrom();

  /// TResult from TFrom converter.
  Converter<TResult, TFrom> get converter;

  /// TFrom from TResult converter.
  Converter<TFrom, TResult> get reverseConverter;

  /// Convert TFrom to TResult.
  TResult convert(TFrom input) => converter.convert(input);

  /// Convert TResult to TFrom.
  TFrom convertReverse(TResult input) => reverseConverter.convert(input);
}
