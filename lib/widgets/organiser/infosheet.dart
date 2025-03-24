import 'package:flutter/material.dart';

void moreInfo(
    BuildContext context, Function(double?) setRegFee, Function(int?) setMp, double? fee, int? mp) {
  final TextEditingController _mp = TextEditingController(text: mp!=null? mp.toString(): ""),
      _fees = TextEditingController(text: fee!=null? fee.toString(): "");
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              height: 400,
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
                          color: const Color.fromARGB(255, 47, 45, 45),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
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
                          ),
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
                          ),
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
                    child: Text('Done'),
                    style: ElevatedButton.styleFrom(
                      minimumSize:
                          Size(double.infinity, 50), // Full-width button
                    ),
                  )
                ],
              ),
            );
          },
        );
      });
}
