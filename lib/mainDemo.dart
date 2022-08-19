
/// dart语言特性练习环境

void main() {
  Person gu = Person();
  print("$gu");
}

class Person {
  Person()
      : name = "迪迦",
        age = 12,
        sex = 0;

  final String name;
  final int age;
  final int sex;

  @override
  String toString() {
    return "name: $name   age: $age   sex: $sex";
  }


}
