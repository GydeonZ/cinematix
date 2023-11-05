import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:praktikum/models/cart_model.dart';
import 'package:praktikum/view/screen/payment_menu.dart';
import 'package:praktikum/viewmodel/fnb_provider.dart';
import 'package:provider/provider.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key, required this.selectedItems});
  final List<CartItem> selectedItems;

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  late FoodAndDrinks foodAndDrinks;
  late GetCartProvider getCartProvider;
  @override
  void initState() {
    super.initState();
    foodAndDrinks = Provider.of<FoodAndDrinks>(context, listen: false);
    getCartProvider = Provider.of<GetCartProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final List<CartItem> selectedItems = widget.selectedItems;
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Pesanan Kamu',
            style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0xff9A1515),
                  const Color(0xff9A1515).withOpacity(0),
                ],
                stops: const [0.5, 1],
              )),
            ),
            Consumer<FoodAndDrinks>(
              builder: (context, cartProvider, child) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: selectedItems.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin:
                          const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
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
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          selectedItems[index].itemImagePath),
                                      fit: BoxFit.cover),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: const Color(0xFFEAECF0),
                                    width: 5,
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
                                  selectedItems[index].itemName,
                                  style: GoogleFonts.plusJakartaSans(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  foodAndDrinks.formattedPrice(
                                      selectedItems[index].itemPrice),
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
                            alignment: const AlignmentDirectional(0, 0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 10, 0),
                              child: Text(
                                'Jumlah pesanan: ${selectedItems[index].quantity}',
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              },
            ),
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
                    final selectedItems = getCartProvider.cartItems;
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
    );
  }
}
