// Custom exception class remains the same. The caller will handle the exception
// by checking the response status code.
import 'package:chopper/chopper.dart';
import 'package:sha_red/sha_red.dart';
part 'registration_api.chopper.dart';

class RegApiException implements Exception {
  RegApiException(this.message);
  final String? message;
}

@ChopperApi(baseUrl: '')
abstract class RegistrationApi extends ChopperService {
  // A helper method to create an instance of the generated service class
  static RegistrationApi create([ChopperClient? client]) {
    // The name of the generated class is `_$<YourClassName>`
    return _$RegistrationApi(client);
  }

  @POST(path: '/users/signup')
  Future<Response<TokensDto>> signup(@Body() EmailCredentialDto dto);

  @POST(path: '/users/login')
  Future<Response<TokensDto>> login(@Body() EmailCredentialDto dto);

  @POST(path: '/users/refresh')
  // For the refresh token, we can pass the DTO directly in the body
  // and set the content type using a header if needed, but Chopper
  // handles JSON encoding by default with the JsonConverter.
  Future<Response<TokensDto>> refresh(@Body() RefreshTokenDto dto);
}
