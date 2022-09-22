import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stepper/src/custom%20widgets/stepper_widgets.dart';

class CampaignScreen extends StatefulWidget {
  const CampaignScreen({super.key});

  @override
  State<CampaignScreen> createState() => _CampaignScreenState();
}

class _CampaignScreenState extends State<CampaignScreen> {
  List<dynamic>? documents;
  bool widget1 = false;
  bool widget2 = false;
  bool widget3 = false;
  bool finished = false;
  bool done1 = false;
  bool done2 = false;
  bool done3 = false;

  @override
  void initState() {
    super.initState();
    widget1 = true;
    _getDocuments();
  }

  Future<List<dynamic>> _getDocuments() async {
    MethodChannel methodChannel =
        const MethodChannel('flutter/MethodChannelDemo');
    List<dynamic> documentList = [""];
    try {
      documentList = await methodChannel.invokeMethod("Documents");
    } on PlatformException {
      // just ignore the exception
      print("exception");
    }

    setState(() {
      documents = documentList;
    });
    return documents!;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Center(
              child: Column(
            children: [
              StepperWidget(
                title: 'Select Campaign settings',
                description: documents != null ? documents![0] : '',
                index: 1,
                show: widget1,
                done: done1,
                stepForward: () {
                  setState(() {
                    done1 = true;
                    widget2 = true;
                    widget1 = false;
                  });
                },
              ),
              StepperWidget(
                title: 'Create an ad group',
                description: documents != null ? documents![1] : '',
                index: 2,
                show: widget2,
                done: done2,
                stepBackward: () {
                  setState(() {
                    done1 = false;
                    widget2 = false;
                    widget1 = true;
                  });
                },
                stepForward: () {
                  setState(() {
                    done2 = true;
                    widget3 = true;
                    widget2 = false;
                  });
                },
              ),
              StepperWidget(
                title: 'Create an ad',
                description: documents != null ? documents![2] : '',
                index: 3,
                show: widget3,
                done: done3,
                stepForward: () {},
                stepBackward: () {
                  setState(() {
                    done2 = false;
                    widget3 = false;
                    widget2 = true;
                  });
                },
              ),
            ],
          )),
        ),
      ),
    );
  }
}
