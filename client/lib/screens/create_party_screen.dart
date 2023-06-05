import 'package:flutter/material.dart';
import 'package:party/api_service.dart';

class CreatePartyScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _partyNameController = TextEditingController();

  CreatePartyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a Party'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            // Other form fields...

            TextFormField(
              controller: _partyNameController,
              decoration: const InputDecoration(labelText: 'Party Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a party name';
                }
                return null;
              },
            ),

            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, create the party
                  ApiService apiService = ApiService();
                  await apiService.createParty(_partyNameController.text);
                  // Then, navigate back to the previous screen
                  Navigator.pop(context);
                }
              },
              child: const Text('Create Party'),
            ),
          ],
        ),
      ),
    );
  }
}
