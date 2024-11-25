import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uts/models/cart_model.dart';
import 'package:uts/services/services.dart';
import 'package:uts/view/screen/payment_success.dart';
import 'package:uts/viewmodel/checkout_provider.dart';
import 'package:uts/viewmodel/fnb_provider.dart';
import 'package:provider/provider.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key, required this.selectedItems});
  final List<CartItem> selectedItems;

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  late FoodAndDrinks foodAndDrinks;
  late GetCartProvider getCartProvider;
  final calculatePrice = CalculatePrice();
  final apiServices = ApiServices();
  @override
  void initState() {
    super.initState();
    foodAndDrinks = Provider.of<FoodAndDrinks>(context, listen: false);
    getCartProvider = Provider.of<GetCartProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final List<CartItem> selectedItems = widget.selectedItems;
    double total = calculatePrice.calculateTotalPrice(selectedItems);
    String formattedTotal = calculatePrice.formatTotalPrice(total);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Payment Page'),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  'Ringkasan Order',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: const Color(0xffEF223B),
                  ),
                ),
                const SizedBox(height: 25),
                Text(
                  'Detail Transaksi',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 25),
                Consumer<FoodAndDrinks>(
                    builder: (context, cartProvider, child) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: selectedItems.length,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            selectedItems[index].itemName,
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            '${selectedItems[index].quantity} x ${foodAndDrinks.formattedPrice(selectedItems[index].itemPrice)}',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      );
                    },
                  );
                }),
                const Divider(
                  height: 30,
                  thickness: 0.5,
                  color: Colors.black,
                ),
                Consumer<CalculatePrice>(builder: (context, provider, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        formattedTotal,
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  );
                }),
                const SizedBox(height: 40),
                Consumer<CalculatePrice>(
                  builder: (context, provider, child) {
                    return Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: 36,
                        width: 303,
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
                                          const PaymentSuccessPage()));
                            },
                            child: Text(
                              'BAYAR $formattedTotal',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            )),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
