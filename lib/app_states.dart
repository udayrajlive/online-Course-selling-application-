class AppStates {
  late int counter;
  AppStates({required this.counter});
}

class InitState extends AppStates {
  InitState() : super(counter: 2);
}
