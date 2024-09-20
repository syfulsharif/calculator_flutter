import 'package:flutter/material.dart';

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _firstNumberController = TextEditingController();
  final TextEditingController _secondNumberController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  double _result = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter a valid number';
                  }
                  return null;
                },
                controller: _firstNumberController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    hintText: 'First Number', labelText: 'First Number'),
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter a Valid Number';
                  }
                  return null;
                },
                controller: _secondNumberController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    hintText: 'Second Number', labelText: 'Second Number'),
              ),
              const SizedBox(
                height: 24.0,
              ),
              _buildButtonBar(),
              const SizedBox(
                height: 24.0,
              ),
              Text(
                'Result: ${_result.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 18.0),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ButtonBar _buildButtonBar() {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            _onTapAddButton();
          },
          icon: const Icon(Icons.add),
        ),
        IconButton(
          onPressed: () {
            _onTapSubtractButton();
          },
          icon: const Icon(Icons.remove),
        ),
        IconButton(
          onPressed: () {
            _onTapMultiplyButton();
          },
          icon: const Icon(Icons.close),
        ),
        TextButton(
          onPressed: () {
            _onTapDivideButton();
          },
          child: const Text(
            '/',
            style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  void _onTapAddButton() {
    if (_formKey.currentState!.validate()) {
      double firstNum = double.tryParse(_firstNumberController.text) ?? 0;
      double secondNum = double.tryParse(_secondNumberController.text) ?? 0;
      _result = firstNum + secondNum;
      setState(() {});
    }
  }

  void _onTapSubtractButton() {
    if(_formKey.currentState!.validate() == false) {
      return;
    }
    double firstNum = double.tryParse(_firstNumberController.text) ?? 0;
    double secondNum = double.tryParse(_secondNumberController.text) ?? 0;
    _result = firstNum - secondNum;
    setState(() {});
  }

  void _onTapMultiplyButton() {
    if(_formKey.currentState!.validate() == false) {
      return;
    }
    double firstNum = double.tryParse(_firstNumberController.text) ?? 0;
    double secondNum = double.tryParse(_secondNumberController.text) ?? 0;
    _result = firstNum * secondNum;
    setState(() {});
  }

  void _onTapDivideButton() {
    if(_formKey.currentState!.validate() == false) {
      return;
    }
    double firstNum = double.tryParse(_firstNumberController.text) ?? 0;
    double secondNum = double.tryParse(_secondNumberController.text) ?? 0;
    _result = firstNum / secondNum;
    setState(() {});
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _firstNumberController.dispose();
    _secondNumberController.dispose();
    super.dispose();
  }

  // bool _validateTextFields() {
  //   if (_firstNumberController.text.isEmpty) {
  //     return false;
  //   }
  //
  //   if (_secondNumberController.text.isEmpty) {
  //     return false;
  //   }
  //   return true;
  // }
}


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
