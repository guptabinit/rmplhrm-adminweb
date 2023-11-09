import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rmpl_hrm_admin/components/notification_card.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.only(left: 16, right: 16),
        margin: const EdgeInsets.only(top: 0),
        decoration: const BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.fast),
          child: Container(
            margin: const EdgeInsets.only(top: 16),
            child: StreamBuilder(
              stream: FirebaseFirestore.instance.collection('notifications').where('branch', isEqualTo: 'Delhi').snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: primaryColor,
                    ),
                  );
                }

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    Map<String, dynamic> snap = snapshot.data!.docs[index].data();

                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      child: NotificationCard(snap: snap),
                    );
                  },

                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
