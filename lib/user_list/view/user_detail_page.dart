import 'package:flutter/material.dart';
import 'package:flutter_user_list_cubit/user_list/user_list.dart';

class UserDetailPage extends StatelessWidget {
  const UserDetailPage({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          user.title,
          style: const TextStyle(color: Color.fromARGB(255, 48, 214, 7)),
        ),
        backgroundColor:
            const Color.fromARGB(255, 16, 14, 126), // Soft purple for app bar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              user.title,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: const Color.fromARGB(
                        255, 38, 113, 154), // Soft blue for title
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 16),
            Text(
              user.body,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 16,
                    color: const Color.fromARGB(
                        255, 5, 173, 70), // Dark grey for body text
                  ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Logic for navigating to the previous post
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(
                        255, 205, 214, 248), // Soft light blue for button
                    foregroundColor: const Color.fromARGB(
                        255, 14, 126, 83), // Soft purple for text
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                  ),
                  child: const Text("Prev"),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Logic for navigating to the next post
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(
                        255, 205, 214, 248), // Soft light blue for button
                    foregroundColor: const Color.fromARGB(
                        255, 14, 126, 42), // Soft purple for text
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                  ),
                  child: const Text("Next"),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Logic for removing the current post
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(
                    255, 146, 199, 2), // Soft pink for delete button
                foregroundColor:
                    const Color.fromARGB(255, 95, 95, 95), // Dark grey for text
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text("Remove"),
            ),
          ],
        ),
      ),
    );
  }
}
