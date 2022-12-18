import 'dart:convert';

class Tokens {
  final String tokenType;
  final String accessToken;
  final String refreshToken;
  Tokens({
    required this.tokenType,
    required this.accessToken,
    required this.refreshToken,
  });

  Tokens copyWith({
    String? token_type,
    String? access_token,
    String? refresh_token,
  }) {
    return Tokens(
      tokenType: token_type ?? tokenType,
      accessToken: access_token ?? accessToken,
      refreshToken: refresh_token ?? refreshToken,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'token_type': tokenType,
      'access_token': accessToken,
      'refresh_token': refreshToken,
    };
  }

  factory Tokens.fromMap(Map<String, dynamic> map) {
    return Tokens(
      tokenType: map['token_type'] ?? '',
      accessToken: map['access_token'] ?? '',
      refreshToken: map['refresh_token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Tokens.fromJson(String source) => Tokens.fromMap(json.decode(source));

  @override
  String toString() =>
      'Tokens(token_type: $tokenType, access_token: $accessToken, refresh_token: $refreshToken)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Tokens &&
        other.tokenType == tokenType &&
        other.accessToken == accessToken &&
        other.refreshToken == refreshToken;
  }

  @override
  int get hashCode =>
      tokenType.hashCode ^ accessToken.hashCode ^ refreshToken.hashCode;
}
