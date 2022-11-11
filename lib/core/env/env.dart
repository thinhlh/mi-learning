enum EnvType { dev, prod }

class Env {
  final EnvType envType;
  final String baseUrl;
  final int connectionTimeOut;
  final int receiveTimeOut;

  final String agoraAppId;
  final String agoraChannelToken;
  final String channelId = 'test-channel';

  // Define more environment variables here

  Env._internal({
    required this.envType,
    required this.baseUrl,
    required this.agoraAppId,
    required this.agoraChannelToken,
    this.connectionTimeOut = 30000,
    this.receiveTimeOut = 30000,
  });

  factory Env.dev() {
    return Env._internal(
      envType: EnvType.dev,
      baseUrl: 'http://10.0.2.2:8080/api',
      agoraAppId: "520db85d84374e4eaef700bb2ed76fc6",
      agoraChannelToken:
          "006520db85d84374e4eaef700bb2ed76fc6IABr6zwOiHwWcrKE9Vu2yBIaAO+ONVGHvaT+XCQ5gifdwWLMzZAAAAAAEAAv13+tghOPYgEAAQCBE49i",
    );
  }

  factory Env.prod() {
    return Env._internal(
      envType: EnvType.prod,
      baseUrl: 'http://localhost:3000/api',
      agoraAppId: "520db85d84374e4eaef700bb2ed76fc6",
      agoraChannelToken:
          "006520db85d84374e4eaef700bb2ed76fc6IABr6zwOiHwWcrKE9Vu2yBIaAO+ONVGHvaT+XCQ5gifdwWLMzZAAAAAAEAAv13+tghOPYgEAAQCBE49i",
    );
  }
}
