import 'package:cep_finder/business/favorites/favorites_cubit.dart';
import 'package:cep_finder/business/home/home_cubit.dart';
import 'package:cep_finder/business/navigation/navigation_cubit.dart';
import 'package:cep_finder/business/navigation/navigation_state.dart';
import 'package:cep_finder/business/search/search_cubit.dart';
import 'package:cep_finder/pages/favorites/favorites_page.dart';
import 'package:cep_finder/pages/home/home_page.dart';
import 'package:cep_finder/pages/search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainState();
}

class _MainState extends State<MainPage> {
  NavigationCubit get cubit => context.read<NavigationCubit>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<NavigationCubit, NavigationState>(
        builder: _builder,
      );

  Widget _builder(BuildContext context, NavigationState state) {
    return Scaffold(
      body: SafeArea(
        child: _getPage(state.currentIndex),
      ),
      bottomNavigationBar: _makeBottomBar(state.currentIndex),
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return BlocProvider<HomeCubit>(
          create: (context) => HomeCubit()..getSavedData(),
          child: const HomePage(),
        );
      case 1:
        return BlocProvider<SearchCubit>(
          create: (context) => SearchCubit(),
          child: const SearchPage(),
        );
      case 2:
        return BlocProvider<FavoritesCubit>(
          create: (context) => FavoritesCubit()..getFavoritesAddresses(),
          child: const FavoritesPage(),
        );

      default:
        return BlocProvider<HomeCubit>(
          create: (context) => HomeCubit()..getSavedData(),
          child: const HomePage(),
        );
    }
  }

  BottomNavigationBar _makeBottomBar(int index) => BottomNavigationBar(
        currentIndex: index,
        onTap: (index) => cubit.changeIndex(
          index: index,
        ),
        selectedIconTheme: const IconThemeData(size: 26.0),
        unselectedIconTheme: const IconThemeData(size: 24.0),
        selectedLabelStyle: const TextStyle(
          fontFamily: 'Poppins',
        ),
        unselectedLabelStyle: const TextStyle(
          fontFamily: 'Poppins',
        ),
        selectedItemColor: const Color(0xFF6D51FF),
        unselectedItemColor: const Color(0xFF7D8588),
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: ImageIcon(
              AssetImage('assets/images/home_icon.png'),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Procurar',
            icon: ImageIcon(
              AssetImage('assets/images/search_image.png'),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Favoritos',
            icon: ImageIcon(
              AssetImage('assets/images/fav_icon.png'),
            ),
          ),
        ],
      );
}
