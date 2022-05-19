const rootRoute = "/";

const overviewPageDisplayName = "نظرة عامة";
const overviewPageRoute = "/overview";

const driversPageDisplayName = "الأطباء";
const driversPageRoute = "/drivers";

const clientsPageDisplayName = "المرضى";
const clientsPageRoute = "/clients";

const authenticationPageDisplayName = "تسجيل خروج";

const authenticationPageRoute = "/auth";
const loginPageRoute = "/login";
const registerPageRoute = "/register";

class MenuItem {
  final String name;
  final String route;

  MenuItem(this.name, this.route);
}



List<MenuItem> sideMenuItemRoutes = [
 MenuItem(overviewPageDisplayName, overviewPageRoute),
 MenuItem(driversPageDisplayName, driversPageRoute),
 MenuItem(clientsPageDisplayName, clientsPageRoute),
 MenuItem(authenticationPageDisplayName, loginPageRoute),
];
