// ignore: file_names
class Api {
  static String homeUrl = "http://10.2.0.2:8000/api";
  static String imageHomeURL = "http://10.2.0.2:8000/api";
//auth url
  static String signUpUrl = "/register";
  static String loginUrl = '/login';
    static String logout='/logout';

//get category
  static String getCategory = "/categories";
//get stors
  static String getStors = "/get_store";
//get product
  static String getProduct = "/get_product";
//get_Stores_By_Category
  // ignore: non_constant_identifier_names
  static String get_Stores_By_Category = "/get_Stores_By_Category";
//get_Products_By_Store
  static String get_Products_By_Store = "/get_Products_By_Store";

  ///add_To_Favorites/product id
  static String add_To_Favorites = "/add_To_Favorites";
//get-Favorites
  static String get_To_Favorites = "/get_Favorites";
//get_Cart_Summary
  static String get_Cart_Summary = "/get_Cart_Summary";
//add to card
  static String addToCart = "/add_To_Cart";
//get user deatales
  static String getUserDetails = "/getUserDetails";
//edit_profile_picture
  static String edit_profile_picture="/edit_profile_picture";  
  ///increase_Quantity
 static String updateCartQuantity ="/increase_Quantity";

}
