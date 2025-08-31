import 'package:equatable/equatable.dart';
import 'package:frontend/core/notifier/log_notifier.dart';
import 'package:frontend/features/auth/domain/token_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class TokenNotifier extends LogNotifier<TokenState> {
  final TokenRepository _repository;
  TokenNotifier(this._repository) : super(TokenState(null, null));

  void subscribe() {
    _repository.accessNtf.addListener(_listenAccess);
    _repository.refreshNtf.addListener(_listenRefresh);
    _listenAccess();
    _listenRefresh();
  }

  @override
  void dispose() {
    _repository.accessNtf.removeListener(_listenAccess);
    _repository.refreshNtf.removeListener(_listenRefresh);
    super.dispose();
  }

  void _listenAccess() {
    value = value.copyWith(token: _repository.accessNtf.value);
  }

  void _listenRefresh() {
    value = value.copyWith(refresh: _repository.refreshNtf.value);
  }
}

class TokenState extends Equatable {
  final String? token;
  final String? refresh;
  const TokenState(this.token, this.refresh);
  TokenState copyWith({String? token, String? refresh}) {
    return TokenState(token ?? this.token, refresh ?? this.refresh);
  }

  @override
  List<Object?> get props => [token, refresh];
}
