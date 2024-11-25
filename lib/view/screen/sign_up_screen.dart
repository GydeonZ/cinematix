import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uts/view/screen/food_menu.dart';
import 'package:uts/view/screen/login_screen.dart';
import 'package:uts/view/widget/login_signup.dart';
import 'package:uts/viewmodel/homescreen_provider.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _userNameTextController = TextEditingController();
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 24,
        ),
        title: Align(
          alignment: const AlignmentDirectional(-1.10, 0.00),
          child: Text(
            'Daftar',
            style: GoogleFonts.inter(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        centerTitle: false,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Opacity(opacity: 0),
            const SizedBox(height: 35),
            Align(
              alignment: const AlignmentDirectional(0, 0),
              child: Text(
                'Buat Akun Baru',
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              'Silahkan daftar akun anda terlebih dahulu',
              style: GoogleFonts.readexPro(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
              child: Column(
                children: [
                  Align(
                    alignment: const AlignmentDirectional(-1.00, 0.00),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(15, 0, 0, 5),
                      child: Text(
                        'Nama Lengkap',
                        style: GoogleFonts.readexPro(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  reusableTextField(
                      'Masukkan Nama Kamu', false, _userNameTextController),
                  const SizedBox(height: 30),
                  Align(
                    alignment: const AlignmentDirectional(-1.00, 0.00),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(15, 0, 0, 5),
                      child: Text(
                        'Email',
                        style: GoogleFonts.readexPro(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  reusableTextField(
                      'Masukkan Email Kamu', false, _emailTextController),
                  const SizedBox(height: 30),
                  Align(
                    alignment: const AlignmentDirectional(-1.00, 0.00),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(15, 0, 0, 5),
                      child: Text(
                        'Password',
                        style: GoogleFonts.readexPro(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  reusableTextField(
                      'Masukkan Password Kamu', true, _passwordTextController),
                  const SizedBox(height: 40),
                  signInSignUpButton(context, false, () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FoodPage()));
                  })
                ],
              ),
            ),
            const SizedBox(height: 25),
            Align(
              alignment: const AlignmentDirectional(0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                      child: Text(
                        'Sudah punya akun?',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0, 0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                      child: Text(
                        'Masuk disini',
                        style: GoogleFonts.inter(
                          color: const Color(0xFFEF223B),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 75),
            Align(
              alignment: const AlignmentDirectional(0, 0),
              child: Text(
                'Atau masuk dengan',
                style: GoogleFonts.inter(fontSize: 14, color: Colors.white),
              ),
            ),
            const SizedBox(height: 15),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                'https://static-00.iconduck.com/assets.00/google-icon-2048x2048-czn3g8x8.png',
                width: 35,
                height: 35,
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
  }
}
