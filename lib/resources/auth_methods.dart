import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:rmpl_hrm_admin/models/admin_model.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<AdminModel> getAdminDetails() async {
    final currentAdmin = _auth.currentUser!;

    final DocumentSnapshot snap = await _firestore.collection('admin').doc(currentAdmin.uid).get();

    return AdminModel.fromSnap(snap);
  }

  Future<String> loginAdmin({
    required String email,
    required String password,
  }) async {
    var res = 'Some error occurred';
    try {
      if(email.isNotEmpty || password.isNotEmpty){
        await _auth.signInWithEmailAndPassword(email: email, password: password);
        res = 'success';
      } else {
        res = 'Please enter all the fields';
      }
    } catch(err){
      res = err.toString();
    }
    return res;
  }

  // logging out a signed in user
  Future<String> signOut() async {
    var res = 'Some error occurred';
    try {
      await _auth.signOut();
      res = 'success';
    } catch (e) {
      res = e.toString();
    }

    return res;
  }

}