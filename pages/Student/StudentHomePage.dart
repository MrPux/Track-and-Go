import 'package:flutter/material.dart';

class StudentHomePage extends StatelessWidget {
  const StudentHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Courses",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...courses
                        .map(
                          (course) => Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: CourseCard(course: course),
                          ),
                        )
                        ,
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Recent",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ...recentCourses.map(
                (course) => Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: SecondaryCourseCard(course: course),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SecondaryCourseCard extends StatelessWidget {
  const SecondaryCourseCard({super.key, required this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
        color: Color(0xFF7553f6),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  course.title,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Study your notes for 15 minutes.",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
          SizedBox(height: 40, child: VerticalDivider(color: Colors.white70)),
          Image.asset(
            "assets/reading.png",
            width: 50, // Adjust width
            height: 50, // Adjust height
            fit: BoxFit.contain,
          ),
          SizedBox(width: 8),
        ],
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  const CourseCard({super.key, required this.course});
  final Course course;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      height: 280,
      width: 260,
      decoration: BoxDecoration(
        color: course.bgColor,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  course.title,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 8),
                  child: Text(course.description),
                ),
                Image.asset(
                  course.iconSrc,
                  width: 50, // Adjust width
                  height: 50, // Adjust height
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
// "Genereate Notes From your Canvas Classes"
// "Study faster by generation notes based on your canvas classes modules, through Gemini chat + no helussinations!",

class Course {
  final String title, description, iconSrc;
  final Color bgColor;
  Course({
    required this.title,
    this.description =
        "Study faster by generation notes based on your canvas classes modules, through Gemini chat + no helussinations!",
    this.iconSrc = "assets/post-it.png",
    this.bgColor = const Color(0xFF80A4FF),
  });
}

List<Course> courses = [
  Course(title: "Genereate Notes From your Canvas Classes"),
  Course(
    title: "Helpful Tips to Study",
    iconSrc: "assets/workshop.png",
    bgColor: const Color(0xFF80A4FF),
  ),
];

List<Course> recentCourses = [
  Course(title: "Calculus II: Insights"),
  Course(
    title: "Helpful Tips to Study",
    iconSrc: "assets/workshop.png",
    bgColor: const Color(0xFF80A4FF),
  ),
  Course(title: "Sociology 101: Insights"),
  Course(
    title: "Helpful Tips to Study",
    iconSrc: "assets/workshop.png",
    bgColor: const Color(0xFF80A4FF),
  ),
  Course(title: "Computation Graph: Insights"),
  Course(
    title: "Helpful Tips to Study",
    iconSrc: "assets/workshop.png",
    bgColor: const Color(0xFF80A4FF),
  ),
];
