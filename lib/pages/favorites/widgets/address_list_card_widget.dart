import 'package:cep_finder/data/address_model.dart';
import 'package:flutter/material.dart';

class AddressListCardWidget extends StatelessWidget {
  const AddressListCardWidget({
    required this.address,
    required this.onDelete,
    Key? key,
  }) : super(key: key);

  final AddressModel address;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) => Card(
        elevation: 1.5,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              18.0,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    address.cep,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 15.0,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  IconButton(
                    icon: const ImageIcon(
                      AssetImage('assets/images/delete_icon.png'),
                      color: Color(0xFF6D51FF),
                    ),
                    onPressed: onDelete,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Text(
                  _makeAddressText(
                    address,
                  ),
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 13.5,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  String _makeAddressText(AddressModel address) {
    if (address.street.isEmpty) {
      return '${address.city} ${address.state} - CEP ${address.cep}';
    } else {
      return '${address.street} - ${address.neighborhood} ${address.complement}'
          ' - ${address.city} ${address.state} - CEP ${address.cep}';
    }
  }
}
