import 'package:cep_finder/bloc/favorites/favorites_cubit.dart';
import 'package:cep_finder/bloc/favorites/favorites_state.dart';
import 'package:cep_finder/pages/favorites/widgets/address_list_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesState();
}

class _FavoritesState extends State<FavoritesPage> {
  FavoritesCubit get cubit => context.read<FavoritesCubit>();

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => Container(
          width: constraints.maxWidth,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0.1, 0.9],
              colors: [
                const Color(0xffB4A6FF).withOpacity(0.5),
                Colors.white,
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 45.0, left: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/fav_image.png'),
                const SizedBox(height: 10.0),
                const Text(
                  'Meus favoritos',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 27.0,
                    color: Color(0xff6D51FF),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30.0),
                Expanded(child: _makeAddressesListBuilder()),
              ],
            ),
          ),
        ),
      );

  Widget _makeAddressesListBuilder() =>
      BlocBuilder<FavoritesCubit, FavoriteState>(
        builder: (context, state) {
          if (state.addresses.isEmpty) {
            return const Text(
              'Seus endereços salvos aparecerão aqui',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14.0,
              ),
            );
          } else {
            return _makeAddressList(state);
          }
        },
      );

  Widget _makeAddressList(FavoriteState state) {
    return Padding(
      padding: const EdgeInsets.only(right: 25.0),
      child: ListView.builder(
        itemCount: state.addresses.length,
        itemBuilder: (context, index) => AddressListCardWidget(
          address: state.addresses[index],
          onDelete: () => cubit.deleteAddress(
            addressModel: state.addresses[index],
          ),
        ),
      ),
    );
  }
}
