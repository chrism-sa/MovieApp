import 'package:lottie/lottie.dart';
import 'package:movieapp/controllers/movie_controller.dart';
import 'package:movieapp/decorators/movies_cache_repository_decorator.dart';
import 'package:movieapp/models/movies_model.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/pages/details_page.dart';
import 'package:movieapp/repositories/movies_repository_imp.dart';
import 'package:movieapp/service/dio_service_imp.dart';
import 'package:movieapp/utils/apis.utils.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({Key? key}) : super(key: key);

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}
class _ServicesPageState extends State<ServicesPage> {
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
                          'Movies - GridView',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        SizedBox(height: 20,)
                      ],
                    ),
                  );
                },
              ),
              ValueListenableBuilder<Movies?>(
                valueListenable: _controller.movies,
                builder: (_, movies, __) {
                  return movies != null
                      ? GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                          ),
                          itemCount: movies.listMovies.length,
                          itemBuilder: (_, idx) => GestureDetector(
                            onTap: () {
                              // Navigasi ke halaman detail dengan parameter movie
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailsPage(
                                    movie: movies.listMovies[idx],
                                  ),
                                ),
                              );
                            },
                            child: AspectRatio(
                              aspectRatio: 2 / 4, // Sesuaikan dengan aspek rasio yang diinginkan
                              child: Image.network(
                                API.REQUEST_IMG(movies.listMovies[idx].posterPath),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        )
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
