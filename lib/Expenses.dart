import 'dart:math';

import 'package:expense_traker/Expense_list.dart';
import 'package:expense_traker/Models/expens.dart';
import 'package:expense_traker/Widgets/chart.dart';
import 'package:expense_traker/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {

final List<Expense>_registeredExpenses =[
   Expense(
    amount: 19.99, 
    date: DateTime.now(), 
    title: 'Flutter Course', 
    category: Category.work),

    Expense(
      amount: 130.69, 
      date: DateTime.now(), 
      title: 'Cinema', 
      category: Category.leisure),
          ];

        
          void _openAddExpensesOverlay(){
            showModalBottomSheet(
            useSafeArea:true ,
            isScrollControlled: true,
            context: context, 
            builder:(ctx)=>NewExpence(onAddExpence:_addExpense ));
          }

          void _addExpense(Expense expense){
            setState(() {
              _registeredExpenses.add(expense);
            });
          }

   void _removeExpense(Expense expense){
    final expenseIndex =_registeredExpenses.indexOf(expense);
            setState(() {
              _registeredExpenses.remove(expense);
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: Duration(seconds: 3),
                content: Text("Expence Deleted"),
                action: SnackBarAction(label:"Undo", onPressed: () {

                  setState(() {
                    _registeredExpenses.insert(expenseIndex,expense);
                  });
                  
                },),
                
                ));



          }


  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;




      Widget mainContent = const Center(
      child: Text('No expenses found. Start adding some!'),
      
      
      );
      if (_registeredExpenses.isNotEmpty){
        mainContent=ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,);
      }



   
    return Scaffold(
       appBar: AppBar(
        title: Text('Expence Tracker'),
        actions:  [IconButton(onPressed:_openAddExpensesOverlay , icon: Icon(Icons.add))],),
     
      body: width < 600 ? 
      Column(
        children: [
          Chart(expenses:_registeredExpenses),
          Expanded(child:mainContent)


        ],
      )
        :Row(
        children: [
          Expanded(child: Chart(expenses:_registeredExpenses)),
          Expanded(child:mainContent)


        ],
      )



    );
  }
}