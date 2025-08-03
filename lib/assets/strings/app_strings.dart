/// Строковые константы.
abstract class AppStrings {
  /// Онбординг.
  static const onboardingSkipButton = 'Пропустить';
  static const onboardingPage1Title = 'Добро пожаловать\nв Путеводитель';
  static const onboardingPage1Description =
      'Ищи новые локации и сохраняй\nсамые любимые.';
  static const onboardingPage2Title = 'Построй маршрут\nи отправляйся в путь';
  static const onboardingPage2Description =
      'Достигай цели максимально\nбыстро и комфортно.';
  static const onboardingPage3Title = 'Добавляй места,\nкоторые нашёл сам';
  static const onboardingPage3Description =
      'Делись самыми интересными\nи помоги нам стать лучше!';
  static const onboardingStartButton = 'На старт';

  /// Список мест.
  static const placesScreenAppBarTitle = 'Список интересных мест';
  static const placesScreenBottomNavPlaces = 'Карта';
  static const placesScreenBottomNavFavorites = 'Избранное';
  static const placesScreenBottomNavSettings = 'Настройки';

  /// Детали места.
  static const placeDetailsShareButton = 'Поделиться';
  static const placeDetailsShareText = 'Посмотри, какое интересное место:';
  static const placeDetailsFavoritesButton = 'В Избранное';
  static const placeDetailsInFavoritesButton = 'В Избранном';

  /// Типы мест
  static const placeTypeRestaurant = 'Ресторан';
  static const placeTypeCafe = 'Кафе';
  static const placeTypePark = 'Парк';
  static const placeTypeMuseum = 'Музей';
  static const placeTypeMonument = 'Памятник';
  static const placeTypeTheatre = 'Театр';
  static const placeTypeTemple = 'Храм';
  static const placeTypeHotel = 'Отель';
  static const placeTypeShopping = 'Магазин';
  static const placeTypeOther = 'Другое';

  /// Настройки
  static const settingsViewTutorial = 'Смотреть туториал';

  /// Поиск
  static const searchHint = 'Поиск';

  /// Снэк-бары для действий с карточкой.
  static const cardTapSnackbar = 'Тап по карточке';
  static const likeTapSnackbar = 'Лайк для';

  /// Загрузка, ошибки
  static const placesLoading = 'Загрузка';
  static const placesErrorTitle = 'Ошибка';
  static const placesErrorDescription =
      'Что то пошло не так \nПопробуйте позже.';
  static const noPhoto = 'Нет фото';
  static const searchEmptyTitle = 'Ничего не найдено.';
  static const searchEmptyDescription =
      'Попробуйте изменить параметры \nпоиска';
  static const noLocationPermission =
      'Разрешите геолокацию в настройках, чтобы карта работала точнее';
}
