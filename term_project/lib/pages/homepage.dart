import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:term_project/helpers/api_caller.dart';
import 'package:term_project/helpers/dialog_utils.dart';
import 'package:term_project/models/todo_items.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProductsList _todoItems = ProductsList();
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    _loadTodoItems();
  }

  Future<void> _loadTodoItems() async {
    try {
      final data = await ApiCaller().get("todos");
      // ข้อมูลที่ได้จาก API นี้จะเป็น JSON array ดังนั้นต้องใช้ List รับค่าจาก jsonDecode()
      // List list = jsonDecode(data);
      setState(() {
        _todoItems =  ProductsList.fromJson(jsonDecode(data));
        _isLoading = false;
      });
    } on Exception catch (e) {
      showOkDialog(context: context, title: "Error", message: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    // var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Final Demo'),
      ),
      body: _isLoading ? 
      Text('TEST')
      :
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(child: Text('Todo List', )),
            const SizedBox(height: 8.0),
            Expanded(
              child: ListView.builder(
                itemCount: _todoItems.products!.length,
                itemBuilder: (context, index) {
                  final item = _todoItems.products![index];
                  return Card(
                    child: ListTile(
                      title: Text(item.title!),
                      subtitle: Text('Description: ${item.description!}'),
                      trailing: Image.network(item.images![0].toString(),),
                      onTap: () {
                        print(item.images![0]);
                      },
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24.0),

            // ปุ่มทดสอบ POST API
          //ElevatedButton(
           //   onPressed: _handleApiPost,
          //    child: const Text('Test POST API'),
           // ),

            const SizedBox(height: 8.0),

            // ปุ่มทดสอบ OK Dialog
           // ElevatedButton(
          //    onPressed: _handleShowDialog,
          //    child: const Text('Show OK Dialog'),
          //  ),
          ],
        ),
      ),
    );
  }
}