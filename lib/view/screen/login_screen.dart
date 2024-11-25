import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uts/view/screen/food_menu.dart';
import 'package:uts/view/screen/sign_up_screen.dart';
import 'package:uts/view/widget/login_signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
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
            'Masuk',
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
                'Selamat Datang Kembali',
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              'Silahkan masuk untuk mengakses akun anda',
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
                        'Email',
                        style: GoogleFonts.readexPro(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  reusableTextField('Enter Email', false, _emailTextController),
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
                      'Masukkan Passowrd Kamu', true, _passwordTextController),
                  Align(
                    alignment: const AlignmentDirectional(1.00, 0.00),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 5, 25, 0),
                      child: Text(
                        'Lupa Password?',
                        style: GoogleFonts.inter(
                          color: const Color(0xFFEF223B),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  signInSignUpButton(context, true, () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const FoodPage())));
                  }),
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
                        'Belum punya akun?',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const SignUpScreen())));
                    },
                    child: Align(
                      alignment: const AlignmentDirectional(0, 0),
                      child: Text(
                        'Daftar disini',
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
            const SizedBox(height: 85),
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
