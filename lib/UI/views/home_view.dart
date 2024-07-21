import 'package:dot_spend/UI/views/add_expense_view.dart';
import 'package:dot_spend/UI/widgets/expense_by_category.dart';
import 'package:dot_spend/UI/widgets/expense_by_date.dart';
import 'package:dot_spend/UI/widgets/list_expense_item.dart';
import 'package:dot_spend/shared/shared_method.dart';
import 'package:dot_spend/theme/theme.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  static const routeName = '/home';
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      floatingActionButton: FloatingActionButton.small(
        backgroundColor: blueColor,
        onPressed: () {
          Navigator.pushNamed(context, AddExpenseView.routeName);
        },
        child: const Icon(Icons.add, color: Colors.white, size: 28),
        shape: CircleBorder(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Text(
                      "Halo, User!",
                      style: blackTextStyle.copyWith(
                          fontSize: 18, fontWeight: bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "Jangan lupa catat keuanganmu setiap hari!",
                  style:
                      greyTextStyle.copyWith(fontSize: 14, fontWeight: regular),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ExpenseByDate(
                          color: blueColor,
                          title: "Hari ini",
                          moneyCount: 1000000),
                    ),
                    const SizedBox(
                      width: 19,
                    ),
                    Expanded(
                      child: ExpenseByDate(
                          color: tealColor,
                          title: "Bulan ini",
                          moneyCount: 1000000),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Pengeluaran berdasarkan kategori",
                  style:
                      blackTextStyle.copyWith(fontSize: 14, fontWeight: bold),
                ),
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                  height: 155,
                  child: ListView.builder(
                    itemCount: getCategories().length,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    itemBuilder: (context, index) {
                      final categoryModel = getCategories()[index];
                      return ExpenseByCategory(
                        categoryModel: categoryModel,
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
                Text(
                  "Hari Ini",
                  style:
                      blackTextStyle.copyWith(fontSize: 14, fontWeight: bold),
                ),
                const SizedBox(
                  height: 12,
                ),
                ListView.builder(
                  primary: false,
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ListExpenseItem();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
