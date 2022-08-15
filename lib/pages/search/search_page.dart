import 'package:cep_finder/business/search/search_cubit.dart';
import 'package:cep_finder/business/search/search_state.dart';
import 'package:cep_finder/data/address_model.dart';
import 'package:cep_finder/pages/search/widgets/add_to_favorites_button.dart';
import 'package:cep_finder/utills/cep_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchState();
}

class _SearchState extends State<SearchPage> {
  SearchCubit get cubit => context.read<SearchCubit>();

  late TextEditingController _cepTextController;
  late FocusNode _cepFocusNode;

  @override
  void initState() {
    super.initState();

    _cepTextController = TextEditingController();
    _cepFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) => BlocConsumer<SearchCubit, SearchState>(
        listener: _listener,
        builder: _builder,
      );

  void _listener(BuildContext context, SearchState state) {
    if (state.error == ErrorType.alreadyAdded) {
      _cepTextController.text = '';
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Você já adicionou esse endereço aos favoritos!',
          ),
          duration: Duration(seconds: 2),
          backgroundColor: Color(0xFF6D51FF),
        ),
      );
    } else if (state.error == ErrorType.alreadyAdded) {
      _cepTextController.text = '';
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Ocorreu um erro ao adicionar o endereço.',
          ),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.red,
        ),
      );
    } else if (state.addedToFavorites) {
      _cepTextController.text = '';
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Endereço adicionado aos favoritos com sucesso',
          ),
          duration: Duration(seconds: 2),
          backgroundColor: Color(0xFF6D51FF),
        ),
      );
    }
  }

  Widget _builder(BuildContext context, SearchState state) {
    return KeyboardActions(
      disableScroll: true,
      autoScroll: false,
      config: _keyboardConfig(),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _makeHeader(),
            const SizedBox(
              height: 120.0,
            ),
            _makeAddressInfoColumn(state),
            const SizedBox(
              height: 35.0,
            ),
            AddToFavoritesButton(
              addressModel: state.addressModel,
              onTap: () {
                cubit.addToFavorites(
                  addressModel: state.addressModel,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  KeyboardActionsConfig _keyboardConfig() => KeyboardActionsConfig(
        nextFocus: false,
        actions: [
          KeyboardActionsItem(
            displayArrows: false,
            focusNode: _cepFocusNode,
            onTapAction: () => cubit.searchCep(
              cep: _cepTextController.text,
            ),
          )
        ],
      );

  LayoutBuilder _makeHeader() => LayoutBuilder(
        builder: (context, constraints) => Container(
          color: const Color(0xFF6D51FF),
          width: constraints.maxWidth,
          height: 250.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  top: 35.0,
                  left: 25.0,
                  bottom: 20.0,
                ),
                child: Text(
                  'Procurar CEP',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 27.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 40.0, right: 40.0, bottom: 20.0),
                child: Text(
                  'Digite o CEP que você deseja procurar',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              _makeCEPTexfield(),
            ],
          ),
        ),
      );

  Padding _makeCEPTexfield() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: SizedBox(
          height: 60.0,
          child: Card(
            color: const Color(0xffFFFFFF),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  40.0,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
              ),
              child: TextField(
                controller: _cepTextController,
                focusNode: _cepFocusNode,
                maxLength: 9,
                keyboardType: TextInputType.number,
                onSubmitted: (text) => cubit.searchCep(cep: text),
                inputFormatters: [CEPInputFormatter()],
                decoration: const InputDecoration(
                  counterText: '',
                  border: InputBorder.none,
                  icon: ImageIcon(
                    AssetImage('assets/images/search_icon.png'),
                    color: Color(0xFF808089),
                  ),
                  hintText: '88330-301',
                ),
              ),
            ),
          ),
        ),
      );

  Widget _makeAddressInfoColumn(SearchState state) => Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                'Endereço:',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Color(0xFF6D51FF),
                  fontFamily: 'Poppins',
                  fontSize: 19.0,
                ),
              ),
            ),
            _makeAddressData(state),
          ],
        ),
      );

  Widget _makeAddressData(SearchState state) {
    if (state.isLoading) {
      return const Center(
        child: CircularProgressIndicator(
          color: Color(0xFF6D51FF),
        ),
      );
    } else if (state.error == ErrorType.requestError) {
      return _makeAddressText(
        'Não conseguimos localizar seu endereço, verifique se as informações passadas estão corretas.',
        true,
      );
    } else if (state.addressModel != null) {
      return _makeAddressText(
        _makeAddressInfoText(state.addressModel),
        false,
      );
    }
    return _makeAddressText(
      'As informações do seu CEP apareceram aqui.',
      false,
    );
  }

  String _makeAddressInfoText(AddressModel? address) {
    if (address!.street.isEmpty) {
      return '${address.city} ${address.state} - CEP ${address.cep}';
    } else {
      return '${address.street} - ${address.neighborhood} ${address.complement}'
          ' - ${address.city} ${address.state} - CEP ${address.cep}';
    }
  }

  Padding _makeAddressText(String text, bool errorText) => Padding(
        padding: const EdgeInsets.only(
          top: 20.0,
          left: 14.0,
          right: 30.0,
        ),
        child: Text(
          text,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 15.0,
            color: errorText ? Colors.red : Colors.black,
          ),
        ),
      );

  @override
  void dispose() {
    _cepTextController.dispose();
    _cepFocusNode.dispose();

    super.dispose();
  }
}
