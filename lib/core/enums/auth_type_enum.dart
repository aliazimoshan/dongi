enum AuthType {
  isLoggedIn('isLoggedIn'),
  isNotLoggedIn('isNotLoggedIn'),
  isLoading('isLoading'),
  isLoggedOut('isLoggedOut');

  final String type;
  const AuthType(this.type);
}

extension ConvertTweet on String {
  AuthType authTypeEnum() {
    switch (this) {
      case 'isLoggedIn':
        return AuthType.isLoggedIn;
      case 'isNotLoggedIn':
        return AuthType.isNotLoggedIn;
      case 'isLoggedOut':
        return AuthType.isLoggedOut;
      default:
        return AuthType.isLoading;
    }
  }
}
