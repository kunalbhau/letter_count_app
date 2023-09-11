import "package:flutter/material.dart";

class CharacterCountWidget extends StatefulWidget {
  @override
  _CharacterCountWidgetState createState() => _CharacterCountWidgetState();
}

class _CharacterCountWidgetState extends State<CharacterCountWidget> {
  List<TextEditingController> _textEditingControllers = [];
  List<Widget> _textFormFields = [];
  int _charCount = 0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _addTextField();
  }

  void _addTextField() {
    final TextEditingController controller = TextEditingController();
    _textEditingControllers.add(controller);

    final Widget textField = Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        controller: controller,
        decoration: const InputDecoration(
          labelText: 'Enter Text',
          border: OutlineInputBorder(),
        ),
        validator: _validateText,
        onChanged: _updateCharCount,
      ),
    );

    setState(() {
      _textFormFields.add(textField);
    });
  }

  void _updateCharCount(String value) {
    setState(() {
      _charCount = _textEditingControllers
          .map((controller) => controller.text.length)
          .reduce((value, element) => value + element);
    });
  }

  @override
  void dispose() {
    for (var controller in _textEditingControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      // Validation passed, you can perform your actions here.
      final List<String> enteredTexts =
          _textEditingControllers.map((controller) => controller.text).toList();

      // Example: Display the entered text in an alert dialog
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Submitted Text'),
            content: Text(enteredTexts.join('\n')),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  // check the text is entered or not //
  String? _validateText(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null; // Return null if the input is valid
  }

  void _removeTextField(int index) {
    if (_textFormFields.length > 1) {
      // Ensure there's at least one text field before removing.
      setState(() {
        _textEditingControllers.removeAt(index);
        _textFormFields.removeAt(index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ..._textFormFields.asMap().entries.map(
              (entry) {
                final index = entry.key;
                final textField = entry.value;
                return Column(
                  children: [
                    textField,
                    if (_textFormFields.length > 1)
                      ElevatedButton(
                        onPressed: () {
                          _removeTextField(index);
                        },
                        child: Text('Remove field'),
                      ),
                  ],
                );
              },
            ),
            Card(
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Character Count: $_charCount',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: _handleSubmit,
                  child: Text('Submit'),
                ),
                ElevatedButton(
                  onPressed: _addTextField,
                  child: Text('Add textboxes'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
