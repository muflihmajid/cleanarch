class Endpoints {
  String baseUrl;

  Endpoints(String baseUrl) {
    this.baseUrl = baseUrl;
  }

  String user() {
    return '/user/me';
  }

  String verifyByPassword() {
    return '/setting/verify';
  }

}
