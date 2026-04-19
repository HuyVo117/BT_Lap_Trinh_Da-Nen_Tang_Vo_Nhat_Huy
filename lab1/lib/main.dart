import 'package:flutter/material.dart';

// Hàm main là điểm bắt đầu của ứng dụng
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        // Màu nền của ứng dụng (có thể đổi thành màu khác tùy thích)
        backgroundColor: Colors.black87,
        
        // Thanh tiêu đề phía trên (AppBar)
        appBar: AppBar(
          title: Center(
            child: Text(
              'ARKNIGHT ENDFILED', 
              style: TextStyle(color: Colors.white),
            ),
          ),
          backgroundColor: Colors.green, // Màu mới cho AppBar
        ),
        
        // Phần thân ứng dụng: Hiển thị hình ảnh ở giữa
        body: Center(
          child: Image(
            image: AssetImage('images/1.png'),
          ),
        ),
      ),
    ),
  );
}