import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../services/api_helper.dart';
import '../models/weather.dart';

final getWeatherByCityName = FutureProvider.autoDispose
    .family<Weather, String>((ref, String cityName) async {
  return ApiHelper.getWeatherByCityName(cityName: cityName);
});
