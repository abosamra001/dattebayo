class Logger {
  static void printR(String? text) {
    print('\x1B[31m$text\x1B[0m');
  }

  static void printG(String? text) {
    print('\x1B[32m$text\x1B[0m');
  }

  static void printY(String? text) {
    print('\x1B[33m$text\x1B[0m');
  }

  static void printB(String? text) {
    print('\x1B[34m$text\x1B[0m');
  }
}
