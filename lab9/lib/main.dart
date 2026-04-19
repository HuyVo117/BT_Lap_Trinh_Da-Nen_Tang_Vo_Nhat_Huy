import 'package:flutter/material.dart';
import 'weather_service.dart'; // Import file logic vừa tạo
import 'package:flutter_spinkit/flutter_spinkit.dart'; // Import loading

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}

// MÀN HÌNH 1: LOADING (Chờ lấy vị trí & dữ liệu)
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    // Gọi hàm lấy thời tiết từ file service
    var weatherData = await WeatherService().getLocationWeather();

    // Khi có dữ liệu, chuyển sang màn hình chính
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationWeather: weatherData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Center(
        child: SpinKitDoubleBounce( // Hiệu ứng loading đẹp mắt
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}

// MÀN HÌNH 2: HIỂN THỊ THỜI TIẾT
class LocationScreen extends StatefulWidget {
  final locationWeather;
  LocationScreen({this.locationWeather});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherService weatherService = WeatherService();
  int temperature = 0;
  String weatherIcon = '';
  String cityName = '';
  String weatherMessage = '';

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = 'Error';
        weatherMessage = 'Không lấy được dữ liệu';
        cityName = '';
        return;
      }
      // Parse dữ liệu JSON
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      var condition = weatherData['weather'][0]['id'];
      cityName = weatherData['name'];
      
      weatherIcon = weatherService.getWeatherIcon(condition);
      weatherMessage = weatherService.getMessage(temperature);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          // Nền Gradient sang trọng
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.purple.shade900, Colors.blue.shade900],
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Hàng nút bấm trên cùng
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var weatherData = await weatherService.getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: Icon(Icons.near_me, size: 50.0, color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {
                      // Chức năng tìm kiếm thành phố (có thể mở rộng sau)
                    },
                    child: Icon(Icons.location_city, size: 50.0, color: Colors.white),
                  ),
                ],
              ),
              
              // Hiển thị Nhiệt độ và Icon
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: TextStyle(
                        fontFamily: 'Spartan MB',
                        fontSize: 100.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      weatherIcon, // Icon mặt trời/mây...
                      style: TextStyle(fontSize: 100.0),
                    ),
                  ],
                ),
              ),
              
              // Hiển thị Lời khuyên và Tên thành phố
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  '$weatherMessage tại $cityName',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 50.0,
                    fontFamily: 'Spartan MB',
                    color: Colors.white70,
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}