class Setting {
  final String title;
  final String? subtitle;
  final void Function() onPressed;
  final bool isSwitch;

  Setting({
    required this.title,
    this.subtitle,
    required this.onPressed,
    required this.isSwitch,
  });
}
