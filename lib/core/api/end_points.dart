class EndPoint {
  static String baseUrl = "https://todo.iraqsapp.com/";
  static String signIn = "auth/login";
  static String signUp = "auth/register";
  static String getUserDataEndPoint(id) {
    return "user/get-user/$id";
  }
}

class ApiKey {
  static String status = "statusCode";
  static String errorMessage = "error";
  static String password = "password";
  static String token = "token";
  static String message = "message";
  static String id = "_id";
  static String name = "displayName";
  static String phone = "phone";
  static String address = "address";
  static String profilePic = "profilePic";
  static String accessToken = "access_token";
  static String refreshToken = "refresh_token";
  static String experienceYears = "experienceYears";
  static String experienceLevel = "experienceLevel";


}