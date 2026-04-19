import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart'; // Import thư viện âm thanh

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  
  // Hàm xử lý phát âm thanh
  void playSound(int soundNumber) async {
    final player = AudioPlayer();
    // Lưu ý: file nhạc phải nằm trong thư mục 'assets'
    await player.play(AssetSource('note$soundNumber.wav'));
  }

  // Hàm xây dựng phím đàn (để không phải copy-paste code 7 lần)
  Expanded buildKey({required Color color, required int soundNumber, required String noteName}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0), // Tạo khoảng cách giữa các phím
        child: Material(
          color: Colors.transparent, // Để hiển thị màu của Container bên trong
          child: InkWell(
            borderRadius: BorderRadius.circular(50.0), // Hiệu ứng gợn sóng bo tròn
            enableFeedback: false, // Tắt âm thanh click mặc định của Android
            onTap: () {
              playSound(soundNumber);
            },
            child: Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(50.0), // Bo góc tạo hình viên thuốc
                boxShadow: [
                  BoxShadow(
                    color: color.withOpacity(0.6), // Hiệu ứng phát sáng Neon
                    blurRadius: 15.0,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  noteName,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black, // Nền đen để làm nổi bật màu Neon
        appBar: AppBar(
          title: Text('NEON XYLOPHONE', style: TextStyle(letterSpacing: 2.0, color: Colors.white)),
          backgroundColor: Colors.grey[900],
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Gọi hàm buildKey 7 lần với màu sắc và nốt nhạc khác nhau
              buildKey(color: Colors.redAccent, soundNumber: 1, noteName: 'DO'),
              buildKey(color: Colors.orangeAccent, soundNumber: 2, noteName: 'RE'),
              buildKey(color: Colors.yellowAccent, soundNumber: 3, noteName: 'MI'),
              buildKey(color: Colors.greenAccent, soundNumber: 4, noteName: 'FA'),
              buildKey(color: Colors.tealAccent, soundNumber: 5, noteName: 'SOL'),
              buildKey(color: Colors.blueAccent, soundNumber: 6, noteName: 'LA'),
              buildKey(color: Colors.purpleAccent, soundNumber: 7, noteName: 'SI'),
            ],
          ),
        ),
      ),
    );
  }
}