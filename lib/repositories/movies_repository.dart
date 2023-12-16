import '../models/movies_model.dart';

abstract class MoviesRepository {
  //Future porque vamos requisitar a ação a API e não sabemos quando ela vai retornar para a gente
  Future<Movies> getMovies();
}