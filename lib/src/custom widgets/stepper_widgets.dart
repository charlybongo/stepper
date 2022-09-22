import 'package:flutter/material.dart';

class StepperWidget extends StatelessWidget {
  String title;
  String? description;
  int? index = 1;
  bool show = false;
  bool done = false;
  void Function()? stepForward;
  void Function()? stepBackward;
  StepperWidget({
    super.key,
    this.description,
    this.index,
    required this.title,
    this.stepForward,
    required this.done,
    required this.show,
    this.stepBackward,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(children: [
        Column(
          children: [
            Row(children: [
              Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: done || show ? Colors.blue : Colors.grey.shade400,
                  ),
                  child: Center(
                    child: done
                        ? const Icon(
                            Icons.check,
                            color: Colors.white,
                          )
                        : Text(
                            index.toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                  )),
              const SizedBox(
                width: 20,
              ),
              Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: done || show ? Colors.black : Colors.grey.shade400),
              )
            ]),
          ],
        ),
        show
            ? const SizedBox(
                height: 20,
              )
            : const SizedBox.shrink(),
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: SizedBox(
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, bottom: 10),
                  child: Container(
                    width: 2.0,
                    height: show ? 100 : 20,
                    color: Colors.grey.shade400,
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                show
                    ? Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              description!,
                            ),
                            Row(
                              children: [
                                ElevatedButton(
                                    onPressed: stepForward,
                                    child: Text(
                                        index == 3 ? 'Finish' : 'Continue',
                                        style: const TextStyle(fontSize: 17))),
                                const SizedBox(
                                  width: 10,
                                ),
                                TextButton(
                                    onPressed: stepBackward,
                                    child: Text('BACK',
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: index != 1
                                                ? Colors.blue
                                                : Colors.grey.shade400)))
                              ],
                            )
                          ],
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
