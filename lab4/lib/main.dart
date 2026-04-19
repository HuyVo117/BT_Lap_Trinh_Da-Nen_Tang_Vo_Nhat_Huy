import 'package:flutter/material.dart';
import 'dart:math'; // Thư viện để Random

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BallPage(),
      ),
    );

// Sử dụng StatefulWidget vì hình ảnh quả cầu cần thay đổi
class BallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. Tạo nền Gradient màu đại dương huyền bí
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade900, Colors.teal.shade800],
          ),
        ),
        child: Ball(),
      ),
    );
  }
}

class Ball extends StatefulWidget {
  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ballNumber = 1; // Trạng thái ban đầu là hình ball1.png

  // Hàm xử lý khi nhấn vào quả cầu
  void askQuestion() {
    setState(() {
      // Random từ 1 đến 5 (tương ứng với 5 ảnh)
      ballNumber = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Tiêu đề
          Text(
            'HỎI TÔI BẤT CỨ ĐIỀU GÌ',
            style: TextStyle(
              fontFamily: 'Source Sans Pro',
              fontSize: 30.0,
              color: Colors.white70,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
            ),
          ),
          
          SizedBox(height: 20.0),
          
          // Đường kẻ trang trí
          SizedBox(
            width: 150,
            child: Divider(color: Colors.teal.shade200, thickness: 1),
          ),

          SizedBox(height: 50.0),

          // Khu vực hiển thị quả cầu
          TextButton(
            onPressed: () {
              askQuestion();
              print('I got clicked! Ball number: $ballNumber');
            },
            child: Container(
              // Thêm hiệu ứng đổ bóng để quả cầu trông nổi bật hơn
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    blurRadius: 20.0,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: Image.asset('images/ball$ballNumber.png'),
            ),
          ),
        ],
      ),
    );
  }
}