import 'package:flutter/material.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesState();
}

class _FavoritesState extends State<FavoritesPage> {
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
  Widget build(BuildContext context) => const Center(
        child: Text('Hi! I\'m favorites page'),
      );

  @override
  void dispose() {
    //

    super.dispose();
  }
}
