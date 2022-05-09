// ignore_for_file: prefer_const_constructors

import 'package:aya2/components/edit_profile.dart';
import 'package:aya2/pages/cpds/cpdscreen.dart';
import 'package:aya2/pages/cpds/cpdselfreport.dart';
import 'package:aya2/pages/exam/examapply.dart';
import 'package:aya2/pages/exam/exams.dart';
import 'package:aya2/pages/exam/examseries.dart';
import 'package:aya2/pages/faq/faq.dart';
import 'package:aya2/pages/faq/single.dart';
import 'package:aya2/pages/home.dart';
import 'package:aya2/pages/internship/checkin/addcheckin.dart';
import 'package:aya2/pages/internship/checkin/checkinhist.dart';
import 'package:aya2/pages/internship/compentency.dart';
import 'package:aya2/pages/internship/competencysummary.dart';
import 'package:aya2/pages/internship/internshipget.dart';
import 'package:aya2/pages/internship/internshipscreen.dart';
import 'package:aya2/pages/internship/internshiptransfer.dart';
import 'package:aya2/pages/internship/rotations/rotationcompetencies.dart';
import 'package:aya2/pages/internship/rotations/rotationsget.dart';
import 'package:aya2/pages/internship/transferhist.dart';
import 'package:aya2/pages/knowbase/article.dart';
import 'package:aya2/pages/knowbase/articles.dart';
import 'package:aya2/pages/licence/licencehistory.dart';
import 'package:aya2/pages/licence/licencingscreen.dart';
import 'package:aya2/pages/login.dart';
import 'package:aya2/pages/profile.dart';
import 'package:aya2/pages/registration/registration.dart';
import 'package:aya2/pages/registration/registration_screen.dart';
import 'package:get/get.dart';

import '../pages/payments/pay.dart';

final allRoutes = [
  GetPage(name: "/", page: () => HomePage()),
  GetPage(name: "/login", page: () => LoginPage()),
  GetPage(name: "/profile", page: () => ProfilePage()),
  GetPage(name: "/editprofile", page: () => ProfileEditScreen()),
  GetPage(name: "/CPD", page: () => CpdPage()),
  GetPage(name: "/selfreport", page: () => CpdSelfReportPage()),
  GetPage(name: "/internships", page: () => InternshipScreen()),
  GetPage(name: "/internshiphist", page: () => InternshipGetPage()),
  GetPage(name: "/licence_screen", page: () => LicencesScreen()),
  GetPage(name: "/licence_history", page: () => LicenceHistory()),
  GetPage(name: "/faq", page: () => FAQPage()),
  GetPage(name: "/articles", page: () => ArticlesPage()),
  GetPage(name: "/article", page: () => ArticlePage()),
  GetPage(name: "/exam", page: () => ExamComboPage()),
  GetPage(name: "/registration", page: () => RegistrationPage()),
  GetPage(name: "/registration_screen", page: () => RegistrationScreen()),
  GetPage(name: "/transferhist", page: () => TransferHistPage()),
  GetPage(name: "/checkinhist", page: () => CheckinGetPage()),
  GetPage(name: "/rotationhist", page: () => RotationgetPage()),
  GetPage(name: "/rotationcompetencies", page: () => RotationCompetenciesPage()),
  GetPage(name: "/singlefaq", page: () => SingleFAQ()),
  GetPage(name: "/checkin", page: () => AddCheckInPage()),
  GetPage(name: "/internshipadd", page: () => InternshipTransfer()),
  GetPage(name: "/competency", page: () => CompetencyPage()),
  GetPage(name: "/competencysummary", page: () => CompetencySummaryPage()),
  GetPage(name: "/payments", page: () => PaymentsPage()),
  GetPage(name: "/examapply", page: () => ExamApplyPage()),
  GetPage(name: "/examseries", page: () => ExamSeriesPage())
];
