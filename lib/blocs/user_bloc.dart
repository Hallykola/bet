class UserBloc {
  bool isAdmin;

  UserBloc() {
    isAdmin = fetchStatus();
  }

  bool fetchStatus() {
    return true;
  }
}
