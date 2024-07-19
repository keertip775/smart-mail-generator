import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:smart_email_generator_app/colors.dart';
import 'package:smart_email_generator_app/controller/mail_controller.dart';
import 'package:toastification/toastification.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static String routeName = '';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List tones = [
    "Friendly",
    "Luxury",
    "Relaxed",
    "Profesional",
    "Adventurous",
    "Witty",
    "Persuasive",
    "Bold",
    "Empathetic"
  ];
  int selectedToneIndex = 0;
  int selectednamesIndex = 0;
  List names = ["Short", "Medium", "Long"];
  TextEditingController textController1 = TextEditingController();
  TextEditingController textController2 = TextEditingController();
  TextEditingController textController3 = TextEditingController();

  var border = OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.black,
    ),
    borderRadius: BorderRadius.circular(10),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().secondaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Smart Email Generator",
            style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10),
          width: 600,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("From Name"),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  controller: textController1,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    fillColor: AppColors().textFieldColor,
                    filled: true,
                    hintText: "From Name (Optional)",
                    focusedBorder: border,
                    border: border,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("To Name"),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  controller: textController2,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    fillColor: AppColors().textFieldColor,
                    filled: true,
                    hintText: "To Name (Optional)",
                    focusedBorder: border,
                    border: border,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Key Points*"),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  // enabled: false,
                  controller: textController3,

                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    fillColor: AppColors().textFieldColor,
                    filled: true,
                    hintText: "Enter Topic",
                    focusedBorder: border,
                    border: border,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Select Tone*"),
                SizedBox(
                  height: 15,
                ),
                Wrap(
                  runSpacing: 12,
                  spacing: 25,
                  children: [
                    for (int i = 0; i < tones.length; i++)
                      ElevatedButton(
                        onPressed: () {
                          selectedToneIndex = i;
                          setState(() {});
                        },
                        child: Text(
                          tones[i],
                        ),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: selectedToneIndex == i
                              ? Colors.white
                              : Colors.black,
                          backgroundColor: selectedToneIndex == i
                              ? AppColors.primaryColor
                              : AppColors().textFieldColor,
                          padding: EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 15,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text("Select Length*"),
                SizedBox(
                  height: 15,
                ),
                Wrap(
                  runSpacing: 12,
                  spacing: 25,
                  children: [
                    for (int i = 0; i < names.length; i++)
                      ElevatedButton(
                        onPressed: () {
                          selectednamesIndex = i;
                          setState(() {});
                        },
                        child: Text(names[i]),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: selectednamesIndex == i
                              ? Colors.white
                              : Colors.black,
                          backgroundColor: selectednamesIndex == i
                              ? AppColors.primaryColor
                              : AppColors().textFieldColor,
                          padding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),

                // if you facing that like issue you can use singlechildscrollview wrap with column
                ElevatedButton(
                  onPressed: () async {
                    String input = """
create mail
from name:${textController1.text}
to name:${textController2.text}
key points:${textController3.text}

tone:${tones[selectedToneIndex]}
length:${names[selectednamesIndex]}



 """;
                    print(input);
                    String output = await MailController().generatEmail(input);
                    print(output);
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SelectableText(output),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              Share.share(output);
                                            },
                                            icon: const Icon(
                                              Icons.share,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              FlutterClipboard.copy(output)
                                                  .then((value) =>
                                                      toastification.show(
                                                          context: context,
                                                          autoCloseDuration:
                                                              Duration(
                                                                  seconds: 3),
                                                          title:
                                                              Text("copied")));
                                            },
                                            icon: Icon(
                                              Icons.copy,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ));
                        });
                  },
                  child: Text(
                    "Generate Email",
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        5,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
