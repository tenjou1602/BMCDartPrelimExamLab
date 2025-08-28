import 'dart:io';

void main() {
  const double passingGradeThreshold = 60.0; // passing grade
  const double maxScore = 100.0; // Maximum possible score
  const double assignmentWeight = 0.2; // Weight of assignments in final grade
  const double midtermWeight = 0.3; // Weight of midterm exam in final grade
  const double finalExamWeight = 0.5; // Weight of final exam in final grade

  stdout.write("Enter student's name: ");
  // Read student's name, defaulting to 'Unknown Student' if input is null or empty.
  String studentName = stdin.readLineSync()?.trim() ?? 'Unknown Student';

  double assignmentScore = 0.0;
  double midtermScore = 0.0;
  double finalExamScore = 0.0;

  // --- Input for Assignment Score ---
  try {
    stdout.write("Enter assignment score (0-100): ");
    String? input = stdin.readLineSync();
    if (input == null || input.isEmpty) {
      print("Error: No input or empty input for assignment score.");
      return; // Exit the program if input is missing
    }
    assignmentScore = double.parse(input);
    if (assignmentScore < 0 || assignmentScore > maxScore) {
      throw FormatException('Score must be between 0 and 100.');
    }
  } catch (e) {
    print("Invalid input for assignment score: ${e.toString()}");
    return; // Exit the program on invalid input
  }

  // --- Input for Midterm Score ---
  try {
    stdout.write("Enter midterm score (0-100): ");
    String? input = stdin.readLineSync();
    if (input == null || input.isEmpty) {
      print("Error: No input or empty input for midterm score.");
      return; // Exit the program if input is missing
    }
    midtermScore = double.parse(input);
    if (midtermScore < 0 || midtermScore > maxScore) {
      throw FormatException('Score must be between 0 and 100.');
    }
  } catch (e) {
    print("Invalid input for midterm score: ${e.toString()}");
    return; // Exit the program on invalid input
  }

  // --- Input for Final Exam Score ---
  try {
    stdout.write("Enter final exam score (0-100): ");
    String? input = stdin.readLineSync();
    if (input == null || input.isEmpty) {
      print("Error: No input or empty input for final exam score.");
      return; // Exit the program if input is missing
    }
    finalExamScore = double.parse(input);
    if (finalExamScore < 0 || finalExamScore > maxScore) {
      throw FormatException('Score must be between 0 and 100.');
    }
  } catch (e) {
    print("Invalid input for final exam score: ${e.toString()}");
    return; // Exit the program on invalid input
  }

  // --- Calculate Final Grade ---
  double finalGrade = (assignmentScore * assignmentWeight) +
      (midtermScore * midtermWeight) +
      (finalExamScore * finalExamWeight);

  // --- Determine Pass/Fail Result ---
  String result = (finalGrade >= passingGradeThreshold) ? "Passed" : "Failed";

  // --- Display the Student's Report ---
  print("\n--- Student's Report ---");
  print("Student's Name: $studentName");
  print("Assignment Score: ${assignmentScore.toStringAsFixed(1)}");
  print("Midterm Score: ${midtermScore.toStringAsFixed(1)}");
  print("Final Exam Score: ${finalExamScore.toStringAsFixed(1)}");
  print("Final Grade: ${finalGrade.toStringAsFixed(1)}");
  print("Result: $result");
}