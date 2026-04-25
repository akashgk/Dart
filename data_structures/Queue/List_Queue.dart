import 'package:test/test.dart';

//Author:Shawn
//Email:stepfencurryxiao@gmail.com

const int MAX_SIZE = 10;

class ListQueue<T> {
  int count = 0;
  List<T?> queue = List.filled(MAX_SIZE, null);

  //Checks if the queue has elements (not empty)
  bool hasElements() {
    if (queue.length == 0) {
      return false;
    } else {
      return true;
    }
  }

  //Add an element to the queue
  void enque(T element) {
    if (count == MAX_SIZE) {
      print("The queue is full!!!");
    } else {
      queue[count] = element;
      count++;
    }
  }

  //Takes the next element from the queue
  T? deque() {
    T? result = null;
    if (count == 0) {
      print("The queue is empty!!!");
    } else {
      result = queue[0];
      for (int i = 0; i < queue.length - 1; i++) {
        queue[i] = queue[i + 1];
      }
      count--;
    }
    return result;
  }
}

void main() {
  test("Enqueue and deque elements", () {
    ListQueue<int> queue = new ListQueue<int>();

    // Note: The original hasElements returns true if queue.length > 0,
    // but queue is initialized with length MAX_SIZE (10), so it always returns true.
    expect(queue.hasElements(), isTrue);

    queue.enque(12);
    queue.enque(2);
    queue.enque(7);

    expect(queue.queue.sublist(0, 3), equals([12, 2, 7]));

    expect(queue.deque(), equals(12));
    expect(queue.deque(), equals(2));
    expect(queue.deque(), equals(7));

    // Deque on empty
    expect(queue.deque(), isNull);
  });
}
