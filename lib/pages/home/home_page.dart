import 'package:cep_finder/pages/home/widgets/saved_codes_widget.dart';
import 'package:cep_finder/pages/home/widgets/searched_codes_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    //
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) => SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    width: constraints.maxWidth,
                    height: 620.0,
                    child: Stack(
                      children: [
                        _makeImageBackground(),
                        _makeWelcomeText(),
                        const Align(
                          alignment: Alignment.bottomCenter,
                          child: SearchedCodesWidget(),
                        ),
                      ],
                    ),
                  ),
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: SavedCodesWidget(),
                  ),
                ],
              ),
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
