import 'package:flutter/material.dart';
import 'package:flutter_carwash/widgets/custom_text_widget.dart';

class BookingSteps extends StatefulWidget {
  const BookingSteps({super.key});

  @override
  State<BookingSteps> createState() => _BookingStepsState();
}

class _BookingStepsState extends State<BookingSteps> {
  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stepper(
        physics: const AlwaysScrollableScrollPhysics(),
        type: StepperType.vertical,
        steps: getSteps(),
        onStepTapped: (value) {
          setState(() {
            _currentStep = value;
          });
        },
        currentStep: _currentStep,
        onStepContinue: () {
          if (_currentStep != getSteps().length - 1) {
            final isLastStep = _currentStep == getSteps().length - 1;
            if (isLastStep) {
              print('Last Step');
            }
            setState(() {
              _currentStep += 1;
            });
          }
        },
        onStepCancel: () {
          if (_currentStep != 0) {
            setState(() {
              _currentStep -= 1;
            });
          }
        },
      ),
    );
  }

  List<Step> getSteps() => [
        Step(
            isActive: _currentStep >= 0,
            title: CustomTextWidget(text: 'Car Selection'),
            content: Container()),
        Step(
          isActive: _currentStep >= 1,
          title: CustomTextWidget(text: 'Location'),
          content: Container(),
        ),
        Step(
          isActive: _currentStep >= 2,
          title: CustomTextWidget(text: 'Station'),
          content: Container(),
        ),
        Step(
            isActive: _currentStep >= 3,
            title: CustomTextWidget(text: 'Services'),
            content: Container()),
        Step(
          isActive: _currentStep >= 4,
          title: CustomTextWidget(text: 'Payments'),
          content: Container(),
        ),
      ];
}
