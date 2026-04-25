import 'package:test/test.dart';

//Author: Shawn
//Email: stepfencurryxiao@gmail.com

class Node<T> {
  //the data of the Node
  T? data;
  Node<T>? next;

  Node(T? data) {
    this.data = data;
    this.next = null;
  }
}

class LinkedListStack<T> {
  //Top of stack
  Node<T>? head;

  //Size of stack
  int size = 0;

  LinkedListStack() {
    this.head = null;
    this.size = 0;
  }

  //Add element at top of the stack

  void push(T element) {
    Node<T> newNode = new Node<T>(element);
    newNode.next = this.head;
    this.head = newNode;
    this.size++;
  }

  //Pop element from top at the stack

  T? pop() {
    T? returnData = null;
    if (size == 0) {
      print("The stack is empty!!!");
    } else {
      Node<T>? destroy = this.head;
      this.head = this.head?.next;
      returnData = destroy?.data;
      this.size--;
    }
    return returnData;
  }

  bool isEmpty() {
    return this.size == 0;
  }

  int getSize() {
    return this.size;
  }
}

void main() {
  test("Push and Pop elements from LinkedListStack", () {
    LinkedListStack<String> stack = new LinkedListStack<String>();
    
    expect(stack.isEmpty(), isTrue);
    expect(stack.getSize(), equals(0));

    stack.push("2");
    stack.push("5");
    stack.push("9");
    stack.push("7");

    expect(stack.isEmpty(), isFalse);
    expect(stack.getSize(), equals(4));

    expect(stack.pop(), equals("7"));
    expect(stack.pop(), equals("9"));
    expect(stack.pop(), equals("5"));
    expect(stack.pop(), equals("2"));
    
    expect(stack.isEmpty(), isTrue);
    expect(stack.pop(), isNull);
  });
}
