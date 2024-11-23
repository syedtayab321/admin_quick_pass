import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserBookingPage extends StatelessWidget {
  const UserBookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Booking Details"),
        backgroundColor: Colors.teal,
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('booking')
            .doc('6ZxA3wl7EO2Wq8FSDcYB')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text('Error fetching data'));
          }

          if (!snapshot.hasData) {
            return const Center(child: Text('No data found'));
          }

          var data = snapshot.data!.data() as Map<String, dynamic>;

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                // Profile Image
                Center(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(data['imageUrl']),
                  ),
                ),
                const SizedBox(height: 20),

                // User Info Section
                Text(
                  'Name: ${data['userName']}',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Email: ${data['userEmail']}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Text(
                  'User ID: ${data['userID']}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),

                // Booking Details Section
                Text(
                  'Booking From: ${data['applyingFrom']}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Booking To: ${data['applyingTo']}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Text(
                  'Status: ${data['status']}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: data['status'] == 'pending' ? Colors.orange : Colors.green,
                  ),
                ),
                const SizedBox(height: 20),

                // Document URL Section
                Text(
                  'Document URL:',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 5),
                GestureDetector(
                  onTap: () {
                    // Open document in browser or show preview
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: Image.network(data['documentUrl']),
                      ),
                    );
                  },
                  child: Text(
                    data['documentUrl'],
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Visa URL Section
                Text(
                  'Visa URL:',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 5),
                GestureDetector(
                  onTap: () {
                    // Open visa in browser or show preview
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: Image.network(data['visaUrl']),
                      ),
                    );
                  },
                  child: Text(
                    data['visaUrl'],
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Created At Section
                Text(
                  'Created At: ${data['createdAt'].toDate().toString()}',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
