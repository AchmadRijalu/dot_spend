part of 'expense_bloc.dart';

sealed class ExpenseState extends Equatable {
  const ExpenseState();

  @override
  List<Object> get props => [];
}

final class ExpenseInitial extends ExpenseState {}

final class GetAllExpensesSuccess extends ExpenseState {
  final Map<String, List<ExpenseModel>> expenses;
  final Map<String, double> accumulatedExpenses;

  GetAllExpensesSuccess(this.expenses, this.accumulatedExpenses);

  @override
  List<Object> get props => [expenses, accumulatedExpenses];
}

final class ExpensesFailed extends ExpenseState {
  final String error;

  ExpensesFailed(this.error);

  @override
  List<Object> get props => [error];
}

final class AddExpenseSuccess extends ExpenseState {
  final ExpenseModel expense;

  AddExpenseSuccess(this.expense);

  @override
  List<Object> get props => [expense];
}
