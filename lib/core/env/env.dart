enum EnvType { dev, prod }

class Env {
  final EnvType envType;
  final String baseUrl;
  final String authHost;
  final int connectionTimeOut;
  final int receiveTimeOut;
  final String defaultDateTimeFormat;

  final String agoraAppId;
  final String agoraChannelToken;
  final String channelId = 'test-channel';

  // Define more environment variables here

  Env._internal({
    required this.envType,
    required this.baseUrl,
    required this.authHost,
    required this.agoraAppId,
    required this.agoraChannelToken,
    this.defaultDateTimeFormat = 'dd-MM-yyyy',
    this.connectionTimeOut = 30000,
    this.receiveTimeOut = 30000,
  });

  factory Env.dev() {
    return Env._internal(
      envType: EnvType.dev,
      baseUrl: 'http://localhost:8080/api/v1',
      authHost: 'http://localhost:8000',
      agoraAppId: "f7772dc13a604e43bc58a5b8ead46e7f",
      agoraChannelToken:
          "007eJxTYLjJ92rvcpcs63efrXdZFExYr3CX9/dt51QO9eW71LrCP79TYEgzNzc3Skk2NE40MzBJNTFOSja1SDRNskhNTDExSzVPC9Z6ntwQyMhwcYUaMyMDBIL4bAy5+UmZOakMDAAG/iHS",
    );
  }

  factory Env.prod() {
    return Env._internal(
      envType: EnvType.prod,
      baseUrl: 'http://mi-learning.thinhlh.com/api/v1',
      authHost: 'http://mi-learning.thinhlh.com:8000',
      agoraAppId: "f7772dc13a604e43bc58a5b8ead46e7f",
      agoraChannelToken:
          "007eJxTYHBbvjT7mehszk1cF8LZfvQFP/Zi5PPcYr+Vce78ULXzJdEKDGnm5uZGKcmGxolmBiapJsZJyaYWiaZJFqmJKSZmqeZpzzSeJzcEMjLwdgqyMDJAIIjPxpCbn5SZk8rAAAAIcR5y",
    );
  }
}
