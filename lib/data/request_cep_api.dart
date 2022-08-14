import 'dart:convert';

import 'package:cep_finder/data/address_model.dart';
import 'package:http/http.dart' as http;

class RequestCepApi {
  RequestCepApi();

  String notFoundBody = "{\"erro\": \"true\"}";

  /// Request a cep on the API
  Future<AddressModel?> searchCEP({
    required String cep,
  }) async {
    final response = await http.get(
      Uri.parse('https://viacep.com.br/ws/$cep/json'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      if (data['erro'] == null) {
        return AddressModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('cep not found');
      }
    } else {
      throw Exception('cep not found');
    }
  }
}
