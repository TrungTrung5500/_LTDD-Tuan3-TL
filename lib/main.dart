import 'dart:math'; // Để lấy màu ngẫu nhiên nếu cần
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Tắt chữ Debug ở góc
      title: 'Bài tập Tuần 3',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const MenuScreen(),
    );
  }
}

// --- MÀN HÌNH MENU CHÍNH (Để chọn bài tập) ---
class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bài tập Tuần 3")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const StudentInfoScreen()));
              },
              child: const Text("Xem Thông tin Sinh Viên"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const LecturerInfoScreen()));
              },
              child: const Text("Xem Thông tin Giảng Viên"),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// MÀN HÌNH 1: THÔNG TIN SINH VIÊN
// ==========================================
class StudentInfoScreen extends StatelessWidget {
  const StudentInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue, // Màu nền xanh
        foregroundColor: Colors.white, // Màu chữ trắng
        leading: const Icon(Icons.home), // Icon ngôi nhà bên trái
        title: const Text("Thông tin sinh viên"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 1. Ảnh đại diện
            const CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage("https://i.pravatar.cc/300?img=11"), // Ảnh mẫu từ mạng
            ),
            const SizedBox(height: 20),

            // 2. Các dòng thông tin
            // Họ tên (Màu xanh)
            const Text(
              "Họ và tên: Nguyễn Văn A",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            const SizedBox(height: 10),
            
            // Các thông tin khác (Màu đỏ)
            const Text("MSSV: 2001221234", style: TextStyle(fontSize: 16, color: Colors.red)),
            const SizedBox(height: 5),
            const Text("Lớp: 13DHTH02", style: TextStyle(fontSize: 16, color: Colors.red)),
            const SizedBox(height: 5),
            const Text("Khóa: 13 Đại học", style: TextStyle(fontSize: 16, color: Colors.red)),
            const SizedBox(height: 5),
            const Text("Ngành: Công nghệ thông tin", style: TextStyle(fontSize: 16, color: Colors.red)),
            const SizedBox(height: 20),

            // Trường (Màu đỏ, chữ to hơn chút)
            const Text(
              "Trường: Đại học Công Thương\nThành phố Hồ Chí Minh",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),
            ),
            
            const SizedBox(height: 40),

            // 3. Nút trở về
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Quay lại màn hình trước
              },
              child: const Text("Trở về"),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// MÀN HÌNH 2: THÔNG TIN GIẢNG VIÊN
// ==========================================
class LecturerInfoScreen extends StatelessWidget {
  const LecturerInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        leading: const Icon(Icons.home),
        title: const Text("Thông tin giảng viên"), // Sửa lại tiêu đề cho đúng
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 1. Ảnh đại diện
            const CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage("https://i.pravatar.cc/300?img=5"), // Ảnh nữ
            ),
            const SizedBox(height: 20),

            // 2. Tên giảng viên (Xanh đậm)
            const Text(
              "Giảng viên Trần Thị A",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            const SizedBox(height: 10),

            // Khoa (Đỏ)
            const Text("Khoa: Công nghệ Thông tin", style: TextStyle(fontSize: 16, color: Colors.red)),
            const SizedBox(height: 5),

            // Học hàm (Đỏ)
            const Text("Học hàm: Thạc sỹ", style: TextStyle(fontSize: 16, color: Colors.red)),
            const SizedBox(height: 5),

            // Chuyên ngành (Xanh lá)
            const Text(
              "Chuyên ngành: CNPM",
              style: TextStyle(fontSize: 16, color: Colors.green, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),

            // Giảng dạy (Xanh dương)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Giảng dạy: Nhập môn lập trình, Lập trình windows, Lập trình web...",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.blue),
              ),
            ),
            
            const SizedBox(height: 40),

            // 3. Nút trở về
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Trở về"),
            ),
          ],
        ),
      ),
    );
  }
}