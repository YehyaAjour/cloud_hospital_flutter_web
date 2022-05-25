import 'package:cloud_hospital/routing/routes.dart';

List<MenuItem> sideMenuItemRoutes = [
  MenuItem(overviewPageDisplayName, overviewPageRoute),
  MenuItem(driversPageDisplayName, driversPageRoute),
  MenuItem(clientsPageDisplayName, clientsPageRoute),
  MenuItem(specialtiesDisplayName, specialtiesPageRoute),
  MenuItem(authenticationPageDisplayName, logoutPageRoute),
];
List<MenuItem> PationtsideMenuItemRoutes = [
  MenuItem(PationtoverviewPageDisplayName, PationtoverviewPageRoute),
  MenuItem(PationtDiseasePageDisplayName, PationtDiseasePageRoute),
  MenuItem(authenticationPageDisplayName, logoutPageRoute),

];
List<MenuItem> DoctorsideMenuItemRoutes = [
  MenuItem(DoctoroverviewPageDisplayName, DoctoroverviewPageRoute),
  MenuItem(DoctorDiseasePageDisplayName, DoctorDiseasePageRoute),
  MenuItem(authenticationPageDisplayName, logoutPageRoute),
];