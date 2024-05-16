import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_sphere/model/colors.dart';
import 'package:student_sphere/model/fonts_styles.dart';
import 'package:student_sphere/utils/utils.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  void pickImageFromCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? imagePicker =
        await picker.pickImage(source: ImageSource.camera);

    if (imagePicker != null) {
      File fiePicker = File(imagePicker.path);
      setState(() {
        UserDetails.userImage = fiePicker;
      });
    }
  }

  void pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? imagePicker =
        await picker.pickImage(source: ImageSource.gallery);

    if (imagePicker != null) {
      File fiePicker = File(imagePicker.path);
      setState(() {
        UserDetails.userImage = fiePicker;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ShowUserDetails userDetails = ShowUserDetails();
    // userDetails.getUserDetailsList();
    print("${userDetails.details}");

    TextEditingController nameController = TextEditingController();
    TextEditingController gridController = TextEditingController();
    TextEditingController standardController = TextEditingController();
    GlobalKey<FormState> textKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "StudentSphere",
          style: FontStyles.heading1,
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 48,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/started/getting.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height - 170,
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "No Data Available",
                            style: FontStyles.primaryHeading,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "''+ To create new data''",
                            style: FontStyles.primaryHeading,
                          ),
                        ],
                      ),
                    ),
                    (userDetails.details.isEmpty)
                        ? Container(
                            height: MediaQuery.of(context).size.height / 6,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              gradient: LinearGradient(
                                begin: Alignment(1.00, 0.00),
                                end: Alignment(-1, 0),
                                colors: [Color(0xFF49326E), Color(0xFF33264D)],
                              ),
                            ),
                            child: Row(
                              children: [
                                const Expanded(
                                  child: CircleAvatar(
                                    radius: 40,
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Text(
                                        "Good Morning",
                                        style: FontStyles.heading1,
                                      ),
                                      Text(
                                        "Mr. ${ShowUserDetails}",
                                        style: FontStyles.subHeading,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "${ShowUserDetails} | ${ShowUserDetails} Years",
                                            style: FontStyles.subHeading,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container()
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(10),
        child: FloatingActionButton(
          elevation: 18,
          backgroundColor: backgroundColor.withOpacity(0.9),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    shape: const BeveledRectangleBorder(),
                    backgroundColor: backgroundColor,
                    title:
                        Text("Fill Out All Data", style: FontStyles.subHeading),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 40,
                                    backgroundImage:
                                        (UserDetails.userImage != null)
                                            ? FileImage(UserDetails.userImage)
                                            : null,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              backgroundColor: backgroundColor,
                                              shape:
                                                  const BeveledRectangleBorder(),
                                              title: const Text(
                                                "Pick Image From",
                                              ),
                                              content: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            pickImageFromCamera();
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Container(
                                                            height: 30,
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                              horizontal: 10,
                                                            ),
                                                            color:
                                                                backgroundColor
                                                                    .withOpacity(
                                                                        0.3),
                                                            alignment: Alignment
                                                                .center,
                                                            child: const Text(
                                                              "Camera",
                                                              style: TextStyle(
                                                                color:
                                                                    Colors.blue,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            pickImageFromGallery();
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Container(
                                                            height: 30,
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                              horizontal: 10,
                                                            ),
                                                            color:
                                                                backgroundColor
                                                                    .withOpacity(
                                                                        0.3),
                                                            alignment: Alignment
                                                                .center,
                                                            child: const Text(
                                                              "Gallery",
                                                              style: TextStyle(
                                                                color:
                                                                    Colors.blue,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            );
                                          });
                                    },
                                    child: const CircleAvatar(
                                      radius: 10,
                                      backgroundColor: Colors.transparent,
                                      child: Icon(
                                        Icons.add,
                                        size: 20,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text("Add Image Here"),
                          ],
                        ),
                        Form(
                          key: textKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Name"),
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Enter Standard First";
                                  }
                                  return null;
                                },
                                controller: nameController,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  hintText: "Enter Your Name",
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text("GRID"),
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Enter GRID First";
                                  }
                                  return null;
                                },
                                controller: gridController,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  hintText: "Enter Your GRID",
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text("Standard"),
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Enter Standard First";
                                  }
                                  return null;
                                },
                                controller: standardController,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  hintText: "Enter Your Standard",
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (textKey.currentState!.validate()) {
                                    UserDetails.name = UserDetails.name;
                                    UserDetails.grid = UserDetails.grid;
                                    UserDetails.standard = UserDetails.standard;
                                    setState(() {
                                      userDetails.getUserDetailsList();

                                      ///
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              "Your Information Saved Successfully"),
                                        ),
                                      );
                                      Navigator.of(context).pop();
                                    });
                                  }
                                },
                                child: Container(
                                  height: 30,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.blue.withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  alignment: Alignment.center,
                                  child: const Text("Save"),
                                ),
                              ),
                              const SizedBox(width: 10),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                  height: 30,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.blue.withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  alignment: Alignment.center,
                                  child: const Text("Cancel"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}