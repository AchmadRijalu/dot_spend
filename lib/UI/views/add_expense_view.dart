import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:dot_spend/UI/widgets/button.dart';
import 'package:dot_spend/UI/widgets/forms.dart';
import 'package:dot_spend/models/category_model.dart';
import 'package:dot_spend/shared/shared_method.dart';
import 'package:dot_spend/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddExpenseView extends StatefulWidget {
  static const routeName = '/add-expense';
  const AddExpenseView({super.key});

  @override
  State<AddExpenseView> createState() => _AddExpenseViewState();
}

class _AddExpenseViewState extends State<AddExpenseView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  CategoryModel? _selectedCategory;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (categories.isNotEmpty && categories.length > 1) {
      _selectedCategory = categories[1];
      _categoryController.text = _selectedCategory!.title;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: lightBackgroundColor,
      appBar: AppBar(
        title: Text(
          "Tambah Pengeluaran Baru",
          style: blackTextStyle.copyWith(fontWeight: bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 38),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomFormField(
                title: "Nama Pengeluaran", controller: _nameController),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              readOnly: true,
              onTap: () {
                showFlexibleBottomSheet(
                  minHeight: 0,
                  initHeight: 0.5,
                  maxHeight: 0.5,
                  context: context,
                  builder: _buildBottomSheet,
                );
              },
              cursorColor: blackColor,
              controller: _categoryController,
              decoration: InputDecoration(
                prefixIcon: _selectedCategory != null
                    ? Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SvgPicture.asset(
                          _selectedCategory!.image,
                          color: _selectedCategory!.color,
                        ),
                      )
                    : null,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: blackColor, width: 2.0),
                ),
                hintText: "Category",
                contentPadding: const EdgeInsets.all(12),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                suffix: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: lightGreyColor,
                  ),
                  child: Icon(Icons.arrow_forward_ios,
                      color: blackColor, size: 18),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomFormFieldDate(
              controller: _dateController,
              title: "Tanggal Pengeluaran",
            ),
            const SizedBox(height: 20),
            CustomFormField(
                title: "Nominal",
                controller: _amountController,
                keyBoardType: TextInputType.number),
            const SizedBox(height: 32),
            CustomFilledButton(
                title: "Simpan", color: blueColor, onPressed: () {})
          ],
        ),
      ),
    );
  }

  Widget _buildBottomSheet(
    BuildContext context,
    ScrollController scrollController,
    double bottomSheetOffset,
  ) {
    List<CategoryModel> categories = getCategories();

    return Material(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Pilih Kategori",
                    style: blackTextStyle.copyWith(
                        fontWeight: semiBold, fontSize: 14)),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(
              height: 27,
            ),
            Expanded(
              child: GridView.builder(
                controller: scrollController,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 20,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedCategory = category;
                        _categoryController.text = category.title;
                      });
                      Navigator.pop(context);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: category.color,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: SvgPicture.asset(
                            category.image,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          category.title,
                          style: blackTextStyle,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
