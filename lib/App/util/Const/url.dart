class UrlApp {
  static String host = "http://10.0.2.2:8000/api/";

  static Uri urllogin = Uri.parse('${host}users/loginUser');
  static Uri urlregister = Uri.parse('${host}users/createUser');
}
