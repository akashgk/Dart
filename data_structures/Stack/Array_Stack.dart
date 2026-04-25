import 'package:test/test.dart';

class ArrayStack<T> {
  /// [stack]
  List<T?> _stack = [];

  /// [_count] is the number of element in the stack
  int _count = 0;

  /// [_size] of stack
  int _size = 0;

  //Init the array stack
  ArrayStack(int size) {
    this._size = size;
    this._stack = List<T?>.filled(_size, null);
    this._count = 0;
  }

  /// Push a item to the stack of type [T] to the [_stack]
  /// if the size is exceeded the element wont be added.
  void push(T item) {
    if (_count == _size) {
      return null;
    }
    _stack[_count] = item;
    _count++;
  }

  /// Pop the last element inserted from the [_stack].
  T? pop() {
    if (_count == 0) {
      return null;
    }
    T? pop_data = _stack[_count - 1];
    _stack[_count - 1] = null;
    _count--;
    return pop_data;
  }

  List<T?> get stack {
    return _stack;
  }
}

void main() {
  test('test case 1: push and get stack', () {
    ArrayStack<String> arrayStack = new ArrayStack<String>(6);
    arrayStack.push('1');
    arrayStack.push("2");
    arrayStack.push('3');
    arrayStack.push("4");
    arrayStack.push('5');
    arrayStack.push("6");
    expect(arrayStack.stack, equals(['1', '2', '3', '4', '5', '6']));
  });

  test('test case 2: pop stack items', () {
    ArrayStack<String> arrayStack = new ArrayStack<String>(6);
    arrayStack.push('1');
    arrayStack.push("2");
    arrayStack.push('3');
    arrayStack.push("4");
    arrayStack.push('5');
    arrayStack.push("6");

    expect(arrayStack.pop(), equals('6'));
    expect(arrayStack.pop(), equals('5'));
    expect(arrayStack.pop(), equals('4'));
    expect(arrayStack.pop(), equals('3'));
    expect(arrayStack.pop(), equals('2'));
    expect(arrayStack.pop(), equals('1'));
    expect(arrayStack.pop(), isNull);
  });

  test('test case 9: empty stack', () {
    ArrayStack<String> arrayStack2 = new ArrayStack<String>(3);
    expect(arrayStack2.stack, equals([null, null, null]));
  });
}
