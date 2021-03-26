// Based on the intersperse package from modulovalue.com

typedef IntersperseElementBuilder<T> = T? Function(T? element, T? previous);

Iterable<T> intersperseCustom<T>(
    IntersperseElementBuilder<T> elementBuilder, Iterable<T> iterable) sync* {
  final iterator = iterable.iterator;
  if (iterator.moveNext()) {
    T previous;
    yield previous = iterator.current;
    while (iterator.moveNext()) {
      final element = elementBuilder(iterator.current, previous);
      if (element != null) yield element;
      yield previous = iterator.current;
    }
  }
}
