import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:peliculas/models/models.dart';
import 'package:peliculas/screens/cinemasOfMaps.dart';

import 'package:provider/provider.dart';

import 'package:peliculas/search/search_delegate.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: ValueListenableBuilder<int>(
          valueListenable: moviesProvider.selectedTab,
          builder: (context, value, child) => Text(
            value == 0 ? 'Películas en cines' :value ==1 ? 'Mis favoritas':'Cinemas',
            style: TextStyle(color: Colors.black),
          ),
        ),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.search_outlined),
            onPressed: () =>
                showSearch(context: context, delegate: MovieSearchDelegate()),
          )
        ],
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: 3,
        allowImplicitScrolling: true,
        scrollBehavior: const CupertinoScrollBehavior(),
        physics: const BouncingScrollPhysics(),
        onPageChanged: (value) {
          moviesProvider.selectedTab.value = value;
        },
        itemBuilder: (__, index) {
          switch (index) {
            case 0:
              return SingleChildScrollView(
                child: Column(
                  children: [
                    // Tarjetas principales
                    CardSwiper(movies: moviesProvider.onDisplayMovies),

                    // Slider de películas
                    MovieSlider(
                      movies: moviesProvider.popularMovies, // populares,
                      title: 'Populares', // opcional
                      onNextPage: () => moviesProvider.getPopularMovies(),
                    ),
                  ],
                ),
              );
            case 1:
              return FavouritePage();
            case 2:
             return CinemasPoints();
            default:
              return const SizedBox.shrink();
          }
        },
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: moviesProvider.selectedTab,
        builder: (context, value, child) => FlashyTabBar(
          selectedIndex: value,
          showElevation: true,
          onItemSelected: (value) {
            moviesProvider.selectedTab.value = value;
            _pageController.animateToPage(value,
                duration: Duration(milliseconds: 500), curve: Curves.linear);
          },
          items: [
            FlashyTabBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            FlashyTabBarItem(
              icon: Icon(Icons.favorite),
              title: Text('Mis Fav'),
            ),
            FlashyTabBarItem(
              icon: Icon(FontAwesomeIcons.map),
              title: Text('Cinemas'),
            ),
          ],
        ),
      ),
    );
  }
}

class FavouritePage extends StatelessWidget {
  const FavouritePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ValueListenableBuilder<List<Movie>>(
        valueListenable: moviesProvider.favMovies,
        builder: (context, value, child) => value.isEmpty
            ? Center(
                child: Text('Por el momento no tienes peliculas favoritas'))
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 9 / 11,
                ),
                itemCount: value.length,
                itemBuilder: (context, index) => MoviePoster(
                    value[index], '${value[index].title}-${value[index].id}'),
              ),
      ),
    );
  }
}
