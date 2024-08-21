enum Gender {
  male(10),
  female(1),
  other(2),
  unknown(-1);

  const Gender(this.serverResponse);

  final int serverResponse;
}

enum LanguageCode {
  en(
    localeCode: 'en',
    value: 'EN',
  ),
  km(
    localeCode: 'km',
    value: 'KM',
  );

  const LanguageCode({
    required this.localeCode,
    required this.value,
  });

  final String localeCode;
  final String value;
}
