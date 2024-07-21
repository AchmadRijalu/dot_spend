import 'package:dot_spend/models/expense_model.dart';
import 'package:dot_spend/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListExpenseItem extends StatelessWidget {
  final ExpenseModel? expenseModel;
  const ListExpenseItem({super.key, this.expenseModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      width: double.infinity,
      height: 67,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 22),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: greyColor.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 15,
            offset: Offset(2, 5),
          ),
        ],
        color: whiteColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/images/image_home.svg",
                  color: Colors.amber,
                ),
                const SizedBox(
                  width: 14,
                ),
                Text(
                  "Makanan",
                  style: blackTextStyle.copyWith(
                      fontSize: 14, fontWeight: regular),
                ),
              ],
            ),
          ),
          Text("Rp. 15.000",
              style:
                  blackTextStyle.copyWith(fontSize: 14, fontWeight: semiBold))
        ],
      ),
    );
  }
}
