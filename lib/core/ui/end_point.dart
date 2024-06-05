class EndPoint {
  static const String url = 'http://dummyjson.com/';
  static const String signIn = 'auth/login';
  static const String todos ='todos';



  static const String applicationJson = "application/json";
  static const String accept = "accept";
  static const String applicationJsonCharSet =
      "application/json";
  static const String contentType ="Content-Type";
  static const Duration connectTimeout = Duration(milliseconds: 3000000);
  static const Duration receiveTimeout = Duration(milliseconds: 3000000);
}