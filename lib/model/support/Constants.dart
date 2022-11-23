class Constants {
  // app info
  static final String APP_VERSION = "0.0.1";
  static final String APP_NAME = "ShopStore";

  // addresses
  static final String ADDRESS_STORE_SERVER = "localhost:8080";
  //static final String ADDRESS_AUTHENTICATION_SERVER = "***";


  // requests
  static final String REQUEST_SEARCH_PRODUCTS = "/api/products/get";
  //static final String REQUEST_ADD_USER = "/users";
  static final String REQUEST_LOGIN="/customer/login";
  static final String REQUEST_REGISTRATION="/customer/registration";
  // states
  static final String STATE_CLUB = "club";

  //cart
  static final String REQUEST_ADD_PRODUCT_CART="/cart/add";
  static final String REQUEST_GET_PRODUCT_CART="/cart/showAll";
  static final String REQUEST_REMOVE_PRODUCT_CART="/cart/remove";

 static final String REQUEST_PURCHASE_PRODUCT="/purchase/p";
 static final String REQUEST_GET_PURCHASES="/purchase/purchases";

  // responses
  static final String RESPONSE_ERROR_MAIL_USER_ALREADY_EXISTS = "ERROR_MAIL_USER_ALREADY_EXISTS";

  // messages
  static final String MESSAGE_CONNECTION_ERROR = "connection_error";


}