import 'package:aktor/aktor.dart';

///
/// Example aktor that prints "Hello, world!"
///
/// Run it with:
/// ```
/// dart run aktor --dev
/// ```
///
/// And then change the code to see the aktor restart!
///
@live
@aktor
void sayHello() {
  print("Hello, world!");
}
