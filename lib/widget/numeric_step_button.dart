import 'package:flutter/material.dart';

class NumericStepButton extends StatefulWidget {
  final double minValue;
  final double maxValue;
  final double step;
  final ValueChanged<double> onChanged;

  NumericStepButton({
    required Key key,
    this.minValue = 0.0,
    this.maxValue = 100.0,
    this.step =
        0.000001, // Default step can be adjusted based on your requirements
    required this.onChanged,
  }) : super(key: key);

  @override
  State<NumericStepButton> createState() => _NumericStepButtonState();
}

class _NumericStepButtonState extends State<NumericStepButton> {
  double counter = 0.0; // Initialize with double

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(
              Icons.remove,
              color: Theme.of(context).colorScheme.secondary,
            ),
            padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 0.0),
            iconSize: 20.0,
            onPressed: () {
              setState(() {
                counter = (counter - widget.step) < widget.minValue
                    ? widget.minValue
                    : counter - widget.step;
                widget.onChanged(counter);
              });
            },
          ),
          Text(
            counter.toStringAsFixed(5), // Set to 6 decimal places
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.add,
              color: Theme.of(context).colorScheme.secondary,
            ),
            padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 18.0),
            iconSize: 20.0,
            onPressed: () {
              setState(() {
                counter = (counter + widget.step) > widget.maxValue
                    ? widget.maxValue
                    : counter + widget.step;
                widget.onChanged(counter);
              });
            },
          ),
        ],
      ),
    );
  }
}
