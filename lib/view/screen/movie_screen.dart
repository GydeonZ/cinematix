import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:praktikum/models/now_playing_model.dart';
import 'package:praktikum/view/screen/booking_screen.dart';
import 'package:praktikum/view/screen/home_screen.dart';
import 'package:praktikum/viewmodel/homescreen_provider.dart';
import 'package:praktikum/viewmodel/movie_section_provider.dart';
import 'package:provider/provider.dart';

class MovieSection extends StatefulWidget {
  const MovieSection({super.key, required this.data});
  final Result data;

  @override
  State<MovieSection> createState() => _MovieSectionState();
}

class _MovieSectionState extends State<MovieSection> {
  late HomeScreenProvider homeScreenProvider;
  late MovieSectionProvider movieSectionProvider;
  @override
  void initState() {
    super.initState();
    homeScreenProvider =
        Provider.of<HomeScreenProvider>(context, listen: false);
    movieSectionProvider =
        Provider.of<MovieSectionProvider>(context, listen: false);
    // homeScreenProvider.getNowPlaying(widget.data.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<HomeScreenProvider>(builder: (context, provider, index) {
              if (provider.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Column(
                  children: [
                    Container(
                      height: 230,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(widget.data.posterPath),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    HomePage(data: provider.cities!.results[0]),
                              ),
                            );
                          },
                          icon: const Icon(Icons.arrow_back_rounded),
                          color: Colors.white,
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0, 0),
                          child: IconButton(
                            onPressed: () {
                              widget.data.trailerPath;
                            },
                            icon: const Icon(
                              Icons.play_circle_fill_rounded,
                              color: Color(0xffEF223B),
                            ),
                            iconSize: 70,
                          ),
                        ),
                      ]),
                    ),
                    const SizedBox(height: 15),
                    const Divider(
                      thickness: 0.5,
                      color: Colors.white,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 50,
                              child: Text(widget.data.ratingScore.toString(),
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  )),
                            ),
                            SizedBox(
                              width: 120,
                              child: Text(
                                textAlign: TextAlign.center,
                                movieSectionProvider
                                    .formatDuration(widget.data.duration),
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 50,
                              child: Text(
                                textAlign: TextAlign.center,
                                widget.data.ageCategory,
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 50,
                              child: Text('Rating',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                  )),
                            ),
                            SizedBox(
                              width: 120,
                              child: Text(
                                'Durasi',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                            SizedBox(
                              width: 50,
                              child: Text(
                                'Kategori',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const Divider(
                      thickness: 0.5,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 15),
                    Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Text(
                        'Deskripsi',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                        width: double.infinity,
                        child: Text(
                          widget.data.synopsis,
                          style: GoogleFonts.inter(
                            color: Colors.white,
                          ),
                        )),
                    const SizedBox(height: 20),
                    Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Text(
                        'Produser',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                        width: double.infinity,
                        child: Text(
                          widget.data.producer,
                          style: GoogleFonts.inter(
                            color: Colors.white,
                          ),
                        )),
                    const SizedBox(height: 20),
                    Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Text(
                        'Pemeran',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                        width: double.infinity,
                        child: Text(
                          widget.data.actor,
                          style: GoogleFonts.inter(
                            color: Colors.white,
                          ),
                        )),
                    const SizedBox(height: 20),
                    Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Text(
                        'Yang Lainnya',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Consumer<HomeScreenProvider>(
                      builder: (context, provider, child) {
                        if (provider.isLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return Column(
                            children: [
                              CarouselSlider.builder(
                                itemCount:
                                    provider.nowPlayingMovie!.results.length,
                                itemBuilder: (context, index, realIndex) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => MovieSection(
                                              data: provider.nowPlayingMovie!
                                                  .results[index]),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: 125,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            provider.nowPlayingMovie!
                                                .results[index].posterPath,
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                options: CarouselOptions(
                                  height: 200,
                                  viewportFraction: 0.38,
                                  initialPage: 0,
                                  enableInfiniteScroll: true,
                                  reverse: false,
                                  autoPlay: false,
                                  autoPlayInterval: const Duration(seconds: 4),
                                  autoPlayAnimationDuration:
                                      const Duration(milliseconds: 250),
                                  // enlargeCenterPage: true,
                                  scrollDirection: Axis.horizontal,
                                ),
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                height: 50,
                                width: 300,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            BookingPage(movieId: widget.data),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      backgroundColor: const Color(0xffEF223B)),
                                  child: Text(
                                    'Yuk Nonton !',
                                    style: GoogleFonts.inter(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20)
                            ],
                          );
                        }
                      },
                    ),
                  ],
                );
              }
            })
          ],
        ),
      ),
    );
  }
}
