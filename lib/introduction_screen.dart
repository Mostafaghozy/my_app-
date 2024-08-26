import 'package:flutter/material.dart';
import 'package:first_app/Auth/login_screen.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'my_app',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        leading: Icon(Icons.menu),
        iconTheme: IconThemeData(size: 30, color: Colors.black),
        actions: [
          Icon(Icons.notifications_active),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 80, 12, 12),
        child: IntroductionScreen(
          pages: _getPages(),
          dotsDecorator: DotsDecorator(
            size: Size(15, 15),
            color: Colors.blue,
            activeSize: Size.square(20),
            activeColor: Colors.red,
          ),
          showDoneButton: true,
          done: Text('Done', style: TextStyle(fontSize: 20)),
          showSkipButton: true,
          skip: Text('Skip', style: TextStyle(fontSize: 20)),
          showNextButton: true,
          next: Icon(Icons.arrow_forward, size: 25),
          onDone: () => _onDone(context),
          curve: Curves.bounceOut,
        ),
      ),
    );
  }

  List<PageViewModel> _getPages() {
    return [
      PageViewModel(
        title: "Illuminate your natural beauty with our vibrant colors",
        body: '',
        image: Center(
          child: Image.asset('assets/images/makeup1.png'),
        ),
        decoration: PageDecoration(
          titleTextStyle: TextStyle(fontSize: 30),
        ),
      ),
      PageViewModel(
        title: 'Shine with confidence in every moment',
        body: '',
        image: Center(
          child: Image.asset('assets/images/makeup2.png'),
        ),
        decoration: PageDecoration(
          titleTextStyle: TextStyle(fontSize: 30),
        ),
      ),
      PageViewModel(
        title: 'Designed for the way you live',
        body: '',
        image: Center(
          child: Image.asset('assets/images/phone1.png'),
        ),
        decoration: PageDecoration(
          titleTextStyle: TextStyle(fontSize: 30),
        ),
      ),
      PageViewModel(
        title: 'Sleek design, powerful performance',
        body: '',
        image: Center(
          child: Image.asset('assets/images/phone2.png'),
        ),
        decoration: PageDecoration(
          titleTextStyle: TextStyle(fontSize: 30),
        ),
      ),
    ];
  }

  void _onDone(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('ON_BOARDING', false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }
}
