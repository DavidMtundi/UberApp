import 'package:flutter/material.dart';
import 'package:uberdriver/helpers/screen_navigation.dart';
import 'package:uberdriver/otherauthscreens/loginpage.dart';
import 'package:uberdriver/otherauthscreens/widgets/otherauthwidgets.dart';

class MultiRegister extends StatefulWidget {
  MultiRegister({Key? key}) : super(key: key);

  @override
  State<MultiRegister> createState() => _MultiRegisterState();
}

class _MultiRegisterState extends State<MultiRegister> {
  int _activeStepIndex = 0;

  /// The method for [DateRangePickerSelectionChanged] callback, which will be
  /// called whenever a selection changed on the date picker widget.
  Widget testContainer(int value) {
    return Container();
  }

  List<Step> stepList() => [
        Step(
          state: _activeStepIndex <= 0 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 0,
          title: const Text('1'),
          // content: testContainer(1)
          content: screen2(context),
        ),
        Step(
          state: _activeStepIndex <= 0 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 0,
          title: const Text('2'),
          //content: testContainer(1)
          content: screen3(context),
        ),
        Step(
          state: _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 1,
          title: const Text('3'),
          //content: testContainer(1)

          content: screen4(context),
        ),
        Step(
            state: StepState.complete,
            isActive: _activeStepIndex >= 2,
            title: const Text('4'),
            //  content: testContainer(1))
            content: screen5(context)),
      ];

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: _theme.scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            }
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Stepper(
          type: StepperType.horizontal,
          currentStep: _activeStepIndex,
          steps: stepList(),
          onStepContinue: () {
            if (_activeStepIndex < (stepList().length - 1)) {
              setState(() {
                _activeStepIndex += 1;
              });
            } else {
              print('Submited');
              changeScreenReplacement(context, Login());
            }
          },
          onStepCancel: () {
            if (_activeStepIndex == 0) {
              return;
            }
            setState(() {
              _activeStepIndex -= 1;
            });
          },
          onStepTapped: (int index) {
            setState(() {
              _activeStepIndex = index;
            });
          },
        ),
      ),
    );
  }
}
