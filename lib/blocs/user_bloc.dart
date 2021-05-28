class UserBloc {
  bool isAdmin;

  UserBloc() {
    isAdmin = false;
  }

  bool fetchStatus() {
    return isAdmin;
  }

  setAdmin(bool admin) {
    isAdmin = admin;
  }
}
