class AuthException implements Exception {
  AuthException(this.key);
  final String key;

  static const Map<String, String> errors = {
    'EMAIL_EXISTS': 'Email já cadastrado',
    'OPERATION_NOT_ALLOWED': 'Operação não permitida!',
    'TOO_MANY_ATTEMPTS_TRY_LATER': ' bloqueado temporariamente, tente mais tarde',
    'EMAIL_NOT_FOUND': 'Email não encontrado',
    'INVALID_PASSWORD': 'Senha inválida',
    'NOT_CONEXTION': 'Sem conexão!',
    'USER_DESABLED': 'A conta do usuário foi desabilitada',
  };


  @override
  String toString() {
    return errors[key] ?? 'ocorreu um erro inesperado!';
  }
}
