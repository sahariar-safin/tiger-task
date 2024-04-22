
import 'package:tiger_task/features/repositories/models/allrepo_model.dart';
import 'package:tiger_task/utils/http/http_client.dart';

class RepositoriesController {


  Future<List<RepositoriesModel>> fetchRepositories(pageNumber) async {
    List<RepositoriesModel> repositories = [];

    try {
      var response = await THttpHelper.get('/search/repositories?q=flutter&per_page=10&page=$pageNumber');

      if (response['items'] != null) {
        for (var item in response['items']) {
          repositories.add(RepositoriesModel.fromJson(item));
        }
      }
      
      return repositories;
    } catch (e) {
      throw e;
    }
  }
}