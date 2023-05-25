abstract class Routes {
  // TODO: 语法表示什么意思
  Routes._();

  static const home = _Paths.home;
  static const profile = _Paths.profile;
  static const category = _Paths.category;
  static const cart = _Paths.cart;
}

abstract class _Paths {
  _Paths._();

  static const home = '/';
  static const profile = '/profile';
  static const category = '/category';
  static const cart = '/cart';
}
