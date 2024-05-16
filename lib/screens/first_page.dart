import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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

  ///
  @override
  Widget build(BuildContext context) {
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  (addInfo.studentInfo.isNotEmpty)
                      ? Column(
                          children: [
                            ...addInfo.studentInfo.map(
                              (e) => Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                height:
                                    MediaQuery.of(context).size.height / 6.8,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(12)),
                                  gradient: LinearGradient(
                                    begin: const Alignment(1.00, 0.00),
                                    end: const Alignment(-1, 0),
                                    colors: [
                                      const Color(0xFF33264D).withOpacity(0.5),
                                      backgroundColor,
                                    ],
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: CircleAvatar(
                                        radius: 40,
                                        backgroundImage:
                                            (e['userImage'] != null)
                                                ? FileImage(e['userImage'])
                                                : null,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          // const SizedBox(),
                                          Text(
                                            "Mr. ${e['name']}",
                                            style: FontStyles.subHeading,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "${e['grid']} | ${e['standard']} Std",
                                                style: FontStyles.subHeading,
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                        child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      backgroundColor:
                                                          backgroundColor,
                                                      shape:
                                                          const ContinuousRectangleBorder(),
                                                      title: Text(
                                                        "Edit",
                                                        style:
                                                            FontStyles.heading1,
                                                      ),
                                                      content: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          const Text("Name"),
                                                          TextFormField(
                                                            controller:
                                                                nameController,
                                                            decoration:
                                                                InputDecoration(
                                                              hintText:
                                                                  "${UserDetails.name}",
                                                              contentPadding:
                                                                  const EdgeInsets
                                                                      .all(
                                                                10,
                                                              ),
                                                              border:
                                                                  const OutlineInputBorder(),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              height: 10),
                                                          const Text("GRID"),
                                                          TextFormField(
                                                            controller:
                                                                gridController,
                                                            decoration:
                                                                InputDecoration(
                                                              hintText:
                                                                  "${UserDetails.grid}",
                                                              contentPadding:
                                                                  const EdgeInsets
                                                                      .all(
                                                                10,
                                                              ),
                                                              border:
                                                                  const OutlineInputBorder(),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              height: 10),
                                                          const Text(
                                                              "Standard"),
                                                          TextFormField(
                                                            controller:
                                                                standardController,
                                                            decoration:
                                                                InputDecoration(
                                                              hintText:
                                                                  "${UserDetails.standard}",
                                                              contentPadding:
                                                                  const EdgeInsets
                                                                      .all(
                                                                10,
                                                              ),
                                                              border:
                                                                  const OutlineInputBorder(),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              height: 10),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              GestureDetector(
                                                                onTap: () {
                                                                  // if (nameController.text == UserDetails.name &&
                                                                  //     gridController
                                                                  //             .text ==
                                                                  //         UserDetails
                                                                  //             .grid &&
                                                                  //     standardController
                                                                  //             .text ==
                                                                  //         UserDetails
                                                                  //             .standard) {
                                                                  //   ScaffoldMessenger.of(
                                                                  //           context)
                                                                  //       .showSnackBar(
                                                                  //     const SnackBar(
                                                                  //       content:
                                                                  //           Text("Enter Information First"),
                                                                  //     ),
                                                                  //   );
                                                                  // } else {
                                                                  // UserDetails
                                                                  //         .name =
                                                                  //     nameController
                                                                  //         .text;
                                                                  // UserDetails
                                                                  //         .grid =
                                                                  //     gridController
                                                                  //         .text;
                                                                  // UserDetails
                                                                  //         .standard =
                                                                  //     standardController
                                                                  //         .text;
                                                                  // }
                                                                },
                                                                child:
                                                                    Container(
                                                                  height: 30,
                                                                  width: 80,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .blue
                                                                        .withOpacity(
                                                                            0.4),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                  ),
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          10),
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  child:
                                                                      const Text(
                                                                          "Save"),
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                  width: 10),
                                                              GestureDetector(
                                                                onTap: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                child:
                                                                    Container(
                                                                  height: 30,
                                                                  width: 80,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .blue
                                                                        .withOpacity(
                                                                            0.4),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                  ),
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          10),
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  child:
                                                                      const Text(
                                                                    "Cancel",
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    );
                                                  });
                                            },
                                            child: const Icon(
                                              Icons.edit,
                                              size: 20,
                                              color: Colors.white,
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                ///
                                                (addInfo.studentInfo.remove(e));
                                              });
                                            },
                                            child: const Icon(
                                              Icons.delete,
                                              size: 20,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      : Column(
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
                          ],
                        ),
                ],
              ),
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
                                    UserDetails.name = nameController.text;
                                    UserDetails.grid = gridController.text;
                                    UserDetails.standard =
                                        standardController.text;

                                    ///
                                    setState(() {
                                      ///
                                      Map<String, dynamic> userDetailsMap = {
                                        'name': UserDetails.name,
                                        'standard': UserDetails.standard,
                                        'grid': UserDetails.grid,
                                        'userImage':
                                            UserDetails.userImage as File,
                                      };
                                      addInfo.studentInfo.add(userDetailsMap);
                                      // print(userDetailsMap);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              "Your Information Saved Successfully"),
                                        ),
                                      );
                                      Navigator.of(context).pop();
                                      UserDetails.userImage = null;
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
