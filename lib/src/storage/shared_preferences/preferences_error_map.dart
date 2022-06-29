abstract class SharedPreferencesError implements Exception {}

class CannotSavePreferences extends SharedPreferencesError {
  final String path;

  CannotSavePreferences(this.path);
}
