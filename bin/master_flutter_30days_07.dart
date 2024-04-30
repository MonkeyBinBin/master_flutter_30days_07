void main(List<String> arguments) {
  var person = Person('John Doe', 30);
  print('Name: ${person.name}, Age: ${person.age}'); // Name: John Doe, Age: 30

  var obj1 = MyClass();
  var obj2 = MyClass();
  var obj3 = MyClass();
  MyClass.printCount(); // Output: Count: 3
  print(obj1);
  print(obj2);
  print(obj3);

  var animal = Animal();
  animal.makeSound(); // Output: The animal makes a sound
  var dog = Dog();
  dog.makeSound(); // Output: The dog barks

  // 無法直接創建抽象類別的物件
  // var shape = Shape(); // Error: Cannot instantiate abstract class 'Shape'

  var circle = Circle(5.0);
  print('Circle area: ${circle.area()}'); // Output: Circle area: 78.5
  circle.draw(); // Output: Drawing the shape

  var rectangle = Rectangle(4.0, 6.0);
  print('Rectangle area: ${rectangle.area()}'); // Output: Rectangle area: 24.0
  rectangle.draw(); // Output: Drawing the shape

  var bird = Bird('Penguin');
  bird.fly(); // Output: I can fly!
  bird.swim(); // Output: I can swim!
}

// 推薦的寫法(通過lint檢查)
class Person {
  String name;
  int age;

  Person(this.name, this.age);
}

// 無參數建構子
// class Person {
//   String name;
//   int age;

//   Person() {
//     name = 'John Doe';
//     age = 30;
//   }
// }

// 有參數建構子
// class Person {
//   String name;
//   int age;

//   Person(String name, int age) {
//     this.name = name;
//     this.age = age;
//   }
// }

// 命名建構子
// class Person {
//   String name;
//   int age;

//   Person.fromMap(Map<String, dynamic> data) {
//     name = data['name'];
//     age = data['age'];
//   }
// }

// 靜態變數, 靜態方法
class MyClass {
  static int count = 0;

  MyClass() {
    MyClass.count++; // 更新靜態變數
  }

  static void printCount() {
    print('Count: $count');
  }
}

// Inheritance
class Animal {
  void makeSound() {
    print('The animal makes a sound');
  }
}

class Dog extends Animal {
  @override
  void makeSound() {
    print('The dog barks');
  }
}

abstract class Shape {
  double area(); // 抽象方法
  void draw() {
    // 普通方法
    print('Drawing the shape');
  }
}

class Circle extends Shape {
  double radius;

  Circle(this.radius);

  @override
  double area() {
    return 3.14 * radius * radius;
  }
}

class Rectangle extends Shape {
  double width;
  double height;

  Rectangle(this.width, this.height);

  @override
  double area() {
    return width * height;
  }
}

mixin Flyable {
  void fly() {
    print('I can fly!');
  }
}

mixin Swimmable {
  void swim() {
    print('I can swim!');
  }
}

class Bird with Flyable, Swimmable {
  String name;

  Bird(this.name);
}
