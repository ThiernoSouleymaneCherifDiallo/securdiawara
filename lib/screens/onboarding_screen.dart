import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:my_app/models/onboarding_content.dart';
import 'package:my_app/screens/auth_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _controller;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void navigateToAuth() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const AuthScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Nouveau fond avec dégradé subtil
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0xFF094FC6).withOpacity(0.1),  // Couleur principale avec opacité
                  Colors.white,
                  Colors.white,
                  const Color(0xFF094FC6).withOpacity(0.05),  // Très légère teinte en bas
                ],
                stops: const [0.0, 0.3, 0.7, 1.0],  // Contrôle la distribution du dégradé
              ),
            ),
          ),
          
          // Motif décoratif en haut (optionnel)
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    const Color(0xFF094FC6).withOpacity(0.1),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // Bouton Passer avec meilleur positionnement et style
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            right: 20,
            child: TextButton(
              onPressed: navigateToAuth,
              style: TextButton.styleFrom(
                foregroundColor: const Color(0xFF094FC6),
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 5,
                ),
              ),
              child: const Text(
                'Passer',
                style: TextStyle(
                  color: Color(0xFF094FC6),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: contents.length,
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FadeInDown(
                            duration: const Duration(milliseconds: 500),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFF094FC6).withOpacity(0.2),
                                    blurRadius: 20,
                                    offset: const Offset(0, 10),
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.asset(
                                  contents[i].image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 50),
                          FadeInUp(
                            duration: const Duration(milliseconds: 500),
                            delay: const Duration(milliseconds: 200),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                contents[i].title,
                                style: const TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF094FC6),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          FadeInUp(
                            duration: const Duration(milliseconds: 500),
                            delay: const Duration(milliseconds: 400),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                contents[i].description,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey.shade700,
                                  height: 1.5,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                margin: const EdgeInsets.only(bottom: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: List.generate(
                        contents.length,
                        (index) => Container(
                          margin: const EdgeInsets.only(right: 8),
                          height: 10,
                          width: currentPage == index ? 25 : 10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: currentPage == index
                                ? const Color(0xFF094FC6)
                                : const Color(0xFF094FC6).withOpacity(0.2),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF094FC6), Color(0xFF0A3A8B)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF094FC6).withOpacity(0.3),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          if (currentPage == contents.length - 1) {
                            navigateToAuth();
                          } else {
                            _controller.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 15,
                          ),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text(
                          currentPage == contents.length - 1
                              ? "Commencer"
                              : "Suivant",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Placeholder pour votre écran principal
class YourMainScreen extends StatelessWidget {
  const YourMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Écran Principal'),
      ),
    );
  }
} 