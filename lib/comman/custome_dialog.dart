import 'package:flutter/material.dart';

class CustomAlertDialog extends StatefulWidget {
  const CustomAlertDialog(
      {Key? key,
      this.title,
      this.content,
      this.actions,
      this.barrierDismissible = true})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _CustomAlertDialog();

  final Widget? title;
  final Widget? content;
  final List<Widget>? actions;
  final bool barrierDismissible;

  Future<void> show(BuildContext context) async {
    return await showDialog<void>(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (context) {
          return this;
        });
  }
}

class _CustomAlertDialog extends State<CustomAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: widget.title != null
          ? DefaultTextStyle(
              style:
                  const TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0),
              child: widget.title!)
          : null,
      content: widget.content,
      actions: widget.actions,
    );
  }
}

customDialog(
  BuildContext context, {
  String title = '',
  String message = '',
  VoidCallback? onPressed,
  bool barrierDismissible = true,
}) {
  return CustomAlertDialog(
    barrierDismissible: barrierDismissible,
    title: Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 16.0,
            color: Theme.of(context).textTheme.headlineLarge?.color),
      ),
    ),
    content: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            message,
            style: TextStyle(
              fontSize: 15.0,
              color: Theme.of(context).textTheme.bodyText1?.color,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: onPressed ??
                    () {
                      Navigator.pop(context);
                    },
                child: const Text(
                  'Ok',
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  ).show(context);
}
