import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movieapp/controllers/movie_controller.dart';
import 'package:movieapp/decorators/movies_cache_repository_decorator.dart';
import 'package:movieapp/repositories/movies_repository_imp.dart';
import '../models/movies_model.dart';
import '../service/dio_service_imp.dart';
import '../widgets/custom_list_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MovieController _controller = MovieController(
    MoviesCacheRepositoryDecorator(
      MoviesRepositoryImp(
        DioServiceImp(),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(28),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              ValueListenableBuilder<Movies?>(
                  valueListenable: _controller.movies,
                  builder: (_, movies, __) {
                    return Visibility(
                      visible: movies != null,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Movies',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextField(
                            onChanged: _controller.onChanged,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Search",
                              prefixIcon:
                                  Icon(Icons.search), //icon at head of input
                              //prefixIcon: Icon(Icons.people), //you can use prefixIcon property too
                              //prefisIcon sets Icon inside the TextField border, 'icon' sets outside border.
                              //suffixIcon: Icon(Icons.cancel) //icon at tail of input
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    );
                  }),
              ValueListenableBuilder<Movies?>(
                valueListenable: _controller.movies,
                builder: (_, movies, __) {
                  return movies != null
                      ? ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true, //ultilizar o espaço disponivel
                          itemCount: movies.listMovies.length,
                          //itemBuilder: (_, idx) => Image.network(
                          //API.REQUEST_IMG(movies.listMovies[idx].posterPath),
                          itemBuilder: (_, idx) => CustomListCardWidget(
                              movie: movies.listMovies[idx]),
                          separatorBuilder: (_, __) => Divider(),
                        )
                      //: Container();
                      : Lottie.asset('assets/lottie.json');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
