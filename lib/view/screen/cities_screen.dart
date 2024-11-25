import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:uts/view/screen/home_screen.dart';
import 'package:uts/viewmodel/homescreen_provider.dart';

class CitiesScreen extends StatefulWidget {
  const CitiesScreen({super.key});

  @override
  State<CitiesScreen> createState() => _CitiesScreenState();
}

class _CitiesScreenState extends State<CitiesScreen> {
  late HomeScreenProvider homeprovider;
  // late FilterCitiesProvider filterCitiesProvider;

  @override
  void initState() {
    super.initState();
    homeprovider = Provider.of<HomeScreenProvider>(context, listen: false);
    homeprovider.getCities();
    // filterCitiesProvider.searchController.addListener(() {
    // filterCitiesProvider.filteredCities;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: TextField(
          // controller: filterCitiesProvider.searchController,
          onChanged: (query) {},
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Search cities...',
            hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<HomeScreenProvider>(
              builder: (context, provider, child) {
                if (provider.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: provider.cities!.results.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          homeprovider.getNowPlaying(
                              provider.cities!.results[index].id);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(
                                  data: provider.cities!.results[index]),
                            ),
                          );
                        },
                        child: ListTile(
                          title: Text(
                            provider.cities!.results[index].name,
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(
                      color: Colors.grey,
                      thickness: 2,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
