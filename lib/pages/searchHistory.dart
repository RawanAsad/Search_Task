import 'package:flutter/material.dart';
import 'package:saerch_task2/config/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchHistory extends StatelessWidget {
  const SearchHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 198, 183, 244),
        title: Text('Search History'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              child: ListTile(
                leading: Icon(Icons.refresh_rounded,
                    color: Color.fromARGB(255, 198, 183, 244)),
                title: Text(config
                    .get<SharedPreferences>()
                    .getString('search_history')
                    .toString()),
                trailing: Icon(Icons.clear_rounded, color: Color(0xFF8F959E)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
