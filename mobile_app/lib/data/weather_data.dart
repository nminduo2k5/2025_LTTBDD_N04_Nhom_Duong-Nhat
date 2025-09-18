import '../models/weather.dart';

class WeatherData {
  static final Map<String, Weather> _vietnamCities = {
    'Hà Nội': Weather(
      city: 'Hà Nội',
      country: 'Việt Nam',
      temperature: 28.5,
      description: 'Có mây',
      icon: '02d.png',
      humidity: 75,
      windSpeed: 12.5,
      date: DateTime.now(),
    ),
    'Hồ Chí Minh': Weather(
      city: 'Hồ Chí Minh',
      country: 'Việt Nam',
      temperature: 32.0,
      description: 'Nắng',
      icon: '01d.png',
      humidity: 68,
      windSpeed: 8.2,
      date: DateTime.now(),
    ),
    'Đà Nẵng': Weather(
      city: 'Đà Nẵng',
      country: 'Việt Nam',
      temperature: 30.2,
      description: 'Mưa nhẹ',
      icon: '10d.png',
      humidity: 82,
      windSpeed: 15.3,
      date: DateTime.now(),
    ),
    'Hải Phòng': Weather(
      city: 'Hải Phòng',
      country: 'Việt Nam',
      temperature: 27.8,
      description: 'Nhiều mây',
      icon: '04d.png',
      humidity: 78,
      windSpeed: 18.7,
      date: DateTime.now(),
    ),
    'Cần Thơ': Weather(
      city: 'Cần Thơ',
      country: 'Việt Nam',
      temperature: 31.5,
      description: 'Nắng ít mây',
      icon: '02d.png',
      humidity: 70,
      windSpeed: 6.8,
      date: DateTime.now(),
    ),
    'Nha Trang': Weather(
      city: 'Nha Trang',
      country: 'Việt Nam',
      temperature: 29.3,
      description: 'Nắng',
      icon: '01d.png',
      humidity: 65,
      windSpeed: 11.2,
      date: DateTime.now(),
    ),
  };

  static List<String> get cities => _vietnamCities.keys.toList();

  static Weather? getWeatherByCity(String city) {
    return _vietnamCities[city];
  }

  static List<WeatherForecast> getForecast(String city) {
    final baseTemp = _vietnamCities[city]?.temperature ?? 30.0;
    return List.generate(7, (index) {
      final date = DateTime.now().add(Duration(days: index + 1));
      final tempVariation = (index % 3 - 1) * 2.0;
      return WeatherForecast(
        date: date,
        maxTemp: baseTemp + tempVariation + 2,
        minTemp: baseTemp + tempVariation - 3,
        description: _getRandomDescription(),
        icon: _getRandomIcon(),
      );
    });
  }

  static String _getRandomDescription() {
    final descriptions = ['Nắng', 'Có mây', 'Mưa nhẹ', 'Nhiều mây', 'Nắng ít mây'];
    return descriptions[DateTime.now().millisecond % descriptions.length];
  }

  static String _getRandomIcon() {
    final icons = ['01d.png', '02d.png', '03d.png', '04d.png', '10d.png'];
    return icons[DateTime.now().millisecond % icons.length];
  }
}