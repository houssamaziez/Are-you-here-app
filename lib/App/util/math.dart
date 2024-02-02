import 'dart:math';

class LogiqueMath {
  static int generateRandomNumber() {
    Random random = Random();
    return 10000 + random.nextInt(90000);
  }
}
