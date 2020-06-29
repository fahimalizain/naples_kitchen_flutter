import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../widgets/WeatherIconMapper.dart';

class Weather with ChangeNotifier {
  String cityName;
  String description;
  String iconCode;

  double temperature;

  Weather({
    this.description,
    this.iconCode,
    this.cityName,
    this.temperature,
  });
 Future getWeather() async {
    http.Response response = await http.get(
        "http://api.openweathermap.org/data/2.5/weather?q=calicut&appid=cc48676bb91300c20b52abe120653cfa");
    var results = jsonDecode(response.body);
     var kelvin = results['main']['temp'];
         temperature = kelvin - 273.15;
        iconCode = results['weather'][0]['icon']; 
        description = results['weather'][0]['description']; 
        
      notifyListeners();
    // print(description);
      return temperature;
 
     
   
 
  }





IconData getIconData(){
    switch(iconCode){
      case '01d': return WeatherIcons.clear_day;
      case '01n': return WeatherIcons.clear_night;
      case '02d': return WeatherIcons.few_clouds_day;
      case '02n': return WeatherIcons.few_clouds_day;
      case '03d':
      case '04d':
        return WeatherIcons.clouds_day;
      case '03n':
      case '04n':
        return WeatherIcons.clear_night;
      case '09d': return WeatherIcons.shower_rain_day;
      case '09n': return WeatherIcons.shower_rain_night;
      case '10d': return WeatherIcons.rain_day;
      case '10n': return WeatherIcons.rain_night;
      case '11d': return WeatherIcons.thunder_storm_day;
      case '11n': return WeatherIcons.thunder_storm_night;
      case '13d': return WeatherIcons.snow_day;
      case '13n': return WeatherIcons.snow_night;
      case '50d': return WeatherIcons.mist_day;
      case '50n': return WeatherIcons.mist_night;
      default: return WeatherIcons.clear_day;
    }
  }}








