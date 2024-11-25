import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:uts/models/now_playing_model.dart';
import 'package:uts/viewmodel/homescreen_provider.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key, required this.movieId});
  final Result movieId;

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  late HomeScreenProvider homeScreenProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeScreenProvider =
        Provider.of<HomeScreenProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Consumer<HomeScreenProvider>(builder: (context, provider, index) {
            if (provider.isLoading) {
              return const CircularProgressIndicator();
            } else {
              return Column(
                children: [
                  Container(
                    height: 230,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(widget.movieId.posterPath),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          height: 230,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.white.withOpacity(0.0),
                                Colors.black,
                              ],
                              stops: const [0.0, 0.4],
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 0, 40),
                                child: Text(
                                  widget.movieId.title,
                                  style: GoogleFonts.inter(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              );
            }
          }),
        ],
      ),
    );
  }
}
