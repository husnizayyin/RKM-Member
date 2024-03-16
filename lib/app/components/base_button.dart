import 'package:flutter/material.dart';
import 'package:member_rkm/app/components/base_text.dart';

class BaseButton extends StatelessWidget {
  const BaseButton({
    Key? key,
    required this.label,
    this.onPressed,
    this.bgColor,
    this.fgColor,
  }) : super(key: key);

  final String label;
  final void Function()? onPressed;
  final Color? bgColor;
  final Color? fgColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor: fgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10),
      ),
      onPressed: onPressed,
      child: BaseText(
        text: label,
        bold: FontWeight.w600,
      ),
    );
  }
}

class BaseOutlineButton extends StatelessWidget {
  const BaseOutlineButton({
    Key? key,
    required this.label,
    this.onPressed,
    this.borderColor,
    this.fgColor,
  }) : super(key: key);

  final String label;
  final void Function()? onPressed;
  final Color? borderColor;
  final Color? fgColor;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: fgColor,
        side: BorderSide(
          width: 2,
          color: borderColor ?? Colors.black,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10),
      ),
      onPressed: onPressed,
      child: BaseText(
        text: label,
        bold: FontWeight.w600,
      ),
    );
  }
}

class BaseButtonIcon extends StatelessWidget {
  const BaseButtonIcon({
    Key? key,
    this.bgColor,
    this.fgColor,
    this.ovColor,
    this.onPressed,
    required this.icon,
    required this.label,
  }) : super(key: key);

  final Color? bgColor;
  final Color? fgColor;
  final Color? ovColor;
  final void Function()? onPressed;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(bgColor),
        foregroundColor: MaterialStatePropertyAll(fgColor),
        overlayColor: MaterialStatePropertyAll(ovColor?.withOpacity(0.2)),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      onPressed: onPressed,
      icon: Icon(icon),
      label: BaseText(
        text: label,
        bold: FontWeight.w600,
      ),
    );
  }
}

class BaseOutlineButtonIcon extends StatelessWidget {
  const BaseOutlineButtonIcon({
    Key? key,
    this.fgColor,
    this.borderColor,
    required this.icon,
    required this.label,
    this.onPressed,
  }) : super(key: key);

  final Color? fgColor;
  final Color? borderColor;
  final IconData icon;
  final String label;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      style: ButtonStyle(
          foregroundColor: MaterialStatePropertyAll(fgColor),
          side: MaterialStatePropertyAll(
            BorderSide(
              width: 2,
              color: borderColor ?? Colors.black,
            ),
          ),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          padding: const MaterialStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 10),
          )),
      onPressed: onPressed,
      icon: Icon(icon),
      label: BaseText(
        text: label,
        bold: FontWeight.w600,
      ),
    );
  }
}
