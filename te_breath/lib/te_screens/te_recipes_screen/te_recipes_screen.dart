import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:te_breath/te_screens/te_settings/te_settings_screen.dart';
import 'package:te_breath/te_values/te_colors.dart';
import 'package:te_breath/te_values/te_text.dart';

class TeRecipesScreen extends StatelessWidget {
  const TeRecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TeColors.lightGraySec,
      appBar: AppBar(
        backgroundColor: TeColors.lightGraySec,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Recipes',
          style: TeText.navbar.copyWith(color: TeColors.black),
        ),
        actions: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              Get.to(() => TeSettingsScreen());
            },
            child: Container(
                height: 32,
                width: 32,
                alignment: Alignment.center,
                child: SvgPicture.asset('te_assets/icons/settings.svg')),
          ),
          SizedBox(
            width: 16,
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'Hypoallergenic Recipes for Delicious Dishes',
              style: TeText.header5.copyWith(color: TeColors.black),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: TeColors.lightPurpleSec,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Gluten-Free Cheese and\nCauliflower ‘Breadsticks’',
                    style: TeText.header5.copyWith(color: TeColors.purple),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Ingredients',
                    style: TeText.header5.copyWith(color: TeColors.purple),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    ''' • 1 head cauliflower, cut into florets
 • 2 garlic cloves
 • ⅓ cup shredded mozzarella cheese
 • ⅓ cup grated Parmesan cheese
 • 2 eggs, lightly beaten
 • 1 egg white
 • 1 tablespoon chopped fresh thyme
 • 1 tablespoon chopped fresh rosemary
 • Kosher salt and freshly ground black pepper
 • 2 tablespoons extra-virgin olive oil''',
                    style: TextStyle(
                      fontFamily: 'Karla',
                      fontSize: 15,
                      fontVariations: [FontVariation('wght', 400)],
                      letterSpacing: 1,
                      color: TeColors.gray,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Instructions for Preparation',
                    style: TeText.header5.copyWith(color: TeColors.purple),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    textDirection: TextDirection.ltr,
                    children: [
                      Text(
                        ' 1. ',
                        style: TextStyle(
                          fontFamily: 'Karla',
                          fontSize: 15,
                          fontVariations: [FontVariation('wght', 400)],
                          letterSpacing: 1,
                          color: TeColors.gray,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Preheat the oven to 425°F. Line a baking sheet with parchment paper.',
                          style: TextStyle(
                            fontFamily: 'Karla',
                            fontSize: 15,
                            fontVariations: [FontVariation('wght', 400)],
                            letterSpacing: 1,
                            color: TeColors.gray,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    textDirection: TextDirection.ltr,
                    children: [
                      Text(
                        ' 2. ',
                        style: TextStyle(
                          fontFamily: 'Karla',
                          fontSize: 15,
                          fontVariations: [FontVariation('wght', 400)],
                          letterSpacing: 1,
                          color: TeColors.gray,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'In the bowl of a food processor, combine the cauliflower florets and garlic. Pulse until the mixture resembles fine meal, about 3 minutes. Transfer to a large mixing bowl.',
                          style: TextStyle(
                            fontFamily: 'Karla',
                            fontSize: 15,
                            fontVariations: [FontVariation('wght', 400)],
                            letterSpacing: 1,
                            color: TeColors.gray,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    textDirection: TextDirection.ltr,
                    children: [
                      Text(
                        ' 3. ',
                        style: TextStyle(
                          fontFamily: 'Karla',
                          fontSize: 15,
                          fontVariations: [FontVariation('wght', 400)],
                          letterSpacing: 1,
                          color: TeColors.gray,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Mix the mozzarella, Parmesan, eggs, egg white, thyme, and rosemary into the cauliflower until thoroughly combined; season with salt and pepper.',
                          style: TextStyle(
                            fontFamily: 'Karla',
                            fontSize: 15,
                            fontVariations: [FontVariation('wght', 400)],
                            letterSpacing: 1,
                            color: TeColors.gray,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    textDirection: TextDirection.ltr,
                    children: [
                      Text(
                        ' 4. ',
                        style: TextStyle(
                          fontFamily: 'Karla',
                          fontSize: 15,
                          fontVariations: [FontVariation('wght', 400)],
                          letterSpacing: 1,
                          color: TeColors.gray,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Press the cauliflower mixture into a ½-inch-thick circle on the baking sheet. Brush the surface with the olive oil. Bake until it’s crisp and golden around the edges, 25 to 30 minutes.',
                          style: TextStyle(
                            fontFamily: 'Karla',
                            fontSize: 15,
                            fontVariations: [FontVariation('wght', 400)],
                            letterSpacing: 1,
                            color: TeColors.gray,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    textDirection: TextDirection.ltr,
                    children: [
                      Text(
                        ' 5. ',
                        style: TextStyle(
                          fontFamily: 'Karla',
                          fontSize: 15,
                          fontVariations: [FontVariation('wght', 400)],
                          letterSpacing: 1,
                          color: TeColors.gray,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Cool for 5 minutes before slicing into sticks and serving.',
                          style: TextStyle(
                            fontFamily: 'Karla',
                            fontSize: 15,
                            fontVariations: [FontVariation('wght', 400)],
                            letterSpacing: 1,
                            color: TeColors.gray,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: TeColors.lightPurpleSec,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dairy-Free Cheesecake with\nBlueberry Topping',
                    style: TeText.header5.copyWith(color: TeColors.purple),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Ingredients',
                    style: TeText.header5.copyWith(color: TeColors.purple),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'CRUST',
                    style: TextStyle(
                      fontFamily: 'Karla',
                      fontSize: 15,
                      fontVariations: [FontVariation('wght', 700)],
                      letterSpacing: 1,
                      color: TeColors.gray,
                    ),
                  ),
                  Text(
                    ''' • 1½ cups pecans
 • 2 tablespoons sugar
 • 2 tablespoons coconut oil''',
                    style: TextStyle(
                      fontFamily: 'Karla',
                      fontSize: 15,
                      fontVariations: [FontVariation('wght', 400)],
                      letterSpacing: 1,
                      color: TeColors.gray,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'FILLING',
                    style: TextStyle(
                      fontFamily: 'Karla',
                      fontSize: 15,
                      fontVariations: [FontVariation('wght', 700)],
                      letterSpacing: 1,
                      color: TeColors.gray,
                    ),
                  ),
                  Text(
                    ''' • 3 cups cashews, soaked in water overnight (see note)
 • 3 tablespoons sugar
 • 2 tablespoons honey
 • Zest and juice of 1 lemon
 • ¾ cup coconut milk
 • ½ teaspoon pure vanilla extract''',
                    style: TextStyle(
                      fontFamily: 'Karla',
                      fontSize: 15,
                      fontVariations: [FontVariation('wght', 400)],
                      letterSpacing: 1,
                      color: TeColors.gray,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'TOPPING',
                    style: TextStyle(
                      fontFamily: 'Karla',
                      fontSize: 15,
                      fontVariations: [FontVariation('wght', 700)],
                      letterSpacing: 1,
                      color: TeColors.gray,
                    ),
                  ),
                  Text(
                    ''' • 1 pint fresh blueberries
 • 2 tablespoons sugar
 • Zest and juice of 1 lemon''',
                    style: TextStyle(
                      fontFamily: 'Karla',
                      fontSize: 15,
                      fontVariations: [FontVariation('wght', 400)],
                      letterSpacing: 1,
                      color: TeColors.gray,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Instructions for Preparation',
                    style: TeText.header5.copyWith(color: TeColors.purple),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    textDirection: TextDirection.ltr,
                    children: [
                      Text(
                        ' 1. ',
                        style: TextStyle(
                          fontFamily: 'Karla',
                          fontSize: 15,
                          fontVariations: [FontVariation('wght', 400)],
                          letterSpacing: 1,
                          color: TeColors.gray,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Preheat the oven to 375°F. Place a springform pan on a parchment-lined baking sheet.',
                          style: TextStyle(
                            fontFamily: 'Karla',
                            fontSize: 15,
                            fontVariations: [FontVariation('wght', 400)],
                            letterSpacing: 1,
                            color: TeColors.gray,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    textDirection: TextDirection.ltr,
                    children: [
                      Text(
                        ' 2. ',
                        style: TextStyle(
                          fontFamily: 'Karla',
                          fontSize: 15,
                          fontVariations: [FontVariation('wght', 400)],
                          letterSpacing: 1,
                          color: TeColors.gray,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'MAKE THE CRUST: In the bowl of a food processor, pulse the pecans until they are finely ground. Transfer to a medium bowl and wipe out the food processor. Add the sugar to the ground pecans and stir to combine. Add the coconut oil and stir until the crumbs are evenly moistened. Pour the crumb mixture into the prepared pan and press into an even layer.',
                          style: TextStyle(
                            fontFamily: 'Karla',
                            fontSize: 15,
                            fontVariations: [FontVariation('wght', 400)],
                            letterSpacing: 1,
                            color: TeColors.gray,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    textDirection: TextDirection.ltr,
                    children: [
                      Text(
                        ' 3. ',
                        style: TextStyle(
                          fontFamily: 'Karla',
                          fontSize: 15,
                          fontVariations: [FontVariation('wght', 400)],
                          letterSpacing: 1,
                          color: TeColors.gray,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Bake the crust for 8 to 9 minutes, or until the edges are lightly golden. Let the crust cool to room temperature.',
                          style: TextStyle(
                            fontFamily: 'Karla',
                            fontSize: 15,
                            fontVariations: [FontVariation('wght', 400)],
                            letterSpacing: 1,
                            color: TeColors.gray,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    textDirection: TextDirection.ltr,
                    children: [
                      Text(
                        ' 4. ',
                        style: TextStyle(
                          fontFamily: 'Karla',
                          fontSize: 15,
                          fontVariations: [FontVariation('wght', 400)],
                          letterSpacing: 1,
                          color: TeColors.gray,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'MAKE THE FILLING: Drain the cashews and transfer to the food processor. Pulse until the cashews are coarsely chopped. Add the sugar, honey, lemon zest, lemon juice, coconut milk, and vanilla extract, and pulse until very smooth (the mixture should be pretty thick).',
                          style: TextStyle(
                            fontFamily: 'Karla',
                            fontSize: 15,
                            fontVariations: [FontVariation('wght', 400)],
                            letterSpacing: 1,
                            color: TeColors.gray,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    textDirection: TextDirection.ltr,
                    children: [
                      Text(
                        ' 5. ',
                        style: TextStyle(
                          fontFamily: 'Karla',
                          fontSize: 15,
                          fontVariations: [FontVariation('wght', 400)],
                          letterSpacing: 1,
                          color: TeColors.gray,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Pour the cashew mixture over the cooled crust and spread into an even layer. Transfer to the freezer to chill while you make the topping.',
                          style: TextStyle(
                            fontFamily: 'Karla',
                            fontSize: 15,
                            fontVariations: [FontVariation('wght', 400)],
                            letterSpacing: 1,
                            color: TeColors.gray,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    textDirection: TextDirection.ltr,
                    children: [
                      Text(
                        ' 6. ',
                        style: TextStyle(
                          fontFamily: 'Karla',
                          fontSize: 15,
                          fontVariations: [FontVariation('wght', 400)],
                          letterSpacing: 1,
                          color: TeColors.gray,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'MAKE THE TOPPING: In a medium pot, combine the blueberries with the sugar, lemon zest, and lemon juice. Bring to a simmer over medium heat. Simmer until the blueberries are very soft and begin to burst, 8 to 10 minutes.',
                          style: TextStyle(
                            fontFamily: 'Karla',
                            fontSize: 15,
                            fontVariations: [FontVariation('wght', 400)],
                            letterSpacing: 1,
                            color: TeColors.gray,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    textDirection: TextDirection.ltr,
                    children: [
                      Text(
                        ' 7. ',
                        style: TextStyle(
                          fontFamily: 'Karla',
                          fontSize: 15,
                          fontVariations: [FontVariation('wght', 400)],
                          letterSpacing: 1,
                          color: TeColors.gray,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Puree the blueberry mixture in a blender or food processor until smooth. Pour the puree on top of the filling and spread into an even layer. Chill the cheesecake in the freezer for at least 45 minutes.',
                          style: TextStyle(
                            fontFamily: 'Karla',
                            fontSize: 15,
                            fontVariations: [FontVariation('wght', 400)],
                            letterSpacing: 1,
                            color: TeColors.gray,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    textDirection: TextDirection.ltr,
                    children: [
                      Text(
                        ' 8. ',
                        style: TextStyle(
                          fontFamily: 'Karla',
                          fontSize: 15,
                          fontVariations: [FontVariation('wght', 400)],
                          letterSpacing: 1,
                          color: TeColors.gray,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Transfer the cheesecake to the refrigerator and keep chilled until ready to serve. To serve, unmold and slice the cheesecake.',
                          style: TextStyle(
                            fontFamily: 'Karla',
                            fontSize: 15,
                            fontVariations: [FontVariation('wght', 400)],
                            letterSpacing: 1,
                            color: TeColors.gray,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: TeColors.lightPurpleSec,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Balsamic Butternut, Kale and\nCranberry Panzanella',
                    style: TeText.header5.copyWith(color: TeColors.purple),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Ingredients',
                    style: TeText.header5.copyWith(color: TeColors.purple),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Roasted butternut squash',
                    style: TextStyle(
                      fontFamily: 'Karla',
                      fontSize: 15,
                      fontVariations: [FontVariation('wght', 700)],
                      letterSpacing: 1,
                      color: TeColors.gray,
                    ),
                  ),
                  Text(
                    ''' • 1 medium butternut squash (about 2 pounds), peeled and sliced into ¾-inch cubes
 • 1 to 2 tablespoons olive oil
 • Salt and freshly ground pepper''',
                    style: TextStyle(
                      fontFamily: 'Karla',
                      fontSize: 15,
                      fontVariations: [FontVariation('wght', 400)],
                      letterSpacing: 1,
                      color: TeColors.gray,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Toasted croutons and seeds',
                    style: TextStyle(
                      fontFamily: 'Karla',
                      fontSize: 15,
                      fontVariations: [FontVariation('wght', 700)],
                      letterSpacing: 1,
                      color: TeColors.gray,
                    ),
                  ),
                  Text(
                    ''' • 1 small loaf (about ½ pound) crusty whole grain bread, sliced into 1-inch cubes
 • 4 tablespoons seeds, such as pepitas (pumpkin seeds), sesame seeds, and/or sunflower seeds
 • 2 tablespoons olive oil
 • ¼ teaspoon salt''',
                    style: TextStyle(
                      fontFamily: 'Karla',
                      fontSize: 15,
                      fontVariations: [FontVariation('wght', 400)],
                      letterSpacing: 1,
                      color: TeColors.gray,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Balsamic vinaigrette',
                    style: TextStyle(
                      fontFamily: 'Karla',
                      fontSize: 15,
                      fontVariations: [FontVariation('wght', 700)],
                      letterSpacing: 1,
                      color: TeColors.gray,
                    ),
                  ),
                  Text(
                    ''' • ¼ cup olive oil
 • 1 tablespoon plus 1 teaspoon balsamic vinegar
 • 2 teaspoons maple syrup or honey
 • 1 teaspoon Dijon mustard
 • ⅛ teaspoon salt
 • Freshly ground pepper, to taste''',
                    style: TextStyle(
                      fontFamily: 'Karla',
                      fontSize: 15,
                      fontVariations: [FontVariation('wght', 400)],
                      letterSpacing: 1,
                      color: TeColors.gray,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Kale salad',
                    style: TextStyle(
                      fontFamily: 'Karla',
                      fontSize: 15,
                      fontVariations: [FontVariation('wght', 700)],
                      letterSpacing: 1,
                      color: TeColors.gray,
                    ),
                  ),
                  Text(
                    ''' • 1 large bunch of Tuscan kale or regular curly kale, ribs removed and chopped into small, bite-sized pieces
 • ⅔ cup grated Pecorino Romano or Parmesan cheese
 • ½ cup dried cranberries
 • 1 medium shallot (the whole bulb, papery ''',
                    style: TextStyle(
                      fontFamily: 'Karla',
                      fontSize: 15,
                      fontVariations: [FontVariation('wght', 400)],
                      letterSpacing: 1,
                      color: TeColors.gray,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Instructions for Preparation',
                    style: TeText.header5.copyWith(color: TeColors.purple),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    textDirection: TextDirection.ltr,
                    children: [
                      Text(
                        ' 1. ',
                        style: TextStyle(
                          fontFamily: 'Karla',
                          fontSize: 15,
                          fontVariations: [FontVariation('wght', 400)],
                          letterSpacing: 1,
                          color: TeColors.gray,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Preheat oven to 420°F with racks in the upper third and lower third of the oven. Line two rimmed baking sheets with parchment paper for easier cleanup (I used one large half-sheet for the butternut and a smaller quarter-sheet for the croutons).',
                          style: TextStyle(
                            fontFamily: 'Karla',
                            fontSize: 15,
                            fontVariations: [FontVariation('wght', 400)],
                            letterSpacing: 1,
                            color: TeColors.gray,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    textDirection: TextDirection.ltr,
                    children: [
                      Text(
                        ' 2. ',
                        style: TextStyle(
                          fontFamily: 'Karla',
                          fontSize: 15,
                          fontVariations: [FontVariation('wght', 400)],
                          letterSpacing: 1,
                          color: TeColors.gray,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Roast the squash: On one of your lined baking sheets, toss the cubed butternut in enough olive oil to lightly coat all sides. Sprinkle with salt and pepper and arrange the butternut in a single layer. Roast on the lower third rack until the butternut is tender throughout and caramelized on the edges, about 35 to 40 minutes, tossing at the 20-minute mark when you add the croutons during step 4.',
                          style: TextStyle(
                            fontFamily: 'Karla',
                            fontSize: 15,
                            fontVariations: [FontVariation('wght', 400)],
                            letterSpacing: 1,
                            color: TeColors.gray,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    textDirection: TextDirection.ltr,
                    children: [
                      Text(
                        ' 3. ',
                        style: TextStyle(
                          fontFamily: 'Karla',
                          fontSize: 15,
                          fontVariations: [FontVariation('wght', 400)],
                          letterSpacing: 1,
                          color: TeColors.gray,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Prepare the croutons: On your other baking sheet, combine the cubed bread with the seeds and salt. Drizzle on 2 tablespoons olive oil and toss to lightly coat the bread. Don’t worry about trying to get the seeds to stick to the bread, just try to make sure they’re lightly coated in oil. Arrange the mixture in a single layer so no croutons are on top of one another.',
                          style: TextStyle(
                            fontFamily: 'Karla',
                            fontSize: 15,
                            fontVariations: [FontVariation('wght', 400)],
                            letterSpacing: 1,
                            color: TeColors.gray,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    textDirection: TextDirection.ltr,
                    children: [
                      Text(
                        ' 4. ',
                        style: TextStyle(
                          fontFamily: 'Karla',
                          fontSize: 15,
                          fontVariations: [FontVariation('wght', 400)],
                          letterSpacing: 1,
                          color: TeColors.gray,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Once you have tossed the butternut and placed it back on the lower rack, place the sheet of croutons on the upper rack. Toast the bread for 10 to 13 minutes, until the edges are golden. Remove the croutons from the oven and check the squash—it will probably need 5 to 10 more minutes before the edges are caramelized. Once the butternut is done, remove the pan from the oven and set it aside to cool.',
                          style: TextStyle(
                            fontFamily: 'Karla',
                            fontSize: 15,
                            fontVariations: [FontVariation('wght', 400)],
                            letterSpacing: 1,
                            color: TeColors.gray,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    textDirection: TextDirection.ltr,
                    children: [
                      Text(
                        ' 5. ',
                        style: TextStyle(
                          fontFamily: 'Karla',
                          fontSize: 15,
                          fontVariations: [FontVariation('wght', 400)],
                          letterSpacing: 1,
                          color: TeColors.gray,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'To prepare the vinaigrette: Whisk together all of the ingredients until emulsified.',
                          style: TextStyle(
                            fontFamily: 'Karla',
                            fontSize: 15,
                            fontVariations: [FontVariation('wght', 400)],
                            letterSpacing: 1,
                            color: TeColors.gray,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    textDirection: TextDirection.ltr,
                    children: [
                      Text(
                        ' 6. ',
                        style: TextStyle(
                          fontFamily: 'Karla',
                          fontSize: 15,
                          fontVariations: [FontVariation('wght', 400)],
                          letterSpacing: 1,
                          color: TeColors.gray,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'To prepare the kale: Transfer the chopped kale to a big salad bowl. Sprinkle a small pinch of sea salt over the kale and massage the leaves with your hands by lightly scrunching big handfuls at a time, until the leaves are darker in color and fragrant, about 30 seconds.',
                          style: TextStyle(
                            fontFamily: 'Karla',
                            fontSize: 15,
                            fontVariations: [FontVariation('wght', 400)],
                            letterSpacing: 1,
                            color: TeColors.gray,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    textDirection: TextDirection.ltr,
                    children: [
                      Text(
                        ' 7. ',
                        style: TextStyle(
                          fontFamily: 'Karla',
                          fontSize: 15,
                          fontVariations: [FontVariation('wght', 400)],
                          letterSpacing: 1,
                          color: TeColors.gray,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Final assembly: Add the grated cheese, cranberries, and shallot to the bowl. Drizzle enough dressing into the bowl to lightly coat the leaves (you might not need all of it), then toss to coat. Add the roasted butternut and croutons and gently toss to combine. Drizzle in extra dressing if the salad seems like it needs it. For best flavor, let the salad rest for 10 minutes before serving.',
                          style: TextStyle(
                            fontFamily: 'Karla',
                            fontSize: 15,
                            fontVariations: [FontVariation('wght', 400)],
                            letterSpacing: 1,
                            color: TeColors.gray,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
