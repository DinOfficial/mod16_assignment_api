class Urls{
  // all product fetch url
  static String baseURL = 'http://35.73.30.144:2008/api/v1';
  static String readProductUrl = '$baseURL/ReadProduct';

  // product create url
  static String createProductUrl = '$baseURL/CreateProduct';

  // product update url
  static String updateProductUrl(String id) => '$baseURL/UpdateProduct/$id';


  //preduct Delete by id url
  static String deleteProductUrl(String id) => '$baseURL/DeleteProduct/$id';


}