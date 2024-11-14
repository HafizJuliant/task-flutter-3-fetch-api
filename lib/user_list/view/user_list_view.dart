part of "user_list_page.dart";

class UserListView extends StatelessWidget {
  const UserListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
        backgroundColor:
            const Color.fromARGB(255, 0, 102, 204), // Ubah warna app bar
        centerTitle: true,
      ),
      body:
          BlocBuilder<UserListCubit, UserListState>(builder: (context, state) {
        if (state is UserListSuccess) {
          // Success
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (context, index) {
                var user = state.users[index];
                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: const Color.fromARGB(
                          255, 255, 87, 34), // Ganti warna lingkaran
                      child: Text(
                        user.title.substring(0, 1).toUpperCase(),
                        style: const TextStyle(
                            color: Color.fromARGB(255, 223, 171,
                                3)), // Warna teks dalam lingkaran
                      ),
                    ),
                    title: Text(
                      user.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color.fromARGB(
                            255, 33, 33, 33), // Ganti warna teks judul
                      ),
                    ),
                    subtitle: Text(
                      user.body.length > 50
                          ? user.body.substring(0, 50) + '...'
                          : user.body,
                      style: const TextStyle(color: Colors.black54),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => UserDetailPage(user: user),
                        ),
                      );
                    },
                    onLongPress: () {
                      // Memanggil fungsi untuk menampilkan konfirmasi
                      _showDeleteConfirmationDialog(context, user);
                    },
                  ),
                );
              },
            ),
          );
        } else if (state is UserListError) {
          // Error
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  color: const Color.fromARGB(
                      255, 244, 67, 54), // Ubah warna ikon error
                  size: 48,
                ),
                const SizedBox(height: 16),
                Text(
                  state.errorMessage,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 18,
                      color:
                          Color.fromARGB(255, 72, 72, 72)), // Warna teks error
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  label: const Text("Reload Data"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(
                        255, 255, 152, 0), // Ubah warna tombol
                    foregroundColor: Colors.white, // Warna teks dan ikon
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () => context.read<UserListCubit>().fetchUser(),
                ),
              ],
            ),
          );
        } else if (state is UserListLoading) {
          // Loading
          return const Center(
            child: CircularProgressIndicator(
              color: Color.fromARGB(
                  255, 33, 150, 243), // Ubah warna indikator loading
            ),
          );
        } else {
          // Initial / First time
          return Center(
            child: ElevatedButton.icon(
              label: const Text("Reload Data"),
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    const Color.fromARGB(255, 76, 175, 80), // Ubah warna tombol
              ),
              onPressed: () => context.read<UserListCubit>().fetchUser(),
            ),
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<UserListCubit>().fetchUser(),
        backgroundColor:
            const Color.fromARGB(255, 0, 188, 212), // Ubah warna tombol refresh
        child: const Icon(Icons.refresh),
      ),
    );
  }

  // Fungsi untuk menampilkan konfirmasi sebelum menghapus data
  void _showDeleteConfirmationDialog(BuildContext context, User user) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Deletion"),
          content: const Text("Are you sure you want to remove this post?"),
          actions: <Widget>[
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context)
                    .pop(); // Menutup dialog tanpa menghapus data
              },
            ),
            TextButton(
              child: const Text("Remove"),
              onPressed: () {
                // Memanggil removeData jika user memilih untuk menghapus
                context.read<UserListCubit>().removeData(user);
                Navigator.of(context).pop(); // Menutup dialog setelah menghapus
              },
            ),
          ],
        );
      },
    );
  }
}
