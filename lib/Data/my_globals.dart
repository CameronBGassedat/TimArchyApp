library globals;

String ssid = "ESP32-Airlux";
String password = "123456789";
String ip = "";

void setSsid(String newSsid) {
  ssid = newSsid;
}

void setPassword(String newPwd) {
  password = newPwd;
}

void setIp(String newIp) {
  ip = newIp;
}