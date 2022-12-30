enum ServiceKey {
  settings,
}

extension ServicKeyValue on ServiceKey {
  String get value {
    switch (this) {
      case ServiceKey.settings:
        return 'settings';
    }
  }
}
