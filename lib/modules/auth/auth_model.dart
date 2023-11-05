class AuthModel {
  String username;
  String password;

  AuthModel(this.username, this.password) {
    try {
      if (username.isEmpty) {
        throw Exception("Preencha o campo login.");
      }

      if (password.isEmpty) {
        throw Exception("Preencha o campo login.");
      }
    } catch (e) {
      rethrow;
    }
  }
}
