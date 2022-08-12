import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage() : super();

  @override
  State<SearchPage> createState() => _SearchState();
}

class _SearchState extends State<SearchPage> {
  @override
  void initState() {
    super.initState();

    //
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    //
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          LayoutBuilder(
            builder: (context, constraints) => Container(
              color: const Color(0xFF6D51FF),
              width: constraints.maxWidth,
              height: 250.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(
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
                  Padding(
                    padding: EdgeInsets.only(left: 40.0, right: 40.0),
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
                ],
              ),
            ),
          ),
          Text(
            'Seu endereço irá aparecer aqui',
          ),
        ],
      );

  @override
  void dispose() {
    //

    super.dispose();
  }
}
