import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Bài tập Tuần 3',
    home: MenuScreen(),
  ));
}

// ==========================================
// MÀN HÌNH MENU CHÍNH
// ==========================================
class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bài tập Tuần 3 - Tổng hợp")),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("DANH SÁCH BÀI TẬP", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue)),
              const SizedBox(height: 20),
              
              // Nút Bài 1
              _buildMenuButton(context, "Bài 1: Sinh Viên", const ManHinhSinhVien(), Colors.blue),
              _buildMenuButton(context, "Bài 1: Giảng Viên", const ManHinhGiangVien(), Colors.blue),
              
              const SizedBox(height: 10),
              
              // Nút Bài 2
              _buildMenuButton(context, "Bài 2: Chi tiết Đồ Án", const ManHinhDoAn(), Colors.orange),

              const SizedBox(height: 10),

              // Nút Bài 3 (MỚI)
              _buildMenuButton(context, "Bài 3: Chi tiết Sản Phẩm", const ManHinhSanPham(), Colors.redAccent),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context, String label, Widget screen, Color color) {
    return Container(
      width: 280,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 15),
        ),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => screen)),
        child: Text(label, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}

// ==========================================
// BÀI 3: MÀN HÌNH CHI TIẾT SẢN PHẨM (MỚI)
// ==========================================
class ManHinhSanPham extends StatelessWidget {
  const ManHinhSanPham({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chi tiết Sản Phẩm"),
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart)), // Icon giỏ hàng
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. SLIDER 3 HÌNH ẢNH (Dùng PageView để lướt)
            SizedBox(
              height: 300, // Chiều cao khung ảnh
              child: PageView(
                children: [
                  Image.network("https://picsum.photos/id/1/600/400", fit: BoxFit.cover), // Hình 1 (Laptop)
                  Image.network("https://picsum.photos/id/2/600/400", fit: BoxFit.cover), // Hình 2
                  Image.network("https://picsum.photos/id/3/600/400", fit: BoxFit.cover), // Hình 3
                ],
              ),
            ),
            
            // Chú thích nhỏ dưới ảnh
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8),
              color: Colors.grey[200],
              child: const Text("Vuốt sang trái để xem thêm ảnh (1/3)", style: TextStyle(color: Colors.grey)),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 2. Tên và Giá
                  const Text(
                    "Laptop Gaming MacBook Pro M3 Max 16 inch",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "89.990.000 đ",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                  
                  const SizedBox(height: 20),
                  const Divider(),

                  // 3. Thông tin chi tiết (Mã, Hãng)
                  _buildDetailRow("Mã sản phẩm:", "SP_APPLE_001"),
                  _buildDetailRow("Nhà sản xuất:", "Apple Inc."),
                  _buildDetailRow("Tình trạng:", "Mới 100% - Fullbox"),

                  const Divider(),
                  const SizedBox(height: 10),

                  // 4. Mô tả sản phẩm
                  const Text("Mô tả sản phẩm:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  const Text(
                    "Chip Apple M3 Max với CPU 14 lõi, GPU 30 lõi và Neural Engine 16 lõi.\n"
                    "Bộ nhớ thống nhất 36GB.\n"
                    "Ổ lưu trữ SSD 1TB.\n"
                    "Màn hình Liquid Retina XDR 14 inch.\n"
                    "Ba cổng Thunderbolt 4, cổng HDMI, khe thẻ nhớ SDXC, giắc cắm tai nghe, cổng MagSafe 3.\n"
                    "Bàn phím Magic Keyboard có Touch ID.\n"
                    "Bàn di chuột Force Touch.",
                    style: TextStyle(fontSize: 16, height: 1.5, color: Colors.black87),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // Nút đặt mua ở dưới cùng
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.redAccent,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 15),
          ),
          onPressed: () {},
          child: const Text("MUA NGAY", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 16, color: Colors.grey)),
          Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

// ==========================================
// (CODE CŨ) BÀI 1A: SINH VIÊN
// ==========================================
class ManHinhSinhVien extends StatelessWidget {
  const ManHinhSinhVien({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Thông tin Sinh Viên"), backgroundColor: Colors.blue, foregroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const CircleAvatar(radius: 60, backgroundImage: NetworkImage("https://i.pravatar.cc/300?img=12")),
            const SizedBox(height: 10),
            const Text("Nguyễn Văn A", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue)),
            const Divider(),
            const Text("MSSV: 20012345", style: TextStyle(fontSize: 18)),
            const Text("Lớp: 13DHTH02", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// (CODE CŨ) BÀI 1B: GIẢNG VIÊN
// ==========================================
class ManHinhGiangVien extends StatelessWidget {
  const ManHinhGiangVien({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Thông tin Giảng Viên"), backgroundColor: Colors.blue, foregroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const CircleAvatar(radius: 60, backgroundImage: NetworkImage("https://i.pravatar.cc/300?img=5")),
            const SizedBox(height: 10),
            const Text("GV. Trần Thị B", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue)),
            const Divider(),
            const Text("Khoa: CNTT", style: TextStyle(fontSize: 18)),
            const Text("Chuyên ngành: CNPM", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// (CODE CŨ) BÀI 2: ĐỒ ÁN
// ==========================================
class ManHinhDoAn extends StatelessWidget {
  const ManHinhDoAn({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chi tiết Đồ Án"), backgroundColor: Colors.orange, foregroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Xây dựng App Bán Hàng", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const Divider(),
            const Text("GVHD: ThS. Nguyễn Văn C"),
            const Text("Sinh viên thực hiện: 2"),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              color: Colors.orange[50],
              child: const Text("Yêu cầu: Sử dụng Flutter, Firebase, thiết kế giao diện đẹp."),
            )
          ],
        ),
      ),
    );
  }
}