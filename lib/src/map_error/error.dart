class ProjectError {
  final int currentError;
  final dynamic error;

  ProjectError(this.currentError, {this.error});

  static const GENERIC_ERROR = 1;
  static const NOT_FOUND_CONTENT = 2;
  static const CONNECTION_FAILED = 3;
  static const DB_GENERIC_ERROR = 4;
}
