import 'package:cep_finder/data/address_model.dart';
import 'package:flutter/material.dart';

class AddToFavoritesButton extends StatelessWidget {
  const AddToFavoritesButton({
    required this.addressModel,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final AddressModel? addressModel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: addressModel != null ? onTap : () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: SizedBox(
            height: 55.0,
            child: Card(
              color:
                  addressModel != null ? Colors.white : const Color(0xff2E179D),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    40.0,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: ImageIcon(
                      addressModel != null
                          ? const AssetImage('assets/images/star_icon.png')
                          : const AssetImage('assets/images/fav_icon.png'),
                      color: addressModel != null
                          ? const Color(0xffEAB701)
                          : Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Text(
                        'Adicionar aos favoritos',
                        style: TextStyle(
                          color: addressModel != null
                              ? const Color(0xff7B61FF)
                              : Colors.white,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
