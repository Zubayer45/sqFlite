// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NewContact extends StatefulWidget {
  const NewContact({super.key});

  @override
  State<NewContact> createState() => _NewContactState();
}

class _NewContactState extends State<NewContact> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _nameController = TextEditingController();
    TextEditingController _phoneController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('New contact'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Container(
          child: Column(
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                    label: Text('Name'),
                    hintText: 'Please input name ',
                    prefixIcon: Icon(Icons.person)),
              ),
              SizedBox(height: 18),
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                    label: Text('Phone'),
                    hintText: 'Please input Phone number',
                    prefixIcon: Icon(Icons.call)),
              ),
              SizedBox(height: 18),
              ElevatedButton(
                  onPressed: () {
                    // Navigator.push(context, route)
                  },
                  child: Text('Save Contact'))
            ],
          ),
        ),
      ),
    );
  }
}
