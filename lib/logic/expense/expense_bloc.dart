import 'package:bloc/bloc.dart';
import 'package:dot_spend/db/expense_db.dart';
import 'package:dot_spend/models/expense_model.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

part 'expense_event.dart';
part 'expense_state.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  ExpenseBloc() : super(ExpenseInitial()) {
    on<ExpenseEvent>((event, emit) async {
      // TODO: implement event handler

      if (event is GetAllExpenses) {
        try {
          final expense = await ExpenseDb().getAllExpenses();
          final groupedExpenses = _expensesByDate(expense);
          final accumulatedExpenses = _accumulateExpensesByCategory(expense);
          emit(GetAllExpensesSuccess(groupedExpenses, accumulatedExpenses));
        } catch (e) {
          emit(ExpensesFailed(e.toString()));
        }
      }

      if (event is AddExpense) {
        try {
          await ExpenseDb().insertExpense(event.expense);
          emit(AddExpenseSuccess(event.expense));
        } catch (e) {
          emit(ExpensesFailed(e.toString()));
        }
      }
    });
  }

  Map<String, List<ExpenseModel>> _expensesByDate(
      List<ExpenseModel> expenses) {
    final Map<String, List<ExpenseModel>> groupedExpenses = {};
    for (var expense in expenses) {
      final date = _parseExpenseDate(expense.date);
      if (!groupedExpenses.containsKey(date)) {
        groupedExpenses[date] = [];
      }
      groupedExpenses[date]!.add(expense);
    }
    return groupedExpenses;
  }

  String _parseExpenseDate(String dateString) {
    final DateFormat format = DateFormat('EEEE, dd MMMM yyyy', 'id_ID');
    DateTime date = format.parse(dateString);

    final DateTime now = DateTime.now();
    final DateTime today = DateTime(now.year, now.month, now.day);
    final DateTime yesterday = today.subtract(const Duration(days: 1));

    if (date == today) {
      return "Hari Ini";
    } else if (date == yesterday) {
      return "Kemarin";
    } else {
      return DateFormat('dd MMM yyyy').format(date);
    }
  }

  Map<String, double> _accumulateExpensesByCategory(List<ExpenseModel> expenses) {
    final Map<String, double> accumulatedExpenses = {};
    for (var expense in expenses) {
      if (!accumulatedExpenses.containsKey(expense.category)) {
        accumulatedExpenses[expense.category] = 0.0;
      }
      accumulatedExpenses[expense.category] = accumulatedExpenses[expense.category]! + double.parse(expense.amount);
    }
    return accumulatedExpenses;
  }
}
