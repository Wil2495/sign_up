enum ResetPasswordResponse {
  ok,
  networkRequestFailed,
  userDisabled,
  userNotFound,
  tooManyRequest,
  unknown,
}

ResetPasswordResponse stringToResetPasswordResponse(String code) {
  switch (code) {
    case "internal-error":
      return ResetPasswordResponse.tooManyRequest;
    case "user-not-found":
      return ResetPasswordResponse.userNotFound;
    case "user-disabled":
      return ResetPasswordResponse.userDisabled;
    case "network-request-failed":
      return ResetPasswordResponse.networkRequestFailed;
    default:
      return ResetPasswordResponse.unknown;
  }
}
