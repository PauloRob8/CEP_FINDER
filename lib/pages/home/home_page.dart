import 'package:cep_finder/bloc/home/home_cubit.dart';
import 'package:cep_finder/bloc/home/home_state.dart';
import 'package:cep_finder/pages/home/widgets/saved_codes_widget.dart';
import 'package:cep_finder/pages/home/widgets/searched_codes_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  HomeCubit get cubit => context.read<HomeCubit>();

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) => Column(
              children: [
                SizedBox(
                  width: constraints.maxWidth,
                  height: 620.0,
                  child: Stack(
                    children: [
                      _makeImageBackground(),
                      _makeWelcomeText(),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: SearchedCodesWidget(
                          searchedCeps: state.searchedCeps,
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SavedCodesWidget(
                    savedCounter: state.savedCounter,
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Align _makeImageBackground() => Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Image.asset('assets/images/home_background.png'),
        ),
      );

  Padding _makeWelcomeText() => Padding(
        padding: const EdgeInsets.only(
          top: 20.0,
          left: 25.0,
          right: 25.0,
        ),
        child: RichText(
          textAlign: TextAlign.start,
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'Olá,',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 27.0,
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text: '\nBem-vindo',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 27.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      );
}
