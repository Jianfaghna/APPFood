import 'package:flutter/material.dart';
import 'dummy_menu.dart';

class HomePage extends StatelessWidget {
  final String username;

  const HomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome, $username!'),
      ),
      body: ListView.builder(
        itemCount: foodMenuList.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            margin: const EdgeInsets.all(8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(foodMenuList[index].imageAsset),
              ),
              title: Text(foodMenuList[index].name),
              subtitle: Text(foodMenuList[index].category),
              trailing: Text(foodMenuList[index].price),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(foodMenuList[index].name),
                      content: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Category: ${foodMenuList[index].category}'),
                            const SizedBox(height: 8),
                            Text(
                                'Description: ${foodMenuList[index].description}'),
                            const SizedBox(height: 8),
                            Text(
                                'Ingredients: ${foodMenuList[index].ingredients}'),
                            const SizedBox(height: 8),
                            Text(
                                'Cooking Time: ${foodMenuList[index].cookingTime}'),
                            const SizedBox(height: 8),
                            Text('Price: ${foodMenuList[index].price}'),
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(
                          child: const Text('Close'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
