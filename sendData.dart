// import 'package:firebase_database/firebase_database.dart';

// Future<void> sendData(double latitude, double longitude) async {
//   final DatabaseReference database = FirebaseDatabase.instance.ref();

//   try {
//     print("Attempting to send data: $latitude and $longitude");
    
//     await database.child('Location').push().set({
//       "latitude": latitude,
//       "longitude": longitude,
//       "timestamp": DateTime.now().toString(),
//     });

//     print("Data sent successfully!");
//   } catch (error) {
//     print("Error sending data: $error");
//   }
// }
