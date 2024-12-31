extension CapitalizaionExtension on String {
  //capitalize the first letter only in a word 
  String get inCapitals =>
      isNotEmpty ? "${this[0].toUpperCase()}${substring(1)}" : "";

  //capitalize all letters
  String get allInCapitals => toUpperCase();

  //capitalize the first letter of each word in many words phrase  
  String get capitalizeFirstOfEach =>
      split(" ").map((str) => str.inCapitals).join(" ");
}