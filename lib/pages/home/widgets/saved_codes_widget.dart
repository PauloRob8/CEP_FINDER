import 'package:flutter/material.dart';

class SavedCodesWidget extends StatelessWidget {
  const SavedCodesWidget({
    required this.savedCounter,
    Key? key,
  }) : super(key: key);

  final int savedCounter;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(
          left: 32.0,
          right: 32.0,
          bottom: 40.0,
          top: 20.0,
        ),
        child: SizedBox(
          height: 65.0,
          child: Card(
            elevation: 0.0,
            shadowColor: const Color(0xffF6F4FF),
            color: const Color(0xffF6F4FF),
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
                  child: Image.asset('assets/images/saved_icon.png'),
                ),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      'CEPs salvos',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Color(
                          0xFF7B61FF,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 25.0),
                  child: CircleAvatar(
                    radius: 14,
                    backgroundColor: const Color(
                      0xFF7B61FF,
                    ),
                    child: Text(
                      savedCounter.toString(),
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
