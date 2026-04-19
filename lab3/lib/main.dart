import 'package:flutter/material.dart';
import 'dart:math'; // Thư viện để sinh số ngẫu nhiên

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DicePage(),
    ),
  );
}

// Chuyển sang dùng StatefulWidget vì giao diện cần thay đổi (xúc xắc thay đổi)
class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  // Khai báo biến trạng thái cho 2 xúc xắc
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  // Hàm thay đổi mặt xúc xắc ngẫu nhiên
  void rollDice() {
    setState(() {
      // Random().nextInt(6) trả về từ 0-5, nên cần cộng thêm 1 để thành 1-6
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Không dùng màu đơn sắc, dùng Gradient (Màu chuyển) cho nền
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.indigo.shade900, Colors.purple.shade900], // Xanh tím vũ trụ
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Tiêu đề ứng dụng
              Text(
                'LUCKY DICE',
                style: TextStyle(
                  fontFamily: 'Pacifico', // Hoặc font mặc định nếu chưa cài
                  fontSize: 40.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.5,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.purpleAccent,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
              ),
              
              SizedBox(height: 50.0),

              // Khu vực hiển thị 2 xúc xắc
              Row(
                children: <Widget>[
                  // Xúc xắc trái
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: GestureDetector(
                        onTap: rollDice, // Nhấn vào xúc xắc cũng rung
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black45,
                                blurRadius: 15.0,
                                offset: Offset(5, 5),
                              ),
                            ],
                          ),
                          child: Image.asset('images/$leftDiceNumber.png'),
                        ),
                      ),
                    ),
                  ),
                  
                  // Xúc xắc phải
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: GestureDetector(
                        onTap: rollDice,
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black45,
                                blurRadius: 15.0,
                                offset: Offset(5, 5),
                              ),
                            ],
                          ),
                          child: Image.asset('images/$rightDiceNumber.png'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 60.0),

              // Nút bấm "ROLL IT" riêng biệt
              ElevatedButton.icon(
                onPressed: rollDice,
                icon: Icon(Icons.casino, size: 28),
                label: Text(
                  'ROLL IT!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber, // Màu nút nổi bật
                  foregroundColor: Colors.black, // Màu chữ
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  elevation: 10.0, // Đổ bóng cho nút
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}