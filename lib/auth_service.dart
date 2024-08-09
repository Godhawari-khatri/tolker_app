import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<User?> signUp(String email, String name, String age, String password, String? imagePath, BuildContext context) async {
    try {
      print("Attempting to sign up user");

      // Create user with email and password
      print("Attempting to create user with email: $email");
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Log successful user creation
      print("User created successfully with UID: ${userCredential.user!.uid}");

      // Upload profile image and get URL
      String? profileImageUrl;
      if (imagePath != null) {
        profileImageUrl = await uploadImage(imagePath);
        if (profileImageUrl == null) {
          print("Failed to upload profile image.");
          return null;
        }
      }

      // Store additional user information in Firestore
      print("Attempting to store user information in Firestore");
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'email': email,
        'name': name,
        'age': age,
        'profileImageUrl': profileImageUrl,
      });
      print("User information stored in Firestore successfully.");

      return userCredential.user;
    } catch (e) {
      print("Error during signup: $e");
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error during signup: $e")),
        );
      }
      return null;
    }
  }

  Future<String?> uploadImage(String imagePath) async {
    try {
      // Set custom retry parameters
      FirebaseStorage storage = FirebaseStorage.instance;
      storage.setMaxOperationRetryTime(const Duration(minutes: 5));
      storage.setMaxUploadRetryTime(const Duration(minutes: 5));
      storage.setMaxDownloadRetryTime(const Duration(minutes: 5));

      final file = File(imagePath);
      if (await file.length() > 15 * 1024 * 1024) { // 5 MB limit
        print("File size exceeds 5 MB limit");
        return null;
      }
      final fileName = DateTime.now().millisecondsSinceEpoch.toString() + '_' + file.uri.pathSegments.last;
      final ref = storage.ref().child('profile_images/$fileName');

      final uploadTask = ref.putFile(file);
      final taskSnapshot = await uploadTask;
      print("Image uploaded successfully to: ${await taskSnapshot.ref.getDownloadURL()}");
      return await taskSnapshot.ref.getDownloadURL();
    } catch (e) {
      print("Error during image upload: $e");
      return null;
    }
  }

  Future<User?> signIn(String email, String password) async {
    try {
      print("Attempting to sign in with email: $email");
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("User signed in with UID: ${userCredential.user!.uid}");
      return userCredential.user;
    } catch (e) {
      print("Error during sign in: $e");
      return null;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
