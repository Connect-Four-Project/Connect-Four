class BackgroundPosition {
  static bool startUp = true;

  static bool getPosition() {
    return startUp;
  }

  static void toggle() {
    startUp = !startUp;
  }
}
