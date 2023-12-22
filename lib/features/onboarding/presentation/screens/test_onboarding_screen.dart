// import 'package:flutter/material.dart';

// class OnboardingScreen extends StatefulWidget {
//   const OnboardingScreen({super.key});

//   @override
//   State<OnboardingScreen> createState() => _OnboardingScreenState();
// }

// class _OnboardingScreenState extends State<OnboardingScreen> {
//   late PageController _pageController;
//   int currentIndex = 0;

//   static const _kDuration = Duration(milliseconds: 300);
//   static const _kCurve = Curves.ease;

//   nextFunction() {
//     _pageController.nextPage(duration: _kDuration, curve: _kCurve);
//   }

//   previousFunction() {
//     _pageController.previousPage(duration: _kDuration, curve: _kCurve);
//   }

//   onChangedFunction(int index) {
//     setState(() {
//       currentIndex = index;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController();
//   }

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: <Widget>[
//           PageView(
//             controller: _pageController,
//             onPageChanged: onChangedFunction,
//             children: const [
//               Center(child: Text("First Screen")),
//               Center(child: Text("Second Screen")),
//               Center(child: Text("Third Screen"))
//             ],
//           ),
//           Positioned(
//             bottom: 60,
//             left: 150,
//             child: Row(
//               mainAxisSize: MainAxisSize.max,
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 Indicator(
//                   positionIndex: 0,
//                   currentIndex: currentIndex,
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 Indicator(
//                   positionIndex: 1,
//                   currentIndex: currentIndex,
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 Indicator(
//                   positionIndex: 2,
//                   currentIndex: currentIndex,
//                 ),
//               ],
//             ),
//           ),
//           Positioned(
//             bottom: 30,
//             left: 130,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//               child: Row(
//                 mainAxisSize: MainAxisSize.max,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   InkWell(
//                       onTap: () => previousFunction(),
//                       child: const Text("Previous")),
//                   const SizedBox(
//                     width: 50,
//                   ),
//                   InkWell(
//                       onTap: () => nextFunction(), child: const Text("Next"))
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// class Indicator extends StatelessWidget {
//   final int positionIndex, currentIndex;
//   const Indicator(
//       {super.key, required this.currentIndex, required this.positionIndex});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 12,
//       width: 12,
//       decoration: BoxDecoration(
//           border: Border.all(color: Colors.blue),
//           color:
//               positionIndex == currentIndex ? Colors.blue : Colors.transparent,
//           borderRadius: BorderRadius.circular(100)),
//     );
//   }
// }
