class UrlApp {
  static String site = "https://areyouhere-app.com/public/";
  static String host = "https://areyouhere-app.com/public/api/";
  static Uri urllogin = Uri.parse('${host}users/loginUser');
  static Uri urlregister = Uri.parse('${host}users/createUser');
  static Uri urlsendmail = Uri.parse('${host}mail');
  static Uri urleditUserPassword = Uri.parse('${host}users/editUserPassword');
}
