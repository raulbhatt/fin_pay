
import 'package:fin_pay/transaction_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[700],
      body: Column(
        children: [
          const SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Good Morning.',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Text(
                      'Hello Jordan',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.notifications, color: Colors.white),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.qr_code, color: Colors.white),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            'Money Spend',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          const Text(
            '\$22,128.22',
            style: TextStyle(
                color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildCircularIcon(Icons.account_balance_wallet),
              _buildCircularIcon(Icons.receipt),
              _buildCircularIcon(Icons.payment),
              _buildCircularIcon(Icons.swap_horiz),
            ],
          ),
          const SizedBox(height: 30),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Payment List',
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 4,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        children: [
                          _buildPaymentItem(
                              Icons.wifi, 'Internet', Colors.orange.shade100),
                          _buildPaymentItem(Icons.lightbulb, 'Electricity',
                              Colors.red.shade100),
                          _buildPaymentItem(
                              Icons.phone_android, 'Mobile', Colors.green.shade100),
                          _buildPaymentItem(
                              Icons.water_drop, 'Water Bill', Colors.blue.shade100),
                          _buildPaymentItem(
                              Icons.local_gas_station, 'Gas Bill', Colors.lightGreen.shade100),
                          _buildPaymentItem(Icons.tv, 'TV', Colors.lightBlue.shade100),
                          _buildPaymentItem(Icons.shopping_cart, 'Merchant',
                              Colors.teal.shade100),
                          _buildPaymentItem(
                              Icons.more_horiz, 'More', Colors.purple.shade100),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Promo & Discount',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 130,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            _buildPromoCard(),
                            const SizedBox(width: 10),
                            _buildPromoCard(),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Recent Transaction',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const TransactionScreen()),
                              );
                            },
                            child: const Text('See All', style: TextStyle(color: Colors.green)),
                          ),
                        ],
                      ),
                      _buildTransactionItem('Netflix Subscription', 'Today, 12:00 PM', '-\$80.25', 'N', Colors.red),
                      _buildTransactionItem('Apple Store', 'Today, 06:23 PM', '-\$125.50', 'apple', Colors.black),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircularIcon(IconData icon) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.2),
      ),
      child: Icon(icon, color: Colors.white),
    );
  }

  Widget _buildPaymentItem(IconData icon, String label, Color color) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: Icon(icon, color: Colors.black87),
        ),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildPromoCard() {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.lightGreen.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Todays Promo',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 8),
                Text(
                  'Get discount for every top-up, transfer and payment',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          Text(
            '40%',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 32, color: Colors.green),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionItem(
      String title, String subtitle, String amount, String iconText, Color iconBgColor) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: iconText == 'apple'
                  ? Icon(Icons.apple, color: iconBgColor, size: 30)
                  : Text(
                      iconText,
                      style: TextStyle(
                          color: iconBgColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16)),
                Text(subtitle, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(amount,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Text('Payment',
                    style: TextStyle(color: Colors.red, fontSize: 10)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
