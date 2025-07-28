import 'package:flutter/material.dart';

class DropDownMenuWidget extends StatefulWidget {
  const DropDownMenuWidget({super.key});

  @override
  State<DropDownMenuWidget> createState() => _DropDownMenuWidgetState();
}

class _DropDownMenuWidgetState extends State<DropDownMenuWidget> {
  List<String> itemsList = ["Please select Country","Pakistan", "Palestine", "Bangladesh", "Srilanka"];
  String? currentItem;

  @override
  void initState() {
    currentItem = itemsList[0];
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dropdown Button")),
      body: Center(
        child: Container(
          padding: EdgeInsetsGeometry.symmetric(vertical: 5,horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            border: Border(),
            borderRadius: BorderRadius.all(Radius.circular(115))
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              isExpanded: true,
              value: currentItem,
              items: itemsList.map((item) {
                return DropdownMenuItem(
                  value: item,
                    child: Text(item));
              }).toList(),
              onChanged: (item){
                setState(() {
                  currentItem = item!;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
