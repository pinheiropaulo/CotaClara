abstract final class LoginValidators {
  static String? document(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Informe seu CPF ou CNPJ';
    }

    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Informe sua senha';
    }

    return null;
  }
}
