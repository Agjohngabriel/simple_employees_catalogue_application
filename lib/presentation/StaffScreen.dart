import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StaffScreen extends StatefulWidget {
  const StaffScreen({Key? key}) : super(key: key);

  @override
  State<StaffScreen> createState() => _StaffScreenState();
}

List<Map<String, dynamic>> staff = [];
List<Map<String, dynamic>> _filteredStaff = [];

class _StaffScreenState extends State<StaffScreen> {
  TextEditingController searchController = new TextEditingController();

  @override
  void initState(){
    getData();
    super.initState();
  }


  void getData()async{
    String data = await rootBundle.loadString('assets/staff.json');
    List<Map<String, dynamic>> jsonResult = json.decode(data).cast<Map<String,dynamic>>();
    staff = jsonResult;
  }

  void _runFilter(String enteredKeyword){
    List<Map<String, dynamic>> result = [];
    if(enteredKeyword.isEmpty){
      _filteredStaff = staff;
    }else{
      setState(() {
        result = staff
            .where((user) =>
            user["userName"].
            toLowerCase().contains(enteredKeyword.toLowerCase()))
            .toList();
        print(result);
        _filteredStaff = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(color: Color.fromRGBO(212, 218, 218,  0.5)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40,),
            Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: TextFormField(
                onChanged: (String value) {
                  _runFilter(value);
                },
                textInputAction: TextInputAction.next,
                controller: searchController,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                    hintText: "Search Staff by speciality",
                    hintStyle: const TextStyle(fontSize: 16),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    contentPadding: const EdgeInsets.only(
                        top: 20, bottom: 20, right: 20, left: 20),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(10))),
                keyboardType: TextInputType.text,
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 10,),
            Expanded(
                child: _filteredStaff.isNotEmpty?ListView.builder(
              padding: EdgeInsets.all(0),
              itemCount: _filteredStaff.length,
                itemBuilder: (_,index){
                  var staff = _filteredStaff[index];
              return Container(
                width: double.maxFinite,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                    CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider("${staff["imageUrl"]}"),
                      radius: 25,
                    ),
                    SizedBox(width: 10,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${staff["userName"]}", style: TextStyle(color: Colors.black, fontSize: 18,), textAlign: TextAlign.start,),
                        Text("${staff["aveRating"]}", style: TextStyle(color: Colors.black, fontSize: 15,), textAlign: TextAlign.start,),
                      ],
                    )
                  ]
                )
              );
            }):
                ListView.builder(
                    padding: EdgeInsets.all(0),
                    itemCount: staff.length,
                    itemBuilder: (_,index){
                      var staffs = staff[index];
                      return Container(
                          width: double.maxFinite,
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:[
                                CircleAvatar(
                                  backgroundImage: CachedNetworkImageProvider("${staffs["imageUrl"]}"),
                                  radius: 25,
                                ),
                                SizedBox(width: 10,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("${staffs["userName"]}", style: TextStyle(color: Colors.black, fontSize: 18,), textAlign: TextAlign.start,),
                                    Text("${staffs["aveRating"]}", style: TextStyle(color: Colors.black, fontSize: 15,), textAlign: TextAlign.start,),
                                  ],
                                )
                              ]
                          )
                      );
                    })
            )
          ],
        ),
      ),
    );
  }
}
