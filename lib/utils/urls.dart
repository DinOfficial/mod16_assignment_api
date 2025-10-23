class Urls{
  // all product fetch url
  static String baseURL = 'http://35.73.30.144:2008/api/v1';
  static String readProductUrl = '$baseURL/ReadProduct';

  //preduct Delete by id url
  static String deleteProductUrl(String id) => '$baseURL/DeleteProduct/$id';


}