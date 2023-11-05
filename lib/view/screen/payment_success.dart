import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:praktikum/view/screen/home_screen.dart';
import 'package:praktikum/viewmodel/homescreen_provider.dart';
import 'package:provider/provider.dart';

class PaymentSuccessPage extends StatefulWidget {
  const PaymentSuccessPage({super.key});

  @override
  State<PaymentSuccessPage> createState() => _PaymentSuccessPageState();
}

class _PaymentSuccessPageState extends State<PaymentSuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Payment Success'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Text(
              'Pembayaran Berhasil',
              style: GoogleFonts.roboto(
                fontSize: 31,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 60),
            Image.asset(
              'assets/images/foodsuccess.png',
              width: 202,
              height: 202,
            ),
            const SizedBox(height: 60),
            SizedBox(
              width: 300,
              child: Text(
                textAlign: TextAlign.justify,
                'Terima kasih sudah mengorder snack dari kami. Selamat menikmati film dan snack dari kami DWONS dan jangan lupa buang sampah pada tempatnya yaa~',
                style: GoogleFonts.inter(
                    fontSize: 20, color: const Color(0xff8F8F8F)),
              ),
            ),
            const SizedBox(height: 60),
            Consumer<HomeScreenProvider>(builder: (context, provider, index) {
              return SizedBox(
                height: 50,
                width: 290,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffEF223B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              HomePage(data: provider.cities!.results[0]),
                        ),
                      );
                    },
                    child: Text(
                      'KEMBALI KE BERANDA',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    )),
              );
            })
          ],
        ),
      ),
    );
  }
}
