import 'package:course_selling_app/app_bloc.dart';
import 'package:course_selling_app/app_events.dart';
import 'package:course_selling_app/app_states.dart';
import 'package:course_selling_app/pages/welcome/bloc/welcome_blocs.dart';
import 'package:course_selling_app/pages/welcome/welcome.dart';
import 'package:course_selling_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => WelcomeBloc(),
        child: ScreenUtilInit(
          builder: (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.appLightThemeData,
            home: const welcomePage(),
          ),
        ));
  }
}




// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//       ),
//       body: Center(
//           child: BlocBuilder<AppBlocs, AppStates>(builder: (context, AppState) {
//         return Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               "${BlocProvider.of<AppBlocs>(context).state.counter}",
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         );
//       })),
//       floatingActionButton: Row(children: [
//         FloatingActionButton(
//           onPressed: () => BlocProvider.of<AppBlocs>(context).add(Increment()),
//           tooltip: 'Increment',
//           child: const Icon(Icons.add),
//         ),
//         FloatingActionButton(
//           onPressed: () => BlocProvider.of<AppBlocs>(context).add(decrement()),
//           tooltip: 'Decrement',
//           child: const Icon(Icons.remove),
//         ),
//       ]),
//     );
//   }
// }
