import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Đặt Xe Xanh - Di chuyển bền vững',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[600],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.eco,
              size: 100,
              color: Colors.white,
            ),
            SizedBox(height: 20),
            Text(
              'Xe Xanh',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Di chuyển bền vững',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white70,
              ),
            ),
            SizedBox(height: 50),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  void _login() {
    setState(() {
      _isLoading = true;
    });
    
    // Simulate login process
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.green[300]!, Colors.green[600]!],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.eco,
                  size: 80,
                  color: Colors.white,
                ),
                SizedBox(height: 20),
                Text(
                  'Đăng nhập Xe Xanh',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 40),
                TextField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    labelText: 'Số điện thoại',
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Mật khẩu',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: _isLoading
                        ? CircularProgressIndicator(color: Colors.green)
                        : Text(
                            'Đăng nhập',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                  ),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    // Navigate to register page
                  },
                  child: Text(
                    'Chưa có tài khoản? Đăng ký ngay',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    HomePage(),
    BookingPage(),
    HistoryPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            label: 'Đặt xe',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Lịch sử',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Cá nhân',
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Xe Xanh'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationPage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.green[400]!, Colors.green[50]!],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person, color: Colors.green),
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Xin chào!',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          Text(
                            'Nguyễn Văn A',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Di chuyển xanh - Bảo vệ môi trường',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Đặt xe điện hoặc hybrid với giá cả phải chăng. Giảm lượng khí thải carbon của bạn ngay hôm nay!',
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to booking page
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.green,
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Text(
                      'Đặt xe ngay',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            // Quick Actions
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dịch vụ nhanh',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildQuickAction(Icons.directions_car, 'Đặt xe', Colors.green),
                      _buildQuickAction(Icons.schedule, 'Đặt trước', Colors.blue),
                      _buildQuickAction(Icons.local_offer, 'Khuyến mãi', Colors.orange),
                      _buildQuickAction(Icons.support_agent, 'Hỗ trợ', Colors.purple),
                    ],
                  ),
                ],
              ),
            ),
            // Car Types Section
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Loại xe của chúng tôi',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        CarCard(
                          title: 'Xe điện cỡ nhỏ',
                          description: 'Phù hợp cho 4 người, tiết kiệm năng lượng',
                          price: '120.000đ/km',
                          icon: Icons.electric_car,
                          color: Colors.green,
                        ),
                        CarCard(
                          title: 'Xe Hybrid cỡ trung',
                          description: 'Tiện nghi cho 5 người, kết hợp điện-xăng',
                          price: '150.000đ/km',
                          icon: Icons.directions_car,
                          color: Colors.blue,
                        ),
                        CarCard(
                          title: 'Xe điện cỡ lớn',
                          description: 'Không gian rộng rãi cho 7 người',
                          price: '200.000đ/km',
                          icon: Icons.electric_car,
                          color: Colors.orange,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Stats Section
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Text(
                    'Thống kê môi trường',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStatItem('CO2 tiết kiệm', '1.2 tấn', Icons.eco),
                      _buildStatItem('Cây xanh', '15 cây', Icons.nature),
                      _buildStatItem('Chuyến đi', '47 chuyến', Icons.route),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickAction(IconData icon, String label, Color color) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Icon(icon, color: color, size: 30),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.green, size: 30),
        SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: Colors.grey[600]),
        ),
      ],
    );
  }
}

class CarCard extends StatelessWidget {
  final String title;
  final String description;
  final String price;
  final IconData icon;
  final Color color;

  CarCard({
    required this.title,
    required this.description,
    required this.price,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: EdgeInsets.only(right: 15),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: color, size: 30),
              ),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                description,
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
              SizedBox(height: 10),
              Text(
                price,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BookingPage extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final _fromController = TextEditingController();
  final _toController = TextEditingController();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
  String _selectedCarType = 'Xe điện cỡ nhỏ';
  String _selectedPaymentMethod = 'Tiền mặt';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đặt Xe'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Đặt xe dễ dàng',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            _buildLocationInput(),
            SizedBox(height: 20),
            _buildDateTimeInput(),
            SizedBox(height: 20),
            _buildCarTypeSelector(),
            SizedBox(height: 20),
            _buildPaymentMethodSelector(),
            SizedBox(height: 20),
            _buildPriceEstimate(),
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _bookRide,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Tìm xe',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationInput() {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.my_location, color: Colors.green),
              SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: _fromController,
                  decoration: InputDecoration(
                    hintText: 'Điểm đón',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
          Divider(),
          Row(
            children: [
              Icon(Icons.location_on, color: Colors.red),
              SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: _toController,
                  decoration: InputDecoration(
                    hintText: 'Điểm đến',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDateTimeInput() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _dateController,
            decoration: InputDecoration(
              labelText: 'Ngày đặt',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: Icon(Icons.calendar_today),
            ),
            readOnly: true,
            onTap: () async {
              DateTime? picked = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(Duration(days: 365)),
              );
              if (picked != null) {
                _dateController.text = "${picked.day}/${picked.month}/${picked.year}";
              }
            },
          ),
        ),
        SizedBox(width: 15),
        Expanded(
          child: TextField(
            controller: _timeController,
            decoration: InputDecoration(
              labelText: 'Giờ đón',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: Icon(Icons.access_time),
            ),
            readOnly: true,
            onTap: () async {
              TimeOfDay? picked = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              if (picked != null) {
                _timeController.text = "${picked.hour}:${picked.minute}";
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCarTypeSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Loại xe',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: DropdownButton<String>(
            value: _selectedCarType,
            isExpanded: true,
            underline: Container(),
            items: [
              'Xe điện cỡ nhỏ',
              'Xe Hybrid cỡ trung',
              'Xe điện cỡ lớn',
            ].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedCarType = newValue!;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentMethodSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Phương thức thanh toán',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: DropdownButton<String>(
            value: _selectedPaymentMethod,
            isExpanded: true,
            underline: Container(),
            items: [
              'Tiền mặt',
              'Thẻ tín dụng',
              'Ví điện tử',
              'Chuyển khoản',
            ].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedPaymentMethod = newValue!;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPriceEstimate() {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ước tính giá',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Giá cước:'),
              Text('150.000đ', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Phí dịch vụ:'),
              Text('15.000đ', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Tổng cộng:', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('165.000đ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
            ],
          ),
        ],
      ),
    );
  }

  void _bookRide() {
    if (_fromController.text.isEmpty || _toController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Vui lòng nhập đầy đủ thông tin!')),
      );
      return;
    }

    // Navigate to tracking page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TrackingPage()),
    );
  }
}

class TrackingPage extends StatefulWidget {
  @override
  _TrackingPageState createState() => _TrackingPageState();
}

class _TrackingPageState extends State<TrackingPage> {
  String _status = 'Đang tìm tài xế...';
  String _driverName = '';
  String _carNumber = '';
  String _driverPhone = '';

  @override
  void initState() {
    super.initState();
    _simulateBookingProcess();
  }

  void _simulateBookingProcess() {
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _status = 'Đã tìm thấy tài xế';
        _driverName = 'Nguyễn Văn B';
        _carNumber = '29A-12345';
        _driverPhone = '0901234567';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Theo dõi chuyến xe'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Text(
                    _status,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  if (_driverName.isNotEmpty) ...[
                    SizedBox(height: 20),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.green,
                          child: Icon(Icons.person, color: Colors.white),
                        ),
                        SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _driverName,
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text('Biển số: $_carNumber'),
                            Text('SĐT: $_driverPhone'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
            SizedBox(height: 20),
            if (_driverName.isNotEmpty) ...[
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Call driver
                      },
                      icon: Icon(Icons.call),
                      label: Text('Gọi tài xế'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Send message
                      },
                      icon: Icon(Icons.message),
                      label: Text('Nhắn tin'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RatingPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
                child: Text('Hoàn thành chuyến đi'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class RatingPage extends StatefulWidget {
  @override
  _RatingPageState createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  double _rating = 5.0;
  final _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đánh giá chuyến xe'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Đánh giá chuyến xe của bạn',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.green,
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nguyễn Văn B',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text('Biển số: 29A-12345'),
                          Text('Xe điện cỡ nhỏ'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Đánh giá của bạn',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  onPressed: () {
                    setState(() {
                      _rating = index + 1.0;
                    });
                  },
                  icon: Icon(
                    index < _rating ? Icons.star : Icons.star_border,
                    color: Colors.amber,
                    size: 40,
                  ),
                );
              }),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _commentController,
              decoration: InputDecoration(
                labelText: 'Nhận xét (tùy chọn)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'Chia sẻ trải nghiệm của bạn...',
              ),
              maxLines: 3,
            ),
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tổng cước phí:'),
                      Text('165.000đ', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Phương thức thanh toán:'),
                      Text('Tiền mặt', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Cảm ơn bạn đã đánh giá!')),
                  );
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Gửi đánh giá',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HistoryPage extends StatelessWidget {
  final List<Map<String, dynamic>> _trips = [
    {
      'date': '12/07/2025',
      'time': '14:30',
      'from': 'Quận 1, TP.HCM',
      'to': 'Quận 3, TP.HCM',
      'price': '165.000đ',
      'status': 'Hoàn thành',
      'driver': 'Nguyễn Văn B',
      'rating': 5.0,
    },
    {
      'date': '10/07/2025',
      'time': '09:15',
      'from': 'Quận 7, TP.HCM',
      'to': 'Quận 1, TP.HCM',
      'price': '180.000đ',
      'status': 'Hoàn thành',
      'driver': 'Trần Thị C',
      'rating': 4.5,
    },
    {
      'date': '08/07/2025',
      'time': '18:45',
      'from': 'Sân bay Tân Sơn Nhất',
      'to': 'Quận 2, TP.HCM',
      'price': '250.000đ',
      'status': 'Hoàn thành',
      'driver': 'Lê Văn D',
      'rating': 4.8,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lịch sử chuyến xe'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(20),
        itemCount: _trips.length,
        itemBuilder: (context, index) {
          final trip = _trips[index];
          return Card(
            margin: EdgeInsets.only(bottom: 15),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${trip['date']} - ${trip['time']}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.green[100],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          trip['status'],
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.my_location, color: Colors.green, size: 20),
                      SizedBox(width: 10),
                      Expanded(child: Text(trip['from'])),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.red, size: 20),
                      SizedBox(width: 10),
                      Expanded(child: Text(trip['to'])),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tài xế: ${trip['driver']}'),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 20),
                          SizedBox(width: 5),
                          Text(trip['rating'].toString()),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tổng cước: ${trip['price']}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Show trip details
                        },
                        child: Text('Chi tiết'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hồ sơ cá nhân'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.green,
                    child: Icon(Icons.person, color: Colors.white, size: 50),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Nguyễn Văn A',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '0901234567',
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStatItem('Chuyến đi', '47'),
                      _buildStatItem('Đánh giá', '4.8'),
                      _buildStatItem('Tiết kiệm CO2', '1.2 tấn'),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            _buildMenuItem(Icons.edit, 'Chỉnh sửa hồ sơ', () {}),
            _buildMenuItem(Icons.payment, 'Phương thức thanh toán', () {}),
            _buildMenuItem(Icons.local_offer, 'Khuyến mãi', () {}),
            _buildMenuItem(Icons.help, 'Trợ giúp', () {}),
            _buildMenuItem(Icons.privacy_tip, 'Chính sách bảo mật', () {}),
            _buildMenuItem(Icons.info, 'Giới thiệu', () {}),
            _buildMenuItem(Icons.logout, 'Đăng xuất', () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: Colors.grey[600]),
        ),
      ],
    );
  }

  Widget _buildMenuItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.green),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}

class NotificationPage extends StatelessWidget {
  final List<Map<String, dynamic>> _notifications = [
    {
      'title': 'Chuyến xe hoàn thành',
      'message': 'Chuyến xe từ Quận 1 đến Quận 3 đã hoàn thành thành công',
      'time': '2 giờ trước',
      'read': false,
    },
    {
      'title': 'Khuyến mãi đặc biệt',
      'message': 'Giảm 20% cho chuyến xe đầu tiên trong tuần này',
      'time': '1 ngày trước',
      'read': true,
    },
    {
      'title': 'Tài xế đang đến',
      'message': 'Tài xế Nguyễn Văn B đang trên đường đến điểm đón',
      'time': '3 ngày trước',
      'read': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thông báo'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(20),
        itemCount: _notifications.length,
        itemBuilder: (context, index) {
          final notification = _notifications[index];
          return Card(
            margin: EdgeInsets.only(bottom: 15),
            elevation: notification['read'] ? 1 : 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              leading: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: notification['read'] ? Colors.grey[200] : Colors.green[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.notifications,
                  color: notification['read'] ? Colors.grey : Colors.green,
                ),
              ),
              title: Text(
                notification['title'],
                style: TextStyle(
                  fontWeight: notification['read'] ? FontWeight.normal : FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(notification['message']),
                  SizedBox(height: 5),
                  Text(
                    notification['time'],
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
              trailing: !notification['read']
                  ? Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                    )
                  : null,
            ),
          );
        },
      ),
    );
  }
}