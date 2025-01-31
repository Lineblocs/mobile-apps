import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lineblocs/screen/dashboard.dart';
import 'package:lineblocs/utils/app_colors.dart';
import 'package:lineblocs/utils/app_font.dart';
import 'package:sizer/sizer.dart';

import '../../utils/assets_images.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      "image": AppImages.chat, // Replace with your image path
      "title": "HD Audio",
      "description": "Experience high-quality voice calling.",
    },
    {
      "image": AppImages.call,
      "title": "Connect with Groups",
      "description": "Stay connected with friends, family, or colleagues.",
    },
    {
      "image": AppImages.image1,
      "title": "Secure & Private",
      "description": "Your calls are protected with end-to-end encryption.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemCount: _onboardingData.length,
              itemBuilder: (context, index) {
                return _buildPageContent(
                  _onboardingData[index]["image"]!,
                  _onboardingData[index]["title"]!,
                  _onboardingData[index]["description"]!,
                );
              },
            ),
          ),
          _buildBottomNavigation(),
        ],
      ),
    );
  }

  Widget _buildPageContent(String image, String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, height: 250), // Onboarding image
          const SizedBox(height: 30),
          Text(
            title,
            style: AppFonts.boldTextStyle(color: AppColor.black,fontSize: 8.w),
            textAlign: TextAlign.center
          ),
          const SizedBox(height: 15),
          Text(
            description,
            style: AppFonts.regularTextStyle(color: AppColor.grey,fontSize: 4.w),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _onboardingData.length,
                  (index) => _buildDot(index),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  // Skip to the last screen
                  _pageController.jumpToPage(_onboardingData.length - 1);
                },
                child: Text(
                  'Skip',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_currentIndex == _onboardingData.length - 1) {
                    Navigator.pushReplacementNamed(context, '/dashboard');
                    // Navigator.pushReplacement(context,
                    //     MaterialPageRoute(builder: (context) =>  DashboardScreen()));
                  } else {
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                child: Text(
                  _currentIndex == _onboardingData.length - 1
                      ? 'Get Started'
                      : 'Next',
                ),
                style: ElevatedButton.styleFrom(
                  padding:
                  EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDot(int index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: 8,
      width: _currentIndex == index ? 24 : 8,
      decoration: BoxDecoration(
        color: _currentIndex == index ? Color(0xFF00D26A) : Colors.grey,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
