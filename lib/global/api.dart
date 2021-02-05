abstract class UrlConstants {
  static const String baseUrl = 'http://api.nytimes.com';

  // PLease insert your api key here
  // To get an api get please visit https://developer.nytimes.com/get-started
  static const String apiKey = '';

  static const String period = '7';

  static const String section = 'all-sections';

  static const String mostPopularArticles =
      '$baseUrl/svc/mostpopular/v2/mostviewed/$section/$period.json?api-key=$apiKey';
}
