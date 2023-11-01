// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:praktikum/models/cities_model.dart';
// import 'package:praktikum/provider/homescreen_provider.dart';
// import 'package:praktikum/screen/cities_screen.dart';
// import 'package:provider/provider.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key, required this.data});
//   final Result data;
//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int _current = 0;
//   int _currentIndex = 0;
//   final CarouselController _controller = CarouselController();
//   late MovieProvider homeprovider;
//   @override
//   void initState() {
//     super.initState();
//     homeprovider = Provider.of<MovieProvider>(context, listen: false);
//     homeprovider.getNowPlaying(widget.data.id);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         toolbarHeight: 0,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Consumer<MovieProvider>(
//               builder: (context, provider, child) {
//                 if (provider.isLoading) {
//                   return const Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 } else {
//                   return CarouselSlider.builder(
//                     itemCount: provider.nowPlayingMovie!.results.take(6).length,
//                     itemBuilder: (context, index, realIndex) {
//                       return Stack(
//                         children: [
//                           Container(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(8),
//                               image: DecorationImage(
//                                 image: NetworkImage(
//                                   provider.nowPlayingMovie!.results[index]
//                                       .posterPath,
//                                 ),
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                           Positioned(
//                             left: 20,
//                             bottom: 10,
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   children: [
//                                     Text(
//                                       provider.nowPlayingMovie!.results[index]
//                                           .title,
//                                       style: GoogleFonts.inter(
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.w600,
//                                         color: Colors.white,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: List.generate(
//                                     provider.nowPlayingMovie!.results
//                                         .take(6)
//                                         .length,
//                                     (i) {
//                                       return GestureDetector(
//                                         onTap: () {
//                                           _controller.animateToPage(i);
//                                         },
//                                         child: Container(
//                                           width: 12.0,
//                                           height: 12.0,
//                                           margin: const EdgeInsets.symmetric(
//                                               vertical: 8.0, horizontal: 4.0),
//                                           decoration: BoxDecoration(
//                                             shape: BoxShape.circle,
//                                             color: (Theme.of(context)
//                                                             .brightness ==
//                                                         Brightness.dark
//                                                     ? const Color(0xff5D5D5D)
//                                                     : const Color(0xffEF223B))
//                                                 .withOpacity(
//                                               _current == i ? 0.9 : 0.4,
//                                             ),
//                                           ),
//                                         ),
//                                       );
//                                     },
//                                   ),
//                                 ),
//                                 const SizedBox(height: 15),
//                               ],
//                             ),
//                           ),
//                         ],
//                       );
//                     },
//                     options: CarouselOptions(
//                         height: 325,
//                         viewportFraction: 1,
//                         initialPage: 0,
//                         enableInfiniteScroll: true,
//                         reverse: false,
//                         autoPlay: true,
//                         autoPlayInterval: const Duration(seconds: 4),
//                         autoPlayAnimationDuration:
//                             const Duration(milliseconds: 250),
//                         // enlargeCenterPage: true,
//                         scrollDirection: Axis.horizontal,
//                         onPageChanged: (index, reason) {
//                           setState(() {
//                             _current = index;
//                           });
//                         }),
//                   );
//                 }
//               },
//             ),
//             InkWell(
//               onTap: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const CitiesScreen()));
//               },
//               child: SizedBox(
//                 height: 35,
//                 child: Container(
//                   decoration: const BoxDecoration(
//                     color: Colors.red,
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             const Icon(
//                               Icons.location_pin,
//                               color: Colors.white,
//                             ),
//                             const SizedBox(width: 10),
//                             Text(
//                               widget.data.name,
//                               style: GoogleFonts.inter(
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ],
//                         ),
//                         const Icon(
//                           Icons.keyboard_arrow_down,
//                           color: Colors.white,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 23),
//             Padding(
//               padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 10),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Sedang Tayang',
//                     style: GoogleFonts.inter(
//                       color: Colors.white,
//                       fontSize: 18,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   Row(
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       InkWell(
//                         onTap: () {},
//                         child: Text(
//                           'Lihat Semua',
//                           style: GoogleFonts.inter(
//                             color: const Color(0xFFEA4335),
//                             fontSize: 14,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       )
//                     ],
//                   )
//                 ],
//               ),
//             ),
//             const SizedBox(height: 10),
//             Consumer<MovieProvider>(
//               builder: (context, provider, child) {
//                 if (provider.isLoading) {
//                   return const Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 } else {
//                   return Column(
//                     children: [
//                       CarouselSlider.builder(
//                         itemCount: provider.nowPlayingMovie!.results.length,
//                         itemBuilder: (context, index, realIndex) {
//                           return Container(
//                             height: 300,
//                             width: 200,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(8),
//                               image: DecorationImage(
//                                 image: NetworkImage(
//                                   provider.nowPlayingMovie!.results[index]
//                                       .posterPath,
//                                 ),
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           );
//                         },
//                         options: CarouselOptions(
//                             height: 350,
//                             viewportFraction: 0.55,
//                             initialPage: 0,
//                             enableInfiniteScroll: true,
//                             reverse: false,
//                             autoPlay: false,
//                             autoPlayInterval: const Duration(seconds: 4),
//                             autoPlayAnimationDuration:
//                                 const Duration(milliseconds: 250),
//                             // enlargeCenterPage: true,
//                             scrollDirection: Axis.horizontal,
//                             onPageChanged: (index, reason) {
//                               setState(() {
//                                 _currentIndex = index;
//                               });
//                             }),
//                       ),
//                       const SizedBox(height: 10),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           SizedBox(
//                             // width: 150,
//                             child: Text(
//                               provider.nowPlayingMovie!.results[_currentIndex]
//                                   .title,
//                               style: GoogleFonts.inter(
//                                 color: Colors.white,
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                               maxLines: 2,
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ),
//                         ],
//                       ),

//                       // Row(
//                       //   mainAxisAlignment: MainAxisAlignment.center,
//                       //   children: [
//                       //     sizedBox
//                       //   ],
//                       // )
//                     ],
//                   );
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


























// // return SizedBox(
// //                     height: 200,
// //                     child: ListView.builder(
// //                       physics: const NeverScrollableScrollPhysics(),
// //                       shrinkWrap: true,
// //                       scrollDirection: Axis.horizontal,
// //                       itemCount: provider.nowPlayingMovie!.results.length,
// //                       itemBuilder: (context, index) {
// //                         return Padding(
// //                           padding: const EdgeInsetsDirectional.fromSTEB(
// //                               10, 0, 10, 0),
// //                           child: Column(
// //                             crossAxisAlignment: CrossAxisAlignment.start,
// //                             children: [
// //                               Container(
// //                                 height: 150,
// //                                 width: 100,
// //                                 decoration: BoxDecoration(
// //                                   borderRadius: BorderRadius.circular(8),
// //                                   image: DecorationImage(
// //                                     image: NetworkImage(
// //                                       provider.nowPlayingMovie!.results[index]
// //                                           .posterPath,
// //                                     ),
// //                                     fit: BoxFit.cover,
// //                                   ),
// //                                 ),
// //                               ),
// //                               const SizedBox(height: 10),
// //                               SizedBox(
// //                                 width: 100,
// //                                 child: Text(
// //                                   provider.nowPlayingMovie!.results[index]
// //                                       .title,
// //                                   style: GoogleFonts.inter(
// //                                     color: Colors.white,
// //                                     fontSize: 14,
// //                                     fontWeight: FontWeight.w600,
// //                                   ),
// //                                   maxLines: 2,
// //                                   overflow: TextOverflow.ellipsis,
// //                                 ),
// //                               ),
// //                             ],
// //                           ),
// //                         );
// //                       },
// //                     ),
// //                   );