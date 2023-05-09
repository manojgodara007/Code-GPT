import 'package:end_gam/api_key.dart';
import 'package:end_gam/colour.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? dropValue;
  var textController = TextEditingController();
  String textc = "";
  var isLoded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Code GPT",
          style: TextStyle(
            fontFamily: "Head",
            color: witheColour,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 44,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 1),
                        decoration: BoxDecoration(
                          color: witheColour,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextFormField(
                          controller: textController,
                          decoration: const InputDecoration(
                              hintText: "Enter Promt",
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                  ],
                ),
                SizedBox(
                    width: 300,
                    height: 44,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: btnColour,
                            shape: const StadiumBorder()),
                        onPressed: () async {
                          if (textController.text.isNotEmpty) {
                            setState(() {
                              isLoded = false;
                            });
                            textc = await Api.generateTxet(textController.text);
                            setState(() {
                              isLoded = true;
                            });
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Plese enter taxt"),
                            ));
                          }
                        },
                        child: const Text("Generate"))),
              ],
            )),
            Expanded(
              flex: 4,
              child: isLoded
                  ? SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: SelectableText(
                        textc,
                        style:
                            const TextStyle(color: witheColour, fontSize: 16.0),
                      ),
                    )
                  : Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: witheColour),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/lod5.gif"),
                          const SizedBox(height: 12),
                          const Text(
                            "Code is Loading......",
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          )
                        ],
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
