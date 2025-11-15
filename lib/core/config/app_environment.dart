enum Environment { dev, prod }

class AppEnvironment {
  static late final String baseUrl;
  static late final Environment environment;

  static void init({
    required String baseUrl,
    required Environment environment,
  }) {
    AppEnvironment.baseUrl = baseUrl;
    AppEnvironment.environment = environment;
  }
}
