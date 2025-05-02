// ignore_for_file: public_member_api_docs

class ConnectionError extends Error {
  ConnectionError(this.message);

  final Object message;

  @override
  String toString() {
    return message.toString();
  }
}

class RequestCancelled implements Exception {
  RequestCancelled(this.message);

  final Object message;

  @override
  String toString() {
    return message.toString();
  }
}

class RequestTimeout implements Exception {
  RequestTimeout(this.message);

  final Object message;

  @override
  String toString() {
    return message.toString();
  }
}

class ConnectionTimeout implements Exception {
  ConnectionTimeout(this.message);

  final Object message;

  @override
  String toString() {
    return message.toString();
  }
}

class SendTimeout implements Exception {
  SendTimeout(this.message);

  final Object message;

  @override
  String toString() {
    return message.toString();
  }
}

class BadResponse implements Exception {
  BadResponse(this.message);

  final Object message;

  @override
  String toString() {
    return message.toString();
  }
}

class BadCertificate implements Exception {
  BadCertificate(this.message);

  final Object message;

  @override
  String toString() {
    return message.toString();
  }
}

class UnknownDioError implements Exception {
  UnknownDioError(this.message);

  final Object message;

  @override
  String toString() {
    return message.toString();
  }
}
