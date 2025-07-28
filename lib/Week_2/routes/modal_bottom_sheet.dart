import 'package:flutter/material.dart';

class ModalBottomSheetScreen extends StatefulWidget {
  const ModalBottomSheetScreen({super.key});

  @override
  State<ModalBottomSheetScreen> createState() => _ModalBottomSheetScreenState();
}

class _ModalBottomSheetScreenState extends State<ModalBottomSheetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Modal Bottom Sheet")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _modalBottomSheet();
          },
          child: Text("Modal Bottom Sheet"),
        ),
      ),
    );
  }

  _modalBottomSheet(){
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Center(child: Icon(Icons.local_fire_department_sharp,size: 50,color: Colors.orange,)),
                    Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum"),
                  ],
                ),
              ),
            ),
          );
        },
    );
  }
}
