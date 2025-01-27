import 'package:flutter/material.dart';
import '../routes/app_routes.dart';
import 'package:trippr/widget/text.dart';
import 'package:trippr/models/intro_model.dart';
import 'package:animate_do/animate_do.dart';
import 'package:shape_of_view_null_safe/shape_of_view_null_safe.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  late final PageController pageController;
  int _currentPage = 0;

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        _currentPage = pageController.page!.round();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void _onLetsGoPressed() {
    if (_currentPage < introComponents.length - 1) {
      pageController.animateToPage(
        _currentPage + 1,
        duration: const Duration(milliseconds: 500),
        curve: Curves.linear,
      );
    } else {
      Navigator.pushReplacementNamed(context, AppRoutes.signIn);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 360;
    final isMediumScreen = size.width < 600;

    final titleSize = isSmallScreen ? 24.0 : (isMediumScreen ? 28.0 : 32.0);
    final subtitleSize = isSmallScreen ? 18.0 : (isMediumScreen ? 22.0 : 26.0);
    final descriptionSize = isSmallScreen ? 12.0 : (isMediumScreen ? 13.0 : 14.0);

    final horizontalPadding = size.width * 0.08;
    final verticalPadding = size.height * 0.02;
    final buttonHeight = size.height * 0.05;
    final buttonWidth = size.width * 0.4;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 243, 243, 243),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SizedBox(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              child: PageView.builder(
                controller: pageController,
                scrollDirection: Axis.vertical,
                itemCount: introComponents.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  IntroModel current = introComponents[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: horizontalPadding,
                            vertical: verticalPadding,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 9,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FadeInRight(
                                      child: AppText(
                                        text: current.title,
                                        size: titleSize,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(height: 8.0),
                                    FadeInLeft(
                                      child: AppText(
                                        text: current.subTitle,
                                        size: subtitleSize,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    const SizedBox(height: 16.0),
                                    FadeInUp(
                                      delay: const Duration(milliseconds: 400),
                                      child: AppText(
                                        text: current.description,
                                        size: descriptionSize,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w200,
                                      ),
                                    ),
                                    const SizedBox(height: 16.0),
                                    FadeInUpBig(
                                      duration: const Duration(milliseconds: 1100),
                                      child: SizedBox(
                                        width: buttonWidth,
                                        height: buttonHeight,
                                        child: MaterialButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                          color: Colors.deepPurpleAccent,
                                          onPressed: _onLetsGoPressed,
                                          child: AppText(
                                            text: "Let's Go",
                                            size: descriptionSize + 1,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                    3,
                                    (indexDots) => GestureDetector(
                                      onTap: () {
                                        pageController.animateToPage(
                                          indexDots,
                                          duration: const Duration(milliseconds: 500),
                                          curve: Curves.linear,
                                        );
                                      },
                                      child: AnimatedContainer(
                                        margin: EdgeInsets.only(
                                          bottom: size.height * 0.008,
                                        ),
                                        width: 8,
                                        height: index == indexDots ? 12 : 8,
                                        duration: const Duration(milliseconds: 200),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          color: index == indexDots
                                              ? Colors.deepPurpleAccent
                                              : const Color.fromARGB(255, 193, 170, 255),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: FadeInUpBig(
                          duration: const Duration(milliseconds: 1200),
                          child: ClipPath(
                            clipper: DiagonalClipper(),
                            child: Image(
                              image: AssetImage(current.imageUrl),
                              fit: BoxFit.cover,
                              height: constraints.maxHeight * 0.55,
                              width: constraints.maxWidth,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class DiagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0.0, size.height * 0.8); // Adjust the diagonal angle as needed
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}