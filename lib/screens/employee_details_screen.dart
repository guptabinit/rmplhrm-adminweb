import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rmpl_hrm_admin/components/tabs/employee_tab.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:rmpl_hrm_admin/utils/box.dart';

class EmployeeDetailScreen extends StatefulWidget {
  final String branch;
  const EmployeeDetailScreen({super.key, required this.branch});

  static Route<void> route({
    required String branch,
  }) =>
      MaterialPageRoute(
        builder: (_) => EmployeeDetailScreen(
          branch: branch,
        ),
      );

  @override
  State<EmployeeDetailScreen> createState() => _EmployeeDetailScreenState();
}

class _EmployeeDetailScreenState extends State<EmployeeDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Container(
        height: double.infinity,
        margin: const EdgeInsets.only(top: 0),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: const BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // search button
              InkWell(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(36),
                    boxShadow: const [
                      BoxShadow(
                        color: lightGreyColor,
                        offset: Offset(1, 1),
                        blurRadius: 6,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Row(
                    children: <Widget>[
                      const Icon(
                        Icons.search,
                        color: textGreyColor,
                      ),
                      8.widthBox,
                      const Text(
                        "Search employee",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: textGreyColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              16.heightBox,
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('employees')
                    .where('branch', isEqualTo: widget.branch)
                    .snapshots(),
                builder: (context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: primaryColor,
                      ),
                    );
                  }

                  return snapshot.data!.docs.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (BuildContext context, int index) {
                            Map<String, dynamic> snap =
                                snapshot.data!.docs[index].data();

                            return Container(
                              margin: const EdgeInsets.only(bottom: 12),
                              child: EmployeeTab(
                                snap: snap,
                              ),
                            );
                          },
                        )
                      : Center(
                          child: CachedNetworkImage(
                            width: MediaQuery.of(context).size.width * 0.7,
                            imageUrl:
                                "https://img.freepik.com/free-vector/empty-concept-illustration_114360-7416.jpg",
                            fit: BoxFit.fitWidth,
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) => Center(
                                    child: CircularProgressIndicator(
                                        value: downloadProgress.progress)),
                            errorWidget: (context, url, error) =>
                                const Center(child: Icon(Icons.error)),
                          ),
                        );
                },
              ),
              12.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}
