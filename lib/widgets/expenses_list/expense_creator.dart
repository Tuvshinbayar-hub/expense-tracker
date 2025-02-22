import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseCreator extends StatefulWidget {
  const ExpenseCreator({super.key, required this.onSave});
  final Function onSave;

  @override
  State<StatefulWidget> createState() {
    return _ExpenseCreator();
  }
}

class _ExpenseCreator extends State<ExpenseCreator> {
  DateTime? _selectedTime = DateTime.now();
  ExpenseCategory _selectedCategory = ExpenseCategory.food;
  final _titleController = TextEditingController();
  final _costController = TextEditingController();
  final _expenseCategoryEntries = ExpenseCategory.values
      .map((item) =>
          DropdownMenuEntry(value: item, label: item.toString().split('.')[1]))
      .toList();

  String get selectedDateFormatted {
    return "${_selectedTime!.month}/${_selectedTime!.day}/${_selectedTime!.year}";
  }

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: _selectedTime,
        firstDate: DateTime(DateTime.now().year - 10),
        lastDate: DateTime(DateTime.now().year + 1));

    setState(() {
      if (pickedDate == null) {
        return;
      }
      _selectedTime = pickedDate;
    });
  }

  void onCategorySelection(ExpenseCategory? selectedCategory) {
    if (selectedCategory == null) {
      return;
    }
    _selectedCategory = selectedCategory;
  }

  void onPressedCancelButton(BuildContext ctx) {
    Navigator.pop(ctx);
  }

  void onSaveButtonPressed(BuildContext ctx) {
    if (!validateInputs()) {
      showErrorDialog();
      return;
    }
    createNewExpense();
    Navigator.pop(ctx);
  }

  void createNewExpense() {
    final Expense entity = Expense(_titleController.text,
        int.parse(_costController.text), _selectedTime!, _selectedCategory);

    widget.onSave(entity);
  }

  bool validateInputs() {
    if (_titleController.text.isEmpty || _titleController.text.trim().isEmpty) {
      return false;
    }

    if (_costController.text.isEmpty ||
        _costController.text.trim().isEmpty ||
        int.tryParse(_costController.text) == null) {
      return false;
    }

    return true;
  }

  void showErrorDialog() {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text('Invalid input'),
              content: Text("All fields must be filled with valid inputs"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                    },
                    child: Text('Okay'))
              ],
            ));
  }

  @override
  void dispose() {
    _titleController.dispose();
    _costController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text('Add new item'),
          TextField(
            controller: _titleController,
            decoration: InputDecoration(label: Text('Title')),
            style: TextStyle()
                .copyWith(color: Theme.of(context).appBarTheme.backgroundColor),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                  child: TextField(
                controller: _costController,
                decoration: InputDecoration(label: Text("Cost amount")),
                keyboardType: TextInputType.number,
                style: TextStyle().copyWith(
                    color: Theme.of(context).appBarTheme.backgroundColor),
              )),
              TextButton(
                  onPressed: _selectDate,
                  child: Row(
                    children: [
                      Icon(Icons.calendar_today),
                      SizedBox(
                        width: 8,
                      ),
                      Text(selectedDateFormatted)
                    ],
                  ))
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              DropdownMenu(
                  label: Text("Category"),
                  initialSelection: _expenseCategoryEntries[0].value,
                  dropdownMenuEntries: _expenseCategoryEntries,
                  onSelected: (value) {
                    onCategorySelection(value);
                  }),
              Spacer(),
              TextButton(
                  onPressed: () {
                    onPressedCancelButton(context);
                  },
                  child: Text("Cancel")),
              SizedBox(
                width: 8,
              ),
              ElevatedButton(
                onPressed: () {
                  onSaveButtonPressed(context);
                },
                child: Text('Save'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
