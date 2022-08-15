import 'package:flutter/material.dart';

class SearchedCodesWidget extends StatelessWidget {
  const SearchedCodesWidget({
    required this.searchedCeps,
    Key? key,
  }) : super(key: key);

  final int searchedCeps;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.only(),
        width: 215.0,
        height: 215.0,
        decoration: const BoxDecoration(
          color: Color(0xFF6D51FF),
          borderRadius: BorderRadius.all(
            Radius.circular(
              110,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Image.asset(
                'assets/images/search_image.png',
                width: 52.0,
                height: 52.0,
                color: const Color(0xFFB4A5FD),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 5.0,
                    left: 5.0,
                    right: 5.0,
                  ),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: searchedCeps.toString(),
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 55.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const TextSpan(
                          text: '\nCEPs pesquisados',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w200,
                            fontSize: 14.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
}
