import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:praktikum/models/cart_model.dart';
import 'package:praktikum/view/screen/payment_menu.dart';
import 'package:praktikum/viewmodel/fnb_provider.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  late FoodAndDrinks foodAndDrinks;
  late GetCartProvider getCardProvider;
  @override
  void initState() {
    super.initState();
    foodAndDrinks = Provider.of<FoodAndDrinks>(context, listen: false);
    getCardProvider = Provider.of<GetCartProvider>(context, listen: false);
    foodAndDrinks.getFNB();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color(0xff000000),
        title: const Text('Food Menu'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                width: 300,
                child: Text(
                  'Selamat Siang DWONS, kamu mau pesan apa hari ini?',
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color(0xffEF223B).withOpacity(0.0),
                        const Color(0xffEF223B)
                      ],
                    ),
                  ),
                  child: Consumer<FoodAndDrinks>(
                    builder: (context, provider, index) {
                      return Align(
                        alignment: const AlignmentDirectional(0.00, 0.00),
                        child: Text(
                          'Makanan',
                          style: GoogleFonts.inter(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                  )),
              const SizedBox(height: 20),
              Consumer<FoodAndDrinks>(builder: (context, provider, child) {
                if (provider.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: provider.fnbList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin:
                            const EdgeInsetsDirectional.fromSTEB(15, 0, 15, 20),
                        width: 320,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  15, 0, 0, 0),
                              child: Material(
                                color: Colors.transparent,
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Container(
                                  width: 65,
                                  height: 65,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: const Color(0xFFEAECF0),
                                      width: 5,
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      provider.fnbList[index].imagePath,
                                      width: 300,
                                      height: 200,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 30, 5, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    provider.fnbList[index].name,
                                    style: GoogleFonts.plusJakartaSans(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    foodAndDrinks.formattedPrice(
                                        provider.fnbList[index].price),
                                    style: GoogleFonts.plusJakartaSans(
                                      color: const Color(0xFFF24253),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.00, 0.00),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 10, 0),
                                child: Container(
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Color(0xffFF0019),
                                          Color.fromARGB(255, 187, 0, 19)
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(13),
                                    ),
                                    width: 100,
                                    height: 27,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (BuildContext context) {
                                            int quantity =
                                                1; // Item quantity, initially set to 1

                                            return StatefulBuilder(
                                              builder: (BuildContext context,
                                                  StateSetter setState) {
                                                return Container(
                                                  padding:
                                                      const EdgeInsets.all(16),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: <Widget>[
                                                      Text(
                                                        provider.fnbList[index]
                                                            .name,
                                                        style: const TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 16),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: <Widget>[
                                                          Text(
                                                              'Quantity: $quantity'),
                                                          Row(
                                                            children: <Widget>[
                                                              IconButton(
                                                                icon: const Icon(
                                                                    Icons
                                                                        .remove),
                                                                onPressed: () {
                                                                  setState(() {
                                                                    if (quantity >
                                                                        1) {
                                                                      quantity--;
                                                                    }
                                                                  });
                                                                },
                                                              ),
                                                              IconButton(
                                                                icon: const Icon(
                                                                    Icons.add),
                                                                onPressed: () {
                                                                  setState(() {
                                                                    quantity++;
                                                                  });
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                          height: 16),
                                                      Container(
                                                        height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          gradient:
                                                              const LinearGradient(
                                                            begin: Alignment
                                                                .topCenter,
                                                            end: Alignment
                                                                .bottomCenter,
                                                            colors: [
                                                              Color(0xffFF0019),
                                                              Color.fromARGB(
                                                                  255,
                                                                  187,
                                                                  0,
                                                                  19)
                                                            ],
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(13),
                                                        ),
                                                        child: ElevatedButton(
                                                          onPressed: () {
                                                            // Handle adding to cart here
                                                            // You can use 'quantity' to determine how many items to add
                                                            final selectedItem =
                                                                provider.fnbList[
                                                                    index];
                                                            final cartItem =
                                                                CartItem(
                                                              id: selectedItem
                                                                  .id, // Use the unique identifier
                                                              itemName:
                                                                  selectedItem
                                                                      .name,
                                                              quantity:
                                                                  quantity,
                                                              itemPrice:
                                                                  selectedItem
                                                                      .price,
                                                              itemImagePath:
                                                                  selectedItem
                                                                      .imagePath,
                                                            );
                                                            getCardProvider
                                                                .addItemToCart(
                                                                    cartItem);
                                                            // Close the bottom sheet
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            elevation: 0,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          13),
                                                            ),
                                                          ),
                                                          child: Text(
                                                            'Tambahkan ke Keranjang',
                                                            style: GoogleFonts
                                                                .inter(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(13),
                                        ),
                                      ),
                                      child: Text(
                                        'Tambahkan',
                                        style: GoogleFonts.inter(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
                }
              }),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xffFF0019),
                        Color.fromARGB(255, 187, 0, 19)
                      ],
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  height: 40,
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {
                      final selectedItems = getCardProvider.cartItems;
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PaymentPage(
                            selectedItems: selectedItems,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Checkout',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
