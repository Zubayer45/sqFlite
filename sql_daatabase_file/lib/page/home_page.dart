import 'package:flutter/material.dart';
import 'package:sql_daatabase_file/db_helper/my_db_helper.dart';
import 'package:sql_daatabase_file/model/contract.dart';
import 'package:sql_daatabase_file/page/new_contact.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Floating Action Button'),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: MyDbHelper.readContact(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Contact>> snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: Column(

                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 20),
                      Text('Loading..'),
                    ]),
              );
            }
            return snapshot.data!.isEmpty
                ? Center(
                    child: Text('vai data nai'),
                  )
                : ListView(
                    children: snapshot.data!
                        .map((e) => Center(
                              child: ListTile(
                                title: Text(e.name),
                                subtitle: Text(e.phone),
                                trailing: IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {},
                                ),
                              ),
                            ))
                        .toList(),
                  );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => NewContact()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}









// <List<Contact>>(
            //   future: MyDbHelper.readContact(),
            //   builder: (BuildContext context,
            //    AsyncSnapshot<List<Contact>> snapshot) {
            //     if (snapshot.connectionState == ConnectionState.waiting) {
            //       return Center(
            //         child: Column(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             CircularProgressIndicator(),
            //             SizedBox(height: 20),
            //             Text('Loading..'),
            //           ],
            //         ),
            //       );
            //     } else if (snapshot.hasError) {
            //       return Center(
            //         child: Text('Error: ${snapshot.error}'),
            //       );
            //     } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            //       return Center(
            //         child: Text('No data found'),
            //       );
            //     }

            //     // Check if snapshot.data is not null before accessing it
            //     List<Contact> contacts = snapshot.data ?? [];

            //     return ListView(
            //       children: contacts.map((Contact contact) {
            //         return Center(
            //           child: ListTile(
            //             title: Text(contact.name),
            //             subtitle: Text(contact.phone),
            //             trailing: IconButton(
            //               icon: Icon(Icons.delete),
            //               onPressed: () {
            //                 // Implement delete functionality here
            //               },
            //             ),
            //           ),
            //         );
            //       }).toList(),
            //     );
            //   },
            // ),