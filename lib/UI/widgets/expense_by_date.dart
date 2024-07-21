import 'package:dot_spend/theme/theme.dart';
import 'package:flutter/material.dart';

class ExpenseByDate extends StatelessWidget {
  final Color? color;
  final String? title;
  final int? moneyCount;
  const ExpenseByDate({super.key, this.color, this.title, this.moneyCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        
        borderRadius: BorderRadius.circular(16),
        color: color,
      ),
      padding: const EdgeInsets.only(left: 16, right: 46, top: 14, bottom: 10),
      child: Column(
        children: [
          Text(
            "Pengeluaranmu\n$title",
            style: whiteTextStyle.copyWith(fontSize: 14, fontWeight: semiBold),
          ),
          const SizedBox(
            height: 14,
          ),
          Text(
            "Rp. $moneyCount",
            style: whiteTextStyle.copyWith(fontWeight: bold, fontSize: 18),
          )
        ],
      ),
    );
  }
}
