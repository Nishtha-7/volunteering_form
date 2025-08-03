import 'package:flutter/material.dart';

class VolunteerFormPage extends StatefulWidget {
  @override
  _VolunteerFormPageState createState() => _VolunteerFormPageState();
}

class _VolunteerFormPageState extends State<VolunteerFormPage> {
  final _formKey = GlobalKey<FormState>();

  String name = '';
  String phone = '';
  String city = '';

  // Local storage (in memory)
  List<Map<String, String>> volunteers = [];

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      setState(() {
        // Add form data to local list
        volunteers.add({
          'name': name,
          'phone': phone,
          'city': city,
        });

        // Reset form
        _formKey.currentState!.reset();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Name'),
                    onSaved: (val) => name = val!,
                    validator: (val) => val!.isEmpty ? 'Please enter name' : null,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Phone'),
                    keyboardType: TextInputType.phone,
                    onSaved: (val) => phone = val!,
                    validator: (val) => val!.isEmpty ? 'Please enter phone' : null,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'City'),
                    onSaved: (val) => city = val!,
                    validator: (val) => val!.isEmpty ? 'Please enter city' : null,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: const Text('Submit'),
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),
            const Divider(),
            const Text(
              'Submitted Volunteers',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              itemCount: volunteers.length,
              itemBuilder: (context, index) {
                final v = volunteers[index];
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(child: Text(v['name']![0])),
                    title: Text(v['name']!),
                    subtitle: Text('Phone: ${v['phone']!} | City: ${v['city']!}'),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
