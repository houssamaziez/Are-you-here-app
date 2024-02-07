import 'package:dart_ping/dart_ping.dart';

class PingApp {
  static final ping = Ping(
    'houssamaziez.com',
    count: 10000000,
  );
}
