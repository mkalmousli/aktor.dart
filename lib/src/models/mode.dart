/// Execution mode for actors.
enum Mode {
  /// Production mode - actors run once and exit.
  prod,

  /// Development mode - actors are watched and restart on file changes.
  dev,
}
