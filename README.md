<img src="LogoProd.svg" width="200">

<br/>

> "*Make code work for you*"


A simple tool that solves [Dart](https://dart.dev/)'s lack of metaprogramming features.

Perfect for building scripts, background jobs, scheduled tasks, and development utilities like **code generation**, **data processing**, and more.


Here is a extremely simple actor:

```dart
import 'package:actor/actor.dart';

@actor
Future<void> sayHello() async {
    print("Hello, world!");
}
```

Here is how to run it:
```bash
dart run actor
```

## Why?

In January 2025, the Dart team made the difficult decision to [stop work on macros](https://medium.com/@vijay.menon/an-update-on-dart-macros-data-serialization-2bd147e4b4a0) after years of development. Despite significant investment, macros were facing fundamental technical challenges that made it difficult to ship.

This leaves a gap in the Dart ecosystem for code generation and metaprogramming needs. While [`build_runner`](https://pub.dev/packages/build_runner) exists as a solution, many developers find it complex, **slow** (very slow in fact), and hard to maintain.

`actor` is meant to be a simpler, more maintainable alternative. Instead of complex code generation systems that aren't flexible enough and very disconnected from each other, `actor` lets you write small, focused programs (called **actors**) that do precisely what you want.

## Installation


### Globally (Recommended)

Add `actor` to your shell's PATH by running:
```bash
dart pub global activate actor

Then you can run `actor` from anywhere:
```bash
actor
```


### For a Specific Project

Add `actor` to your `pubspec.yaml`:

```yaml
dev_dependencies:
  actor: ^0.0.1
```

Then install it:

```bash
dart pub get
```


## Quick Start

1. Create a Dart file with an actor function:

```dart
import 'package:actor/actor.dart';

@actor
Future<void> sayHello() async {
  print("Hello, world!");
}
```

2. Run the actor:

```bash
# Production mode (run once)
dart run actor

# Development mode (watch for changes)
dart run actor --dev
```

## Usage

### Basic Actor

The simplest actor is just a function with the `@actor` annotation:

```dart
@actor
Future<void> myActor() async {
  print("Running my actor!");
}
```

### Actor with Context

Actors can optionally receive an `ActorContext` (aliased as `C`) as their first parameter to access execution information:

```dart
@actor
Future<void> myActor(C c) async {
  print("Mode: ${c.mode}");
  print("File: ${c.file.path}");
  print("Root: ${c.root.path}");
  print("Directory: ${c.dir.path}");
}
```

The context provides:
- `mode`: Current execution mode (`prod` or `dev`)
- `file`: The Dart file containing the actor
- `root`: The root directory of the Dart project
- `dir`: Convenience getter for the file's directory

### Command Line Options

```bash
# Run in production mode (default)
actor [directory]

# Run in development mode (watch for changes)
actor --dev [directory]
actor -d [directory]
```

### Execution Modes

#### Production Mode (default)

In production mode, actors run once and the program exits after all actors complete:

```bash
actor
```

Perfect for:
- Scripts and automation tasks
- Scheduled jobs
- One-time data processing
- CI/CD pipelines

#### Development Mode

In development mode, the tool watches for file changes and automatically restarts actors:

```bash
actor --dev
```

Perfect for:
- Local development
- Testing actor functions
- Live reload during development
- Background services during development

## How It Works

1. **Discovery**: The tool scans your Dart project (or specified directory) for `.dart` files
2. **Parsing**: It parses each file to find functions annotated with `@actor`
3. **Generation**: For each actor, it generates a temporary runner file
4. **Execution**: Each actor runs in its own Dart process
5. **Lifecycle Management**: The tool manages the lifecycle of all actor processes

In development mode, the tool also:
- Watches for file changes
- Re-evaluates actors when files are modified
- Automatically starts new actors and stops removed ones
- Maintains running actors across file changes

## Project Structure

The tool automatically:
- Finds your project root (by locating `pubspec.yaml`)
- Scans recursively through directories
- Ignores build artifacts (`.dart_tool`, `build`, `.dyn`)
- Creates temporary runner files in `.dart_tool/Actor/.Runners/`
