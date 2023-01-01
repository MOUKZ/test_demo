import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static void initEnvFile() async {
    await dotenv.load(fileName: ".env");
  }
}
