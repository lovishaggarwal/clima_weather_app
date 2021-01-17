import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '89bf05e47144ad827a2e7e255db8916c';
const openWeatherURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper =
        NetworkHelper('$openWeatherURL?q=$cityName&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> locationWeather() async {
    Location location = Location();
    await location.gerCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int id) {
    if (id < 300) {
      return '🌩';
    } else if (id < 400) {
      return '🌧';
    } else if (id < 600) {
      return '☔️';
    } else if (id < 700) {
      return '☃️';
    } else if (id < 800) {
      return '🌫';
    } else if (id == 800) {
      return '☀️';
    } else if (id <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(double temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
