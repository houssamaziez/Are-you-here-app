import 'dart:math';

class LogiqueMath {
  static int generateRandomNumber() {
    Random random = Random();
    return 100000 + random.nextInt(900000);
  }
}
