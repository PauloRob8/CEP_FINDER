import 'dart:convert';

class AddressModel {
  AddressModel({
    required this.cep,
    required this.street,
    required this.complement,
    required this.neighborhood,
    required this.city,
    required this.state,
  });

  final String cep;
  final String street;
  final String complement;
  final String neighborhood;
  final String city;
  final String state;

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      cep: json['cep'],
      street: json['logradouro'],
      complement: json['complemento'],
      neighborhood: json['bairro'],
      city: json['localidade'],
      state: json['uf'],
    );
  }

  static List<AddressModel> fromJsonList(List<dynamic> list) {
    return list
        .map(
          (json) => AddressModel.fromJson(jsonDecode(json)),
        )
        .toList();
  }

  static List<String> toJsonList(List<AddressModel> addresses) {
    return addresses.map((address) => address.toJson()).toList();
  }

  Map<String, dynamic> toMap() => <String, dynamic>{
        'cep': cep,
        'logradouro': street,
        'complemento': complement,
        'bairro': neighborhood,
        'localidade': city,
        'uf': state,
      };

  String toJson() => jsonEncode(toMap());
}
