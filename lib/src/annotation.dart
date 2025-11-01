///
/// The annotation to mark a function as an actor.
/// It is used to extract the actor from the function.
///
/// Example:
/// ```dart
/// @actor
/// Future<void> sayHello(C c)async {
///   print("Hello, world!");
/// }
/// ```
///
const actor = ActorAnnotation._();

class ActorAnnotation {
  const ActorAnnotation._();
}
