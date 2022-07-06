enum ServiceType {
  news,
  weather,
}

extension ServicesExtension on ServiceType {
  bool get isNews => this == ServiceType.news;
  bool get isWeather => this == ServiceType.weather;

  String get name {
    switch (this) {
      case ServiceType.weather:
        return 'Weather';
      case ServiceType.news:
        return 'News';
    }
  }

  String get icon {
    switch (this) {
      case ServiceType.news:
        return 'assets/images/news.png';
      case ServiceType.weather:
        return 'assets/images/weather.png';
    }
  }
}
