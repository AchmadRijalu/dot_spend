part of 'expense_bloc.dart';

sealed class ExpenseEvent extends Equatable {
  const ExpenseEvent();

  @override
  List<Object> get props => [];
}


final class GetAllExpenses extends ExpenseEvent {}

final class AddExpense extends ExpenseEvent {
  final ExpenseModel expense;

  AddExpense(this.expense);

  @override
  List<Object> get props => [expense];
}