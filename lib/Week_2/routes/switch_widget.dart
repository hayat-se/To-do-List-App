import 'package:flutter/material.dart';


class SwitchWidget extends StatefulWidget {
  const SwitchWidget({super.key});

  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  bool _switchButton = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Switch Button"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text("Productivity Mood"),
                SizedBox(width: 180,),
                Switch(
                  activeColor: Colors.green,
                    activeTrackColor: Colors.green.shade100,
                    value: _switchButton,
                    onChanged:(sw){
                      setState(() {
                        _switchButton = sw;
                      });
                    }
                )
              ],
            ),
          )
        ],
      )
    );
  }
}
