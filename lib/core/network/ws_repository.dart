import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sha_red/sha_red.dart';

@lazySingleton
class WsRepository {
  final _toServerSubj = BehaviorSubject<ToServer>();
  final _toClientSubj = BehaviorSubject<ToClient>();
  WsRepository();

  void toServer(ToServer toServer) => _toServerSubj.add(toServer);
  void toClient(ToClient toClient) => _toClientSubj.add(toClient);

  Stream<ToServer> get toServerStream => _toServerSubj.stream;
  Stream<ToClient> get toClientStream => _toClientSubj.stream;
}
