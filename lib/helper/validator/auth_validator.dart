abstract class ProductCardDelegate {
  void onCardChanged(String cardId);
}

final sharedProductCardHelper = ProductCardHelper();

class ProductCardHelper {
  ProductCardHelper._();

  static final ProductCardHelper _instance = ProductCardHelper._();

  factory ProductCardHelper() => _instance;

  ProductCardDelegate? delegate;

  void onCardChanged(String cardId) {
    delegate?.onCardChanged(cardId);
  }
}

abstract class CardNumberChangeObserveable {
  void addObserver(CardNumberChangeObserver observer);
  void removeObserver(CardNumberChangeObserver observer);
  void notifyCardNumberChange(String cardNumber);
}

abstract class CardNumberChangeObserver {
  void notifyChanged(String cardNumber);
}
