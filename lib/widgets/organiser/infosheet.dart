import 'package:campus_event_app/data/color.dart';
import 'package:flutter/material.dart';

void moreInfo(BuildContext context, Function(double?) setRegFee,
    Function(int?) setMp, double? fee, int? mp) {
  final TextEditingController _mp =
          TextEditingController(text: mp != null ? mp.toString() : ""),
      _fees = TextEditingController(text: fee != null ? fee.toString() : "");
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              height: 400,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 233, 233, 233),
                borderRadius: BorderRadius.circular(15),
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Enter additional information",
                        style: TextStyle(fontSize: 16),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.close,
                          size: 16,
                          color: Colors.white,
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          backgroundColor: dd,
                          padding: const EdgeInsets.all(10),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Maximum participants: "),
                      Container(
                        width: 100,
                        child: TextFormField(
                          // onEditingComplete: () {

                          //   setMp(int.tryParse(_mp.text));
                          // },
                          // onFieldSubmitted: (value) {
                          //   setMp(int.tryParse(_mp.text));
                          // },
                          keyboardType: TextInputType.number,
                          controller: _mp,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: d3,
                              ),
                            ),
                          ),
                          cursorColor: dd,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Registration fees:"),
                      Container(
                        width: 100,
                        child: TextFormField(
                          // onEditingComplete: () {
                          //   print(_fees.text);
                          //   setRegFee(double.tryParse(_fees.text));
                          // },
                          // onFieldSubmitted: (value){
                          //   setRegFee(double.tryParse(_fees.text));
                          // },
                          keyboardType: TextInputType.number,
                          controller: _fees,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: d3,
                              ),
                            ),
                          ),
                          cursorColor: dd,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setMp(int.tryParse(_mp.text));
                      setRegFee(double.tryParse(_fees.text));
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Done',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize:
                          Size(double.infinity, 50), // Full-width button
                      overlayColor: d7,
                      backgroundColor: d5,
                    ),
                  )
                ],
              ),
            );
          },
        );
      });
}
