import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Tắt chữ DEBUG ở góc phải
      home: Scaffold(
        // 1. THAY ĐỔI MÀU NỀN: Dùng màu xanh teal đậm
        backgroundColor: Colors.teal[900],
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // 2. THAY ĐỔI AVATAR: Hình vuông bo góc có viền
              Container(
                width: 120.0,
                height: 120.0,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle, // Hình chữ nhật/vuông
                  borderRadius: BorderRadius.circular(20.0), // Bo góc mềm mại
                  border: Border.all(
                    color: Colors.orangeAccent, // Viền màu cam nhạt
                    width: 3.0,
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('images/Doro.png'),
                  ),
                ),
              ),
              
              SizedBox(height: 20.0),

              // 3. TÊN: Đổi font và màu sắc
              Text(
                'Võ Nhật Huy',
                style: TextStyle(
                  fontFamily: 'Serif', // Dùng font có chân mặc định
                  fontSize: 35.0,
                  color: Colors.orangeAccent, // Màu chữ cam nhạt
                  fontWeight: FontWeight.bold,
                ),
              ),
              
              // NGHỀ NGHIỆP
              Text(
                'MOBILE DEVELOPER',
                style: TextStyle(
                  color: Colors.teal[100], // Màu teal nhạt
                  fontSize: 18.0,
                  letterSpacing: 4.0, // Giãn chữ rộng ra cho hiện đại
                  fontWeight: FontWeight.w500,
                ),
              ),
              
              SizedBox(
                height: 20.0,
                width: 200.0,
                child: Divider(
                  color: Colors.orangeAccent, // Đường kẻ màu cam nhạt
                ),
              ),
              
              // 4. THẺ SỐ ĐIỆN THOẠI
              Card(
                // Đổi hình dạng thẻ: Bo góc tròn hơn
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.white, // Nền thẻ màu trắng
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.phone_iphone, // Icon điện thoại hiện đại hơn
                    color: Colors.black87,
                    size: 30.0,
                  ),
                  title: Text(
                    '+84 369740701',
                    style: TextStyle(
                      color: Colors.black87,
                      fontFamily: 'Source Sans Pro',
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              
              // 5. THẺ EMAIL
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.mail_outline, // Icon thư rỗng ruột
                    color: Colors.black87,
                    size: 30.0,
                  ),
                  title: Text(
                    'huyvn.23ite@vku.udn.vn',
                    style: TextStyle(
                      color: Colors.black87,
                      fontFamily: 'Source Sans Pro',
                      fontSize: 18.0, // Chỉnh nhỏ xíu để vừa email dài
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}