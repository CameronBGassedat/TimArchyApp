library globals;

String ssid = "ESP32-Airlux";
String password = "123456789";
String ip = "10.31.38.207";
String userEmail = "";
String userPwd = "";

void setSsid(String newSsid) {
  ssid = newSsid;
}

void setPassword(String newPwd) {
  password = newPwd;
}

void setIp(String newIp) {
  ip = newIp;
}

void setUserEmail(String newEmail) {
  userEmail = newEmail;
  print(userEmail);
}

void setUserPwd(String newPwd) {
  userPwd = newPwd;
  print(userPwd);
}
