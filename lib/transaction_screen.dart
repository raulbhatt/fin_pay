
import 'package:flutter/material.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade50,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Transaction',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search, color: Colors.grey),
                  hintText: 'Search transaction...',
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.mic, color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildTransactionItem('Netflix Subscription', 'Today, 12:00 PM',
                      '-\$80.25', 'Payment', 'N', Colors.red),
                  _buildTransactionItem('Apple Store', 'Today, 06:00 PM',
                      '-\$125.50', 'Payment', 'apple', Colors.black),
                  _buildTransactionItem('Nike Shoes', 'Yesterday, 07:00 PM',
                      '-\$70.00', 'Payment', 'nike', Colors.black),
                  _buildTransactionItem('Starbucks Coffee', 'Yesterday, 08:00 PM',
                      '-\$20.00', 'Payment', 'starbucks', Colors.green),
                  _buildTransactionItem('Ronald Richards', 'Yesterday, 10:00 PM',
                      '+190.00', 'Send Money', 'ronald', Colors.blue),
                  _buildTransactionItem('Netflix Subscription', '10/10/25, 12:00 PM',
                      '-\$80.25', 'Payment', 'N', Colors.red),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionItem(String title, String subtitle, String amount,
      String type, String icon, Color color) {
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
                child: icon == 'apple'
                    ? const Icon(Icons.apple, color: Colors.black, size: 30)
                    : icon == 'nike'
                        ? const Icon(Icons.check, color: Colors.black, size: 30)
                        : icon == 'starbucks'
                            ? const Icon(Icons.coffee, color: Colors.green, size: 30)
                            : icon == 'ronald'
                                ? const Icon(Icons.person, color: Colors.blue, size: 30)
                                : Text(
                                    icon,
                                    style: TextStyle(
                                        color: color,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  )),
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
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: amount.startsWith('-') ? Colors.red : Colors.green)),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: type == 'Payment'
                      ? Colors.red.withOpacity(0.1)
                      : Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(type,
                    style: TextStyle(
                        color: type == 'Payment' ? Colors.red : Colors.green,
                        fontSize: 10)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
