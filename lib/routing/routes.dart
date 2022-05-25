const rootRoute = "/";

const overviewPageDisplayName = "نظرة عامة";
const overviewPageRoute = "/overview";

const driversPageDisplayName = "الأطباء";
const driversPageRoute = "/drivers";

const clientsPageDisplayName = "المرضى";
const clientsPageRoute = "/clients";

const specialtiesDisplayName = "التخصصات";
const specialtiesPageRoute = "/specialties";

const authenticationPageDisplayName = "تسجيل خروج";
const authenticationPageRoute = "/auth";
const loginPageRoute = "/login";
const registerPageRoute = "/register";
const logoutPageRoute = "/logout";
//----------------------PationRoute-----------------
const PationtoverviewPageDisplayName = "نظرة عامة";
const PationtoverviewPageRoute = "/overview";

const PationtDiseasePageDisplayName = "الأمراض";
const PationtDiseasePageRoute = "/disease";
//----------------------PationRoute-----------------

class MenuItem {
  final String name;
  final String route;

  MenuItem(this.name, this.route);
}



List<MenuItem> sideMenuItemRoutes = [
 MenuItem(overviewPageDisplayName, overviewPageRoute),
 MenuItem(driversPageDisplayName, driversPageRoute),
 MenuItem(clientsPageDisplayName, clientsPageRoute),
 MenuItem(specialtiesDisplayName, specialtiesPageRoute),
 MenuItem(authenticationPageDisplayName, logoutPageRoute),
];
// List<MenuItem> PationtsideMenuItemRoutes = [
//  MenuItem(PationtoverviewPageDisplayName, PationtoverviewPageRoute),
//  MenuItem(PationtDiseasePageDisplayName, PationtDiseasePageRoute),
//   MenuItem(authenticationPageDisplayName, logoutPageRoute),
//
// ];
// List<MenuItem> DoctorsideMenuItemRoutes = [
//  MenuItem(overviewPageDisplayName, overviewPageRoute),
//  MenuItem(driversPageDisplayName, driversPageRoute),
//  MenuItem(clientsPageDisplayName, clientsPageRoute),
//  MenuItem(specialtiesDisplayName, specialtiesPageRoute),
//  MenuItem(authenticationPageDisplayName, logoutPageRoute),
// ];
