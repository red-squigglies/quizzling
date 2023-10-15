class Vlad {
  Vlad(this.input) : _isEmpty = input == null || input.isEmpty;

  final String? input;
  final bool _isEmpty;
  String? error;

  Vlad mandatory(String message) {
    if (_isEmpty) {
      error ??= message;
    }
    return this;
  }

  Vlad minLength(int minLen, String message) {
    if (_isEmpty) {
      return this;
    }

    if (minLen > input!.length) {
      error ??= message;
    }

    return this;
  }

  Vlad maxLength(int maxLen, String message) {
    if (_isEmpty) {
      return this;
    }

    if (maxLen < input!.length) {
      error ??= message;
    }

    return this;
  }

  Vlad email(String message) {
    if (_isEmpty) {
      return this;
    }

    final pattern = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$",
    );

    if (!pattern.hasMatch(input!)) {
      error ??= message;
    }

    return this;
  }
}
