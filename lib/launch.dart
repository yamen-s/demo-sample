import 'package:echo_cash/core/constants/app_constants.dart';
import 'package:echo_cash/core/constants/app_globals.dart';
import 'package:echo_cash/core/widgets/back_and_skip_button.dart';
import 'package:flutter/material.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {

  int _currentPage = 0;

  final PageController _pageController = PageController(initialPage: 0);
  
  List<Map<String, String>> slides = [
    {
      'title': "Easiest Way to Manage Your Wallet Manage Your Wallet",
      'description': "Automatically organizes your expenses and financial account and creates a budget So you can save more and more"
    },
    {
      'title': "Easiest Way to Manage Your Wallet",
      'description': "Automatically organizes your expenses and financial account and creates a budget So you can save more and more"
    },
    // Add more slides here
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('launch screen init state');
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        actions: [          
          Padding(
            padding: const EdgeInsets.only(right:20),
            child: SkipAndBackButtonWidget(
              child: TextButton(
                onPressed: (){
                  Navigator.of(context).pushNamed('register');
                },
                style: skipAndBackButtonStyleWhiteBg(),
                child: const Text(
                  "Skip",
                  style: backAndSkipButtonTextWhiteBgStyle
                ),
              ),
            ),
          )
        ],
      ),
      backgroundColor: whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // For the Logo
            Expanded(
              child: Image.asset('assets/images/logo_in_app_horizontal.png'),
            ),

            // For the PageView
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 200, // You can adjust this
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      children: List.generate(slides.length, (index) {
                        return buildTextPage(slides[index]['title']!, slides[index]['description']!, 24, 14);
                      }),
                    ),
                  ),
                  buildPageIndicator(),
                ],
              ),
            ),
            // Indicator
            
            
            // Space filler
            
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('register');
                },
                style: buttonStyleDarkBg(),
                child: const Text(
                  'Create an Account',
                  style: buttonTextDarkBgStyle 
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                style: buttonStyleWhiteBg(),
                onPressed: () {
                  Navigator.of(context).pushNamed('login');
                },
                child: const Text(
                  'Log In',
                  style: buttonTextWhiteBgStyle 
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextPage(String title, String description, double titleSize, double descriptionSize) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: headingStyle,
              ),
              const SizedBox(height: 20),
              Text(
                description,
                textAlign: TextAlign.center,
                style: descriptionStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        slides.length, // Use slides.length to match the number of slides in the PageView
        (index) => buildDot(index),
      ),
    );
  }

  Widget buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 6,
      width: 23,
      decoration: BoxDecoration(
        color: _currentPage == index ? secondaryColor :  greyColor,
        borderRadius: const BorderRadius.all(Radius.circular(50)),
      ),
    );
  }

}