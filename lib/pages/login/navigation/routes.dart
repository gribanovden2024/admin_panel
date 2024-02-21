abstract class Routes {
  static const openWeb = '/openWeb';
  static const openLockWeb = '/openLockWeb';
  static const searchScreen = '/search-screen';
  static const forceUpdate = '/force-update';

  static const barcode = '/barcode';
  static const barcodeNotFound = '/barcode-not-found';

  static const showCase = '/';
  static const bannerDetail = '/banner-detail';

  static const catalog = '/';
  static const listOfCategory = '/categories';
  static const listOfProducts = '/list-of-products';
  static const filter = '/filter';
  static const filterDetail = '/filter-detail';
  static const productCard = '/product-card';
  static const reviews = '/reviews';
  static const reviewsAdd = '/reviews-add';
  static const productSlider = '/product-slider';

  static const basket = '/';
  static const ordering = '/ordering';
  static const orderProcessed = '/orderProcessed';
  static const showPoints = '/show-points';
  static const showShopsPoints = '/show-shops-points';
  static const waitPage = '/wait-page';
  static const suggestionsPage = '/suggestions-page';
  static const selectAddress = '/select-address';

  static const favorites = '/';

  static const profile = '/';
  static const registration = '/registration';
  static const loginByPhone = '/login-by-phone';
  static const confirmPhoneScreen = '/confirm-phone';
  static const settings = '/settings';
  static const notificationHistory = '/notification-history';
  static const historyOrders = '/history-orders';
  static const deliveryInformation = '/delivery-information';
  static const historyOrderDetail = '/history-order-detail';
  static const aboutDevelopers = '/about-developers';
  static const map = '/map';
  static const userInfo = '/user-info';
  static const noScreen = '/no-screen';
  static const aboutVersion = '/about-version';
  static const adminPanel = '/admin-panel';
  static const serverVersion = '/server-version';
  static const chooseCity = '/choose-city';
  static const searchPoint = '/search-point';
  static const searchShopPoint = '/search-shop-point';
  static const showCaseStories = '/show-case-stories';

  /// диплинки нужно что бы работало корректно
  static const deeplinkProduct = '/deeplink/product';
  static const deeplinkFilter = '/deeplink/filter';
  static const deeplinkCategory = '/deeplink/category/:id';
  static const deeplinkScreenShowCase = '/deeplink/screen/showcase';
  static const deeplinkScreenShowCatalog = '/deeplink/screen/catalog';
  static const deeplinkScreenShowBasket = '/deeplink/screen/basket';
  static const deeplinkScreenShowFavorites = '/deeplink/screen/favorites';
  static const deeplinkScreenShowProfile = '/deeplink/screen/profile';

  static const unauthorized = '/unauthorized';
}
