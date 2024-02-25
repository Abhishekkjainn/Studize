import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:studize/screens/info/modelcontroller/SyllabusModel.dart';

class SyllabusService extends GetxController {
  int TotalCountofFullSyllabus = 0;
  int TotalCompletedFullSyllabus = 0;
  int TotalMath = 0;
  int TotalChem = 0;
  int TotalPhy = 0;
  int TotalCompletedMath = 0;
  int TotalCompletedChem = 0;
  int TotalCompletedPhy = 0;
  DateTime today = DateTime.now();
  DateTime JEEDate = DateTime(2024, 5, 17);

  List<SyllabusModel> FullSyllabus = <SyllabusModel>[
    //Mathematics Syllabus
    SyllabusModel(
        ChapterCode: 'M1',
        ChapterName: 'Sets, Relation and Functions',
        SubjectTag: 'Mathematics',
        chapterStatus: false,
        SubtopicCount: 10,
        Subtpics: [
          'Union',
          'Intersection',
          'Complement of Sets',
          'Algebraic properties',
          'PowerSet',
          'Type of Relations',
          'Equivalence Relations',
          'One-One into Functions',
          'One-One onto Functions',
          'Composition Functions'
        ],
        SubtopicsDone: [
          false,
          false,
          false,
          false,
          false,
          false,
          false,
          false,
          false,
          false,
        ],
        isNotesDone: false,
        isQuestionsDone: false,
        isLecturesDone: false,
        isTested: false,
        RevisionCount: 0),
    SyllabusModel(
        ChapterCode: 'M2',
        ChapterName: 'Complex Numbers And Quadratic Equations',
        SubjectTag: 'Mathematics',
        chapterStatus: false,
        SubtopicCount: 12,
        Subtpics: [
          "Ordered Pair",
          "Representation of Complex Numbers",
          'Representation in a Plane',
          "Argand Diagram",
          "Algebra of Complex Numbers",
          "Modulus And Argument",
          'Quadratic Equations in Real and Complex',
          'Solution of Quadratic Equations',
          'Relation Between Roots',
          'Relation Between Coefficient',
          'Nature of Roots',
          'Formation of Quadratic Equations'
        ],
        SubtopicsDone: [
          false,
          false,
          false,
          false,
          false,
          false,
          false,
          false,
          false,
          false,
          false,
          false
        ],
        isNotesDone: false,
        isQuestionsDone: false,
        isLecturesDone: false,
        isTested: false,
        RevisionCount: 0),
    SyllabusModel(
        ChapterCode: 'M3',
        ChapterName: 'Matrices and Determinants',
        SubjectTag: 'Mathematics',
        chapterStatus: false,
        SubtopicCount: 11,
        Subtpics: [
          'Algebra of Matrices',
          'Types of Matrices',
          'Types of Determinants',
          'Matrices of Order Two',
          'Matrices of Order Three',
          'Evaluation of Determinants',
          'Area of Triangle',
          'Adjoint',
          'Inverse',
          'Test of Consistency',
          'Solution of Simultaneous Linear Equation',
        ],
        SubtopicsDone: [
          false,
          false,
          false,
          false,
          false,
          false,
          false,
          false,
          false,
          false,
          false,
        ],
        isNotesDone: false,
        isQuestionsDone: false,
        isLecturesDone: false,
        isTested: false,
        RevisionCount: 0),
    SyllabusModel(
        ChapterCode: 'M4',
        ChapterName: 'Permutations and Combinations',
        SubjectTag: 'Mathematics',
        chapterStatus: false,
        SubtopicCount: 7,
        Subtpics: [
          'Fundamental Principle of Counting',
          'Permutations',
          'Arrangement Permutations',
          'Combinations as Sections',
          'Meaning of P(n,r)',
          'Meaning of C(n,r)',
          'Simple Applications'
        ],
        SubtopicsDone: [
          false,
          false,
          false,
          false,
          false,
          false,
          false,
        ],
        isNotesDone: false,
        isQuestionsDone: false,
        isLecturesDone: false,
        isTested: false,
        RevisionCount: 0),
    SyllabusModel(
        ChapterCode: 'M5',
        ChapterName: 'Binomial Theorem',
        SubjectTag: 'Mathematics',
        chapterStatus: false,
        SubtopicCount: 4,
        Subtpics: [
          'Binomial Theorem for Positive integral Index',
          'General Term',
          'Middle Term',
          'Simple Applications'
        ],
        SubtopicsDone: [
          false,
          false,
          false,
          false,
        ],
        isNotesDone: false,
        isQuestionsDone: false,
        isLecturesDone: false,
        isTested: false,
        RevisionCount: 0),
    SyllabusModel(
        ChapterCode: 'M6',
        ChapterName: 'Sequence and Series',
        SubjectTag: 'Mathematics',
        chapterStatus: false,
        SubtopicCount: 5,
        Subtpics: [
          'Arithmetic Progression',
          'Geometric Progression',
          'Insertion of Arithmetic Mean',
          'Insertion of Geometric Mean',
          'Relation Between AM and GM'
        ],
        SubtopicsDone: [
          false,
          false,
          false,
          false,
          false,
        ],
        isNotesDone: false,
        isQuestionsDone: false,
        isLecturesDone: false,
        isTested: false,
        RevisionCount: 0),
    SyllabusModel(
        ChapterCode: 'M7',
        ChapterName: 'Limits, Continuity, and Diffrentiability',
        SubjectTag: 'Mathematics',
        chapterStatus: false,
        SubtopicCount: 25,
        Subtpics: [
          'Real–valued functions',
          'Algebra of Functions',
          'Polynomials',
          'Rational Functions',
          'Trigonometric Functions',
          'Logarithmic Functions',
          'Exponential Functions',
          'Inverse Functions',
          'Graphs of Simple Functions',
          'Differentiation of the Sum',
          'Difference of two Functions',
          'Product of two Functions',
          'Quotient of two Functions',
          'Differentiation of Trigonometric Functions',
          'Differentiation of Inverse Trigonometric Functions',
          'Differentiation of Logarithmic Functions',
          'Differentiation of Exponential Functions',
          'Differentiation of Composite Functions',
          'Differentiation of Implicit Functions',
          'Derivatives of Order up to Two',
          'Rate of change of quantities',
          'Increasing Functions',
          'Decreasing Functions',
          'Maxima and Minima of a Function',
          'Monotonic Functions'
        ],
        SubtopicsDone: [
          false,
          false,
          false,
          false,
          false,
          false,
          false,
          false,
          false,
          false,
          false,
          false,
          false,
          false,
          false,
          false,
          false,
          false,
          false,
          false,
          false,
          false,
          false,
          false,
          false,
        ],
        isNotesDone: false,
        isQuestionsDone: false,
        isLecturesDone: false,
        isTested: false,
        RevisionCount: 0),
    SyllabusModel(
        ChapterCode: 'M8',
        ChapterName: 'Integral Calculus',
        SubjectTag: 'Mathematics',
        chapterStatus: false,
        SubtopicCount: 14,
        Subtpics: [
          'Integral as Anti Derivative',
          'Fundamental Integral involving Algebraic Functions',
          'Fundamental Integral involving Trigonometric Functions',
          'Fundamental Integral involving Exponential Functions',
          'Fundamental Integral involving Logarithmic Functions',
          'Integration by Substitution',
          'Integration By-Parts',
          'Integration by Partial Fractions',
          'Integration by Trigonometric Identities',
          'Evaluation fo Simple Integrals of different Types',
          'Fundamental Theorem of Calculus',
          'Properties of Definite Integrals',
          'Evaluation of Definite Integrals',
          'Determining Areas of Region bounded'
        ],
        SubtopicsDone: [
          false,
          false,
          false,
          false,
          false,
          false,
          false,
          false,
          false,
          false,
          false,
          false,
          false,
          false,
        ],
        isNotesDone: false,
        isQuestionsDone: false,
        isLecturesDone: false,
        isTested: false,
        RevisionCount: 0),
    SyllabusModel(
        ChapterCode: 'M9',
        ChapterName: 'Diffrential Equations',
        SubjectTag: 'Mathematics',
        chapterStatus: false,
        SubtopicCount: 7,
        Subtpics: [
          'Ordinary Diffrential Equations',
          'Order',
          'Degree',
          'Solution of Diffrential Equations',
          'Method of Seperation of Variables',
          'Solution of Homogenous Differential Equation',
          'Solution of Linear Diffrential Equations'
        ],
        SubtopicsDone: [
          false,
          false,
          false,
          false,
          false,
          false,
          false,
        ],
        isNotesDone: false,
        isQuestionsDone: false,
        isLecturesDone: false,
        isTested: false,
        RevisionCount: 0),
    SyllabusModel(
        ChapterCode: 'M10',
        ChapterName: 'Co-Ordinate Geometry',
        SubjectTag: 'Mathematics',
        chapterStatus: false,
        SubtopicCount: 7,
        Subtpics: [
          'Rectangular Coordinates in a Plane',
          'Distance Formula',
          'Sections Formula',
          'Sections Formula Equations',
          'Slope of a Line',
          'Parallel and Perpendicular Lines',
          'Intercepts of a Line on the Coordinate Axis',
        ],
        SubtopicsDone: [
          false,
          false,
          false,
          false,
          false,
          false,
          false,
        ],
        isNotesDone: false,
        isQuestionsDone: false,
        isLecturesDone: false,
        isTested: false,
        RevisionCount: 0),
    SyllabusModel(
        ChapterCode: 'M11',
        ChapterName: 'Straight Lines',
        SubjectTag: 'Mathematics',
        chapterStatus: false,
        SubtopicCount: 8,
        Subtpics: [
          'Various Forms of Equations of a Line',
          'Intersection of a Line',
          'Angle Between two Lines',
          'Conditions for Concurrence of Three Lines',
          'Distance of a Point from A Line',
          'Coordinate of Centroid of a Triangle',
          'Coordinate of Orthocenter of a Triangle',
          'Coordinate of Circumcenter of a Triangle',
        ],
        SubtopicsDone: [false, false, false, false, false, false, false, false],
        isNotesDone: false,
        isQuestionsDone: false,
        isLecturesDone: false,
        isTested: false,
        RevisionCount: 0),
    SyllabusModel(
        ChapterCode: 'M12',
        ChapterName: 'Circle and Conic Sections',
        SubjectTag: 'Mathematics',
        chapterStatus: false,
        SubtopicCount: 8,
        Subtpics: [
          'Standard Equation of a Circle',
          'General Equation of a Circle',
          'Radius and Center of Circle',
          'Equation of Circle when Endpoints of Diameter is Given',
          'POI of a Line and a Circle',
          'Equations of Parabola in Standard Form',
          'Equations of Ellipse in Standard Form',
          'Equations of Hyperbola in Standard Form',
        ],
        SubtopicsDone: [false, false, false, false, false, false, false, false],
        isNotesDone: false,
        isQuestionsDone: false,
        isLecturesDone: false,
        isTested: false,
        RevisionCount: 0),
    SyllabusModel(
        ChapterCode: 'M13',
        ChapterName: 'Three Dimensional Geometry',
        SubjectTag: 'Mathematics',
        chapterStatus: false,
        SubtopicCount: 9,
        Subtpics: [
          'Coordinates of Point in Space',
          'Distance Between Two Points',
          'Section Formula',
          'Direction Ratios',
          'Direction Cosines',
          'Angle Between two Intersecting Lines',
          'Skew Lines',
          'Shortest Distance Between Lines and its Equations',
          'Equations of a Line'
        ],
        SubtopicsDone: [
          false,
          false,
          false,
          false,
          false,
          false,
          false,
          false,
          false
        ],
        isNotesDone: false,
        isQuestionsDone: false,
        isLecturesDone: false,
        isTested: false,
        RevisionCount: 0),
    SyllabusModel(
        ChapterCode: 'M14',
        ChapterName: 'Vector Algebra',
        SubjectTag: 'Mathematics',
        chapterStatus: false,
        SubtopicCount: 6,
        Subtpics: [
          'Vectors and Scalars',
          'Addition of Vectors',
          'Components of Vector in Two Dimensions',
          'Components of Vector in Three Dimensions',
          'Scalar Product',
          'Vector Product'
        ],
        SubtopicsDone: [
          false,
          false,
          false,
          false,
          false,
          false,
        ],
        isNotesDone: false,
        isQuestionsDone: false,
        isLecturesDone: false,
        isTested: false,
        RevisionCount: 0),
    SyllabusModel(
        ChapterCode: 'M15',
        ChapterName: 'Statistics and Probability',
        SubjectTag: 'Mathematics',
        chapterStatus: false,
        SubtopicCount: 12,
        Subtpics: [
          'Measures of Discretion',
          'Calculation of Mean of Grouped and Ungrouped Data',
          'Calculation of Median of Grouped and Ungrouped Data',
          'Calculation of Mode of Grouped and Ungrouped Data',
          'Calculation of Standard Deviation',
          'Calculation of Variance',
          'Calculation of Mean Deviation',
          'Probability of an Event',
          'Addition Theorem',
          'Multiplication Theorem',
          'Baye\'s Theorem',
          'Probability Distribution of Random Variate',
        ],
        SubtopicsDone: [
          false,
          false,
          false,
          false,
          false,
          false,
          false,
          false,
          false,
          false,
          false,
          false,
        ],
        isNotesDone: false,
        isQuestionsDone: false,
        isLecturesDone: false,
        isTested: false,
        RevisionCount: 0),
    SyllabusModel(
        ChapterCode: 'M16',
        ChapterName: 'Trigonometry',
        SubjectTag: 'Mathematics',
        chapterStatus: false,
        SubtopicCount: 4,
        Subtpics: [
          'Trigonometrical Identities',
          'Trigonometric Functions',
          'Inverse Trigonometrical Functions',
          'Inverse Trigonometrical Properties'
        ],
        SubtopicsDone: [
          false,
          false,
          false,
          false,
        ],
        isNotesDone: false,
        isQuestionsDone: false,
        isLecturesDone: false,
        isTested: false,
        RevisionCount: 0),
    //Mathematics Syllabus OVER

    SyllabusModel(
        ChapterCode: 'C1',
        ChapterName: 'General Organic Chemistry',
        SubjectTag: 'Chemistry',
        chapterStatus: false,
        SubtopicCount: 6,
        Subtpics: [
          "Definite Integral",
          "Indefinite Integral",
          "Real and Complex Numbers",
          "Limits and Continuity",
          "Sequence and Series",
          'Distance and Time'
        ],
        SubtopicsDone: [
          false,
          false,
          false,
          false,
          false,
          false,
        ],
        isNotesDone: false,
        isQuestionsDone: false,
        isLecturesDone: false,
        isTested: false,
        RevisionCount: 0),
    SyllabusModel(
        ChapterCode: 'C2',
        ChapterName: 'Polymers',
        SubjectTag: 'Chemistry',
        chapterStatus: false,
        SubtopicCount: 6,
        Subtpics: [
          "Definite Integral",
          "Indefinite Integral",
          "Real and Complex Numbers",
          "Limits and Continuity",
          "Sequence and Series",
          'Distance and Time'
        ],
        SubtopicsDone: [
          false,
          false,
          false,
          false,
          false,
          false,
        ],
        isNotesDone: false,
        isQuestionsDone: false,
        isLecturesDone: false,
        isTested: false,
        RevisionCount: 0),
    SyllabusModel(
        ChapterCode: 'P1',
        ChapterName: 'Kinematics',
        SubjectTag: 'Physics',
        chapterStatus: false,
        SubtopicCount: 6,
        Subtpics: [
          "Definite Integral",
          "Indefinite Integral",
          "Real and Complex Numbers",
          "Limits and Continuity",
          "Sequence and Series",
          'Distance and Time'
        ],
        SubtopicsDone: [
          false,
          false,
          false,
          false,
          false,
          false,
        ],
        isNotesDone: false,
        isQuestionsDone: false,
        isLecturesDone: false,
        isTested: false,
        RevisionCount: 0),
    SyllabusModel(
        ChapterCode: 'P2',
        ChapterName: 'Modern Physics',
        SubjectTag: 'Physics',
        chapterStatus: false,
        SubtopicCount: 6,
        Subtpics: [
          "Definite Integral",
          "Indefinite Integral",
          "Real and Complex Numbers",
          "Limits and Continuity",
          "Sequence and Series",
          'Distance and Time'
        ],
        SubtopicsDone: [
          false,
          false,
          false,
          false,
          false,
          false,
        ],
        isNotesDone: false,
        isQuestionsDone: false,
        isLecturesDone: false,
        isTested: false,
        RevisionCount: 0),
  ];
  List<SyllabusModel> Mathematics = <SyllabusModel>[];
  List<SyllabusModel> Chemistry = <SyllabusModel>[];
  List<SyllabusModel> Physics = <SyllabusModel>[];

  getSeperatedList() {
    for (int i = 0; i < FullSyllabus.length; i++) {
      if (FullSyllabus[i].SubjectTag == 'Mathematics') {
        Mathematics.add(SyllabusModel(
            ChapterCode: FullSyllabus[i].ChapterCode,
            ChapterName: FullSyllabus[i].ChapterName,
            SubjectTag: FullSyllabus[i].SubjectTag,
            chapterStatus: FullSyllabus[i].chapterStatus,
            SubtopicCount: FullSyllabus[i].SubtopicCount,
            Subtpics: FullSyllabus[i].Subtpics,
            SubtopicsDone: FullSyllabus[i].SubtopicsDone,
            isNotesDone: FullSyllabus[i].isNotesDone,
            isQuestionsDone: FullSyllabus[i].isQuestionsDone,
            isLecturesDone: FullSyllabus[i].isLecturesDone,
            isTested: FullSyllabus[i].isTested,
            RevisionCount: FullSyllabus[i].RevisionCount));
      }
      if (FullSyllabus[i].SubjectTag == 'Chemistry') {
        Chemistry.add(SyllabusModel(
            ChapterCode: FullSyllabus[i].ChapterCode,
            ChapterName: FullSyllabus[i].ChapterName,
            SubjectTag: FullSyllabus[i].SubjectTag,
            chapterStatus: FullSyllabus[i].chapterStatus,
            SubtopicCount: FullSyllabus[i].SubtopicCount,
            Subtpics: FullSyllabus[i].Subtpics,
            SubtopicsDone: FullSyllabus[i].SubtopicsDone,
            isNotesDone: FullSyllabus[i].isNotesDone,
            isQuestionsDone: FullSyllabus[i].isQuestionsDone,
            isLecturesDone: FullSyllabus[i].isLecturesDone,
            isTested: FullSyllabus[i].isTested,
            RevisionCount: FullSyllabus[i].RevisionCount));
      }
      if (FullSyllabus[i].SubjectTag == 'Physics') {
        Physics.add(SyllabusModel(
            ChapterCode: FullSyllabus[i].ChapterCode,
            ChapterName: FullSyllabus[i].ChapterName,
            SubjectTag: FullSyllabus[i].SubjectTag,
            chapterStatus: FullSyllabus[i].chapterStatus,
            SubtopicCount: FullSyllabus[i].SubtopicCount,
            Subtpics: FullSyllabus[i].Subtpics,
            SubtopicsDone: FullSyllabus[i].SubtopicsDone,
            isNotesDone: FullSyllabus[i].isNotesDone,
            isQuestionsDone: FullSyllabus[i].isQuestionsDone,
            isLecturesDone: FullSyllabus[i].isLecturesDone,
            isTested: FullSyllabus[i].isTested,
            RevisionCount: FullSyllabus[i].RevisionCount));
      }
    }
    update();
  }

  getTotalCount() {
    for (int i = 0; i < FullSyllabus.length; i++) {
      int num = FullSyllabus[i].Subtpics.length * 4;
      TotalCountofFullSyllabus = num + TotalCountofFullSyllabus;
      print(TotalCountofFullSyllabus);
    }
    update();
    // getTotalSubjectsCount();
  }

  getTotalSubjectsCount() {
    for (int i = 0; i < Mathematics.length; i++) {
      int MathTotal = Mathematics[i].Subtpics.length;
      TotalMath = TotalMath + MathTotal * 4;
    }
    for (int i = 0; i < Physics.length; i++) {
      int PhyTotal = Physics[i].Subtpics.length;
      TotalPhy = TotalPhy + PhyTotal * 4;
    }
    for (int i = 0; i < Chemistry.length; i++) {
      int ChemTotal = Chemistry[i].Subtpics.length;
      TotalChem = TotalChem + ChemTotal * 4;
    }
    print(TotalChem);
  }

  getMathCount(int index) {
    int num = Mathematics[index].Subtpics.length;
    TotalCompletedMath = TotalCompletedMath + num;
    TotalCompletedFullSyllabus = TotalCompletedFullSyllabus + num;
    update();
  }

  removeMathCount(int index) {
    int num = Mathematics[index].Subtpics.length;
    TotalCompletedMath = TotalCompletedMath - num;
    TotalCompletedFullSyllabus = TotalCompletedFullSyllabus - num;
    update();
  }

  getPhyCount(int index) {
    int num = Physics[index].Subtpics.length;
    TotalCompletedPhy = TotalCompletedPhy + num;
    TotalCompletedFullSyllabus = TotalCompletedFullSyllabus + num;
    update();
  }

  removePhyCount(int index) {
    int num = Physics[index].Subtpics.length;
    TotalCompletedPhy = TotalCompletedPhy - num;
    TotalCompletedFullSyllabus = TotalCompletedFullSyllabus - num;
    update();
  }

  getChemCount(int index) {
    int num = Chemistry[index].Subtpics.length;
    TotalCompletedChem = TotalCompletedChem + num;
    TotalCompletedFullSyllabus = TotalCompletedFullSyllabus + num;
    print(TotalCompletedChem);
    update();
  }

  removeChemCount(int index) {
    int num = Chemistry[index].Subtpics.length;
    TotalCompletedChem = TotalCompletedChem - num;
    TotalCompletedFullSyllabus = TotalCompletedFullSyllabus - num;
    print(TotalCompletedChem);
    update();
  }

  int getRemainingDays(today, JEEDay) {
    return JEEDate.difference(today).inDays;
  }

//Search Functionality

  RxList<SyllabusModel> SearchResult = <SyllabusModel>[].obs;

  void filteredSyllabus(String Search) {
    if (Search.isEmpty) {
      SearchResult.value = FullSyllabus;
    } else {
      SearchResult.value = FullSyllabus.where((syllabus) =>
              syllabus.ChapterName.toLowerCase().contains(Search.toLowerCase()))
          .toList();
    }
    update();
  }

  RxList<RevisionData> RevisionList = <RevisionData>[].obs;
  void addRevision(String SubjectName, String ChapterName, String Subtopic,
      String Time, String Date, String Note) {
    RevisionList.insert(
        0,
        RevisionData(
            SubjectName: SubjectName,
            Subtopic: Subtopic,
            ChapterName: ChapterName,
            Time: Time,
            Date: Date,
            Note: Note));
    update();
  }

  void removeRevision(int index) {
    RevisionList.removeAt(index);
  }
}
