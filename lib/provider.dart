import 'package:ag/models/seaModel.dart';
import 'package:ag/profile/profile.dart';
import 'package:flutter/cupertino.dart';
import 'explore/explor.dart';
import 'home_page/home_page.dart';
import 'models/bodyModel.dart';

class MyAppProvider extends ChangeNotifier {
  int index = 0;
  int listViewIndex = 0;
  bool createAccountObscureTextCheck = true;
  bool loginObscureTextCheck = true;
  final createAccountFormKey = GlobalKey<FormState>();
  final loginFormKey = GlobalKey<FormState>();
  final createAccountPasswordController = TextEditingController();
  final createAccountEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();
  final loginEmailController = TextEditingController();
  final userNameController = TextEditingController();
  final ageController = TextEditingController();

  List<Widget> tabs = [
    const HomePage(),
    const Explore(),
    Profile(),
  ];

  onTap(value) {
    index = value;
    notifyListeners();
  }

  void changeObscureForCreateAccount() {
    createAccountObscureTextCheck = !createAccountObscureTextCheck;
    notifyListeners();
  }

  void changeObscureForLogin() {
    loginObscureTextCheck = !loginObscureTextCheck;
    notifyListeners();
  }

  List<BodyModel> body = [
    const BodyModel(
      image: 'assets/images/bodys/Hawksbill Turtle.jpg',
      name: 'Hawksbill Turtle',
      description:
      "The hawksbill sea turtle is a critically endangered sea turtle belonging to the family Cheloniidae. It is the only extant species in the genus Eretmochelys. The species has a global distribution that is largely limited to tropical and subtropical marine and estuary ecosystems",
    ),
    const BodyModel(
      image: 'assets/images/bodys/Sea Otter.jpg',
      name: 'Sea Otter',
      description:
      "The sea otter is a marine mammal native to the coasts of the northern and eastern North Pacific Ocean. Adult sea otters typically weigh between 14 and 45 kg, making them the heaviest members of the weasel family, but among the smallest marine mammals.",
    ),
    const BodyModel(
        image: 'assets/images/bodys/Dugong.jpg',
        name: 'North Atlantic right whale',
        description:
        "The dugong is a marine mammal. It is one of four living species of the order Sirenia, which also includes three species of manatees. It is the only living representative of the once-diverse family Dugongidae; its closest modern relative, Steller's sea cow, was hunted to extinction in the 18th century."),
    const BodyModel(
      image: 'assets/images/bodys/Whale shark.jpeg.jpg',
      name: 'Whale shark',
      description:
      "The whale shark is a slow-moving, filter-feeding carpet shark and the largest known extant fish species. The largest confirmed individual had a length of 18.8 m. The whale shark holds many records for size in the animal kingdom, most notably being by far the largest living nonmammalian vertebrate.",
    ),
    const BodyModel(
      image: 'assets/images/bodys/North Atlantic right whale.png',
      name: 'North Atlantic right whale',
      description:
      "The North Atlantic right whale is a baleen whale, one of three right whale species belonging to the genus Eubalaena, all of which were formerly classified as a single species.",
    ),
    const BodyModel(
      image: 'assets/images/bodys/Manatee.jpg',
      name: 'Manatee',
      description:
      "Manatees are large, fully aquatic, mostly herbivorous marine mammals sometimes known as sea cows. There are three accepted living species of Trichechidae, representing three of the four living species in the order Sirenia: the Amazonian manatee, the West Indian manatee, and the West African manatee.",
    ),
    const BodyModel(
      image: 'assets/images/bodys/Hawaiian monk seal.jpg',
      name: 'Hawaiian monk seal',
      description:
      "The Hawaiian monk seal is an endangered species of earless seal in the family Phocidae that is endemic to the Hawaiian Islands. The Hawaiian monk seal is one of two extant monk seal species; the other is the Mediterranean monk seal. A third species, the Caribbean monk seal, is extinct.",
    ),
    const BodyModel(
      image: 'assets/images/bodys/Blue whale.jpeg.jpg',
      name: 'Blue whale',
      description:
      "The blue whale is a marine mammal and a baleen whale. Reaching a maximum confirmed length of 29.9 meters and weighing up to 199 tonnes, it is the largest animal known ever to have existed. The blue whale's long and slender body can be of various shades of greyish-blue dorsally and somewhat lighter underneath.",
    ),
    const BodyModel(
      image: 'assets/images/bodys/Shortnose sturgeon.png',
      name: 'Shortnose sturgeon',
      description:
      "The shortnose sturgeon is a small and endangered species of North American sturgeon. The earliest remains of the species are from the Late Cretaceous Period, over 70 million years ago. Shortnose sturgeons are long-lived and slow to sexually mature.",
    ),
  ];

  List<SeaModel> seas = [
    const SeaModel(
      bodyModel: BodyModel(
        image: "assets/images/seas/Philippine Sea.jpg",
        name: 'Philippine Sea',
        description: "The hawksbill sea turtle is a critically endangered sea turtle belonging to the family Cheloniidae. It is the only extant species in the genus Eretmochelys. The species has a global distribution that is largely limited to tropical and subtropical marine and estuary ecosystems",
      ),
      location:"East Asia, Southeast Asia, and Micronesia",
      surfaceArea: "5,695,000 km2",
    ),
    const SeaModel(
      bodyModel: BodyModel(
        image: "assets/images/seas/American Mediterranean.png",
        name: 'American Mediterranean',
        description: "The hawksbill sea turtle is a critically endangered sea turtle belonging to the family Cheloniidae. It is the only extant species in the genus Eretmochelys. The species has a global distribution that is largely limited to tropical and subtropical marine and estuary ecosystems",
      ),
      location:"America",
      surfaceArea: "4,200,000 km2",
    ),
    const SeaModel(
      bodyModel: BodyModel(
        image: "assets/images/seas/Coral Sea.jpg",
        name: 'Coral Sea',
        description: "The hawksbill sea turtle is a critically endangered sea turtle belonging to the family Cheloniidae. It is the only extant species in the genus Eretmochelys. The species has a global distribution that is largely limited to tropical and subtropical marine and estuary ecosystems",
      ),
      location:"East Asia, Southeast Asia, and Micronesia",
      surfaceArea:"4,791,000 km2",
    ),
    const SeaModel(
      bodyModel: BodyModel(
        image: "assets/images/seas/Philippine Sea.jpg",
        name: 'Philippine Sea',
        description: "The hawksbill sea turtle is a critically endangered sea turtle belonging to the family Cheloniidae. It is the only extant species in the genus Eretmochelys. The species has a global distribution that is largely limited to tropical and subtropical marine and estuary ecosystems",
      ),
      location:"East Asia, Southeast Asia, and Micronesia",
      surfaceArea:"	5,695,000 km2",
    ),
  ];
}
