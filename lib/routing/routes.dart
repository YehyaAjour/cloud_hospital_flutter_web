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
