library globals;

String ssid = "ESP32-Airlux";
String password = "123456789";

void setSsid(String newSsid) {
  ssid = newSsid;
}

void setPassword(String newPwd) {
  password = newPwd;
}
