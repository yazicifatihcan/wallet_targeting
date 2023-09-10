class HttpUrl {
  /// Api Url
  static late final String baseUrl;

  static const String signIn = '/auth/sign-in';

  String getAllStore (bool available) => '/home/get-all-store/$available';

  String gameDetail (String id) => '/game-management/game-by-id/$id';

  static const String currentUser = '/auth/get-current-user';

  static const String userItems = '/auth/get-user-items';

  static const String storeCarousel = '/store/carousel-images';

  static const String storeItems = '/store/store-items';

  String gameCriterias (String id) => '/game-management/get-all-game-criteria-by-game-id/$id';

  String storeItemDetail (String id) => '/store/store-item-by-id/$id';

  

  
}
