import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // Để xử lý dữ liệu JSON trả về

class WeatherService {
  // Thay API KEY của bạn vào đây nhé!
  final String apiKey = '611e1d9c581dba63c147a944f732d3ee'; 
  final String openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

  // 1. Hàm lấy vị trí hiện tại
  Future<Position> getCurrentLocation() async {
    // Kiểm tra quyền truy cập vị trí
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    // Lấy tọa độ (độ chính xác thấp để tiết kiệm pin và nhanh hơn)
    return await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(accuracy: LocationAccuracy.low),
    );
  }

  // 2. Hàm lấy thời tiết từ tọa độ
  Future<dynamic> getLocationWeather() async {
    Position position = await getCurrentLocation();
    
    // Gọi API kèm theo toạ độ (lat, lon) và api key
    String url = '$openWeatherMapURL?lat=${position.latitude}&lon=${position.longitude}&appid=$apiKey&units=metric';
    
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body); // Trả về dữ liệu JSON
    } else {
      print(response.statusCode);
      return null; // Lỗi
    }
  }

  // 3. Hàm lấy icon thời tiết dựa trên ID (từ tài liệu OpenWeatherMap)
  String getWeatherIcon(int condition) {
    if (condition < 300) return '🌩';
    if (condition < 400) return '🌧';
    if (condition < 600) return '☔️';
    if (condition < 700) return '☃️';
    if (condition < 800) return '🌫';
    if (condition == 800) return '☀️';
    if (condition <= 804) return '☁️';
    return '🤷‍';
  }

  // 4. Hàm đưa ra lời khuyên dựa trên nhiệt độ
  String getMessage(int temp) {
    if (temp > 25) return 'Nên ăn kem 🍦';
    if (temp > 20) return 'Mặc áo thun là ổn 👕';
    if (temp < 10) return 'Cần khăn quàng cổ 🧣';
    return 'Nhớ mang áo khoác 🧥';
  }
}