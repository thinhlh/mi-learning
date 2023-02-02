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
      agoraAppId: "520db85d84374e4eaef700bb2ed76fc6",
      agoraChannelToken:
          "006520db85d84374e4eaef700bb2ed76fc6IABr6zwOiHwWcrKE9Vu2yBIaAO+ONVGHvaT+XCQ5gifdwWLMzZAAAAAAEAAv13+tghOPYgEAAQCBE49i",
    );
  }

  factory Env.prod() {
    return Env._internal(
      envType: EnvType.prod,
      baseUrl: 'http://mi-learning.thinhlh.com/api/v1',
      authHost: 'http://mi-learning.thinhlh.com:8000',
      agoraAppId: "520db85d84374e4eaef700bb2ed76fc6",
      agoraChannelToken:
          "006520db85d84374e4eaef700bb2ed76fc6IABr6zwOiHwWcrKE9Vu2yBIaAO+ONVGHvaT+XCQ5gifdwWLMzZAAAAAAEAAv13+tghOPYgEAAQCBE49i",
    );
  }
}
