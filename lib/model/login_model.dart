class LoginModel {
  String nome = '';
  String email = '';
  String senha = '';
  bool kepon = false;

  LoginModel(
      {required this.nome,
      required this.email,
      required this.senha,
      required this.kepon});

  LoginModel.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    email = json['email'];
    senha = json['senha'];
    kepon = json['kepon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nome'] = nome;
    data['email'] = email;
    data['senha'] = senha;
    data['kepon'] = kepon;
    return data;
  }

  @override
  String toString() {
    return 'Nome${nome}Senha${senha}email${email}kepon$kepon';
  }
}
