class CountryModel {
  static List<Country> items=[];
}

class Country {
  final String name;
  final String countryCode;

  Country({
      required this.name,
      required this.countryCode,});

  factory Country.fromMap(Map<String, dynamic> map) {
    return Country(
      name: map["name"],
      countryCode: map["countryCode"],
    );
  }

  toMap() => {
        "name": name,
        "countryCode": countryCode,
      };
}
