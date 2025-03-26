import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:routiner/core/theme/app_colors.dart';
import 'package:routiner/core/theme/app_text_styles.dart';

import '../../../core/theme/app_dimensions.dart';
import '../auth/auth.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingPage> _pages = [
    OnboardingPage(
      title: 'Create',
      subtitle: 'Good Habits',
      description:
          'Change your life by slowly adding new healthy habits and sticking to them.',
      image: 'assets/images/onboarding_1.png',
    ),
    OnboardingPage(
      title: 'Track',
      subtitle: 'Your Progress',
      description:
          'Every day you become one step closer to your goal. Don\'t give up!',
      image: 'assets/images/onboarding_2.png',
    ),
    OnboardingPage(
      title: 'Stay Together',
      subtitle: 'and Strong',
      description:
          'Find friends to discuss common topics. Complete challenges together.',
      image: 'assets/images/onboarding_3.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            'assets/images/onboarding_background.svg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

          // Content overlay
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: _pages.length,
                    itemBuilder: (context, index) {
                      return _buildContent(_pages[index]);
                    },
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                  ),
                ),
                _buildBottomControls(),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(OnboardingPage page) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.marginLarge,
          vertical: AppDimensions.margin_64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            page.image,
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 0.5,
          ),
          Text(
            page.title,
            style: AppTextStyles.h1.copyWith(
              color: Colors.white,
              shadows: [
                Shadow(
                  offset: const Offset(1, 1),
                  blurRadius: 3.0,
                  color: Colors.black.withOpacity(0.5),
                ),
              ],
            ),
          ),
          Text(
            page.subtitle,
            style: AppTextStyles.h1.copyWith(
              color: Colors.white,
              shadows: [
                Shadow(
                  offset: const Offset(1, 1),
                  blurRadius: 3.0,
                  color: Colors.black.withOpacity(0.5),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            page.description,
            style: AppTextStyles.bodyMedium.copyWith(
              color: Colors.white,
              shadows: [
                Shadow(
                  offset: const Offset(1, 1),
                  blurRadius: 3.0,
                  color: Colors.black.withOpacity(0.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomControls() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: List.generate(
              _pages.length,
              (index) => _buildDot(index),
            ),
          ),
          // Skip button
          TextButton(
            onPressed: _completeOnboarding,
            child: Text(
              _currentPage == _pages.length - 1 ? 'Get started' : 'Skip',
              style: AppTextStyles.bodyLarge.copyWith(color: AppColors.white),
            ),
          ),

          // Dots indicator
        ],
      ),
    );
  }

  Widget _buildDot(int index) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == index ? AppColors.white : AppColors.blue60,
      ),
    );
  }

  void _completeOnboarding() async {
    // await PreferencesHelper.setFirstLaunchComplete();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const AuthScreen()),
    );
  }
}

class OnboardingPage {
  final String title;
  final String subtitle;
  final String description;
  final String image;

  OnboardingPage(
      {required this.title,
      required this.subtitle,
      required this.description,
      required this.image});
}
