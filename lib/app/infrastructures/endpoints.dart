class Endpoints {
  String baseUrl;

  Endpoints(String baseUrl) {
    this.baseUrl = baseUrl;
  }

  String user() {
    return '/employee';
  }

  String verifyByPassword() {
    return '/setting/verify';
  }

}
