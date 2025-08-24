abstract class ApiException implements Exception {}

class DinedTokenApiException implements ApiException {
  const DinedTokenApiException();
}

/// 404, 401 not found , on login
class WrongLoginApiException implements ApiException {
  const WrongLoginApiException();
}

// unexpected empty body
class EmptyBodyApiException implements ApiException {
  const EmptyBodyApiException();
}
