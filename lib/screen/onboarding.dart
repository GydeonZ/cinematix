import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:praktikum/provider/homescreen_provider.dart';
import 'package:praktikum/screen/home_screen.dart';
import 'package:provider/provider.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late HomeScreenProvider homeprovider;
  @override
  void initState() {
    super.initState();
    homeprovider = Provider.of<HomeScreenProvider>(context, listen: false);
    homeprovider.getCities();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(height: 25),
              Container(
                width: 300,
                height: 500,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: ClipRRect(
                  child: Image.asset(
                    'assets/images/onboarding.png',
                    width: double.infinity,
                    height: 350,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: const AlignmentDirectional(-1.00, 0.00),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                  child: Text(
                    'Temukan, Pesan, Rasakan',
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12, 4, 12, 0),
                child: SizedBox(
                  width: 325,
                  child: Text(
                    'Memesan tiket film bioskop favorit anda dengan mudah, cepat dan tanpa kerumitan',
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 315,
                height: 50,
                child: Consumer<HomeScreenProvider>(
                  builder: (context, provider, index) {
                    if (provider.isLoading) {
                      return ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffEF223B),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text('Mulai Sekarang',
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            )),
                      );
                    } else {
                      return ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  HomePage(data: provider.cities!.results[0]),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffEF223B),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text('Mulai Sekarang',
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            )),
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ));
  }
}

// return ElevatedButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) =>
//                                   HomePage(data: provider.cities!.results[0]),
//                             ),
//                           );
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: const Color(0xffEF223B),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                         ),
//                         child: Text('Mulai Sekarang',
//                             style: GoogleFonts.inter(
//                               color: Colors.white,
//                               fontWeight: FontWeight.w500,
//                               fontSize: 16,
//                             )),
//                       );