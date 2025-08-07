import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_and_serene/widgets/website_scaffold.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return WebsiteScaffold(
      title: 'Home',
      child: LayoutBuilder(
        builder: (context, constraints) {
          final bool isWide = constraints.maxWidth > 700;

          return SingleChildScrollView(
            child: Column(
              children: [

                // SECTION 1: Hero Section with Image & Text
                Container(
                  height: isWide ? screenHeight : null,
                  width: double.infinity,
                  color: const Color(0xFFFFFBF5),
                  child: isWide
                      ? Stack(
                          fit: StackFit.expand,
                          children: [
                            // Background image
                            Image.asset(
                              'assets/images/front_shop.jpg',
                              fit: BoxFit.cover,
                            ),
                            Container(
                              color: Colors.black.withAlpha(
                                50,
                              ), // semi-transparent overlay
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 40,
                                ),
                                child: Text(
                                  'Your Healthier\nBreakfast Spot',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.playfairDisplay(
                                    fontSize: 60,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    shadows: [
                                      Shadow(
                                        color: Colors.black45,
                                        offset: const Offset(2, 2),
                                        blurRadius: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      //if the screen is minimised, shows different layout.
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 40),
                              child: Text(
                                'Your Healthier\nBreakfast Spot',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.playfairDisplay(
                                  fontSize: 36,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.green[800],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  'assets/images/front_shop.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                ),

                // SECTION 2: Health Tips
                Container(
                  width: double.infinity,
                  color: const Color.fromARGB(
                    255,
                    190,
                    222,
                    160,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 40,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //section title
                      Text(
                        'Health Tips',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 40,
                          //fontWeight: FontWeight.bold,
                          color: Colors.green[900],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),
                  
                      // Expandable tiles (accordion style)
                      ...List.generate(6, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Center(
                            child: SizedBox(
                              width: 600,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.green[200],
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 8,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Theme(
                                  data: Theme.of(
                                    context,
                                  ).copyWith(dividerColor: Colors.transparent),
                                  child: ExpansionTile(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    collapsedIconColor: Colors.green[900],
                                    iconColor: Colors.green[900],
                                    title: Text(
                                      'Tip ${index + 1}',
                                      style: GoogleFonts.playfairDisplay(
                                        fontSize: 20,
                                        color: Colors.green[900],
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 8,
                                        ),
                                        child: Text(
                                          'This is a placeholder for health tip ${index + 1}.',
                                          style: GoogleFonts.playfairDisplay(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),

                // SECTION 3: Why Choose Us?
                Container(
                  width: double.infinity,
                  height: screenHeight,
                  color: const Color(0xFFE5F4E3), // soft green
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Why Choose Us?',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[800],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Fresh, vibrant meals packed with nourishment, served with a smile.\nEverything made with care, from scratch, every day.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          fontSize: 18,
                          height: 1.6,
                          color: Colors.green[900],
                        ),
                      ),
                    ],
                  ),
                ),

                // SECTION 4: Another block with image & text
                Container(
                  height: screenHeight,
                  width: double.infinity,
                  color: const Color(0xFFFFFBF5),
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/salad.jpg',
                        height: 250,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 30),
                      Text(
                        'Local Ingredients, Global Flavours',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color: Colors.green[800],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'We carefully source every ingredient to bring you flavour-packed,\nnutrient-dense dishes without compromise.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          fontSize: 16,
                          height: 1.5,
                          color: Colors.green[900],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
          // Add more sections as needed...
        },
      ),
    );
  }
}





// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:green_and_serene/widgets/website_scaffold.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   //list of health tips to display above cards.
//   //This is a placeholder list, you can replace it with actual health tips.
//   final List<String> tips = List.generate(10, (i) => 'Tip ${i + 1}');

//   //list of swipe cards for menu options.
//   final List<Map<String, String>> navCards = [
//     {
//       "title": "Menu", 
//       "route": "/menu", 
//       "image": "assets/images/salad.jpg",
//     },
//     {
//       "title": "Find Us",
//       "route": "/location",
//       "image": "assets/images/front_shop.jpg",
//     },
//     {
//       "title": "About Us",
//       "route": "/about",
//       "image": "assets/images/coffee.jpg",
//     },
//     {
//       "title": "Contact",
//       "route": "/contact",
//       "image": "assets/images/palenta.jpg",
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return WebsiteScaffold(
//       title: 'Green & Serene',
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,

//           // Health Tips Slideshow
//           children: [
//             SizedBox(
//               height: 100,
//               child: PageView.builder(
//                 itemCount: tips.length,
//                 controller: PageController(viewportFraction: 0.85),
//                 itemBuilder: (context, index) => Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.green[100],
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     alignment: Alignment.center,
//                     child: Text(
//                       tips[index],
//                       style: GoogleFonts.bebasNeue(
//                         fontSize: 25,
//                         color: Colors.green[800],
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),

//             // Navigation Cards
//             const SizedBox(height: 50),
//             SizedBox(
//               width: MediaQuery.of(context).size.width,
//               height: 450,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 //tells the program how manu cards to show.
//                 itemCount: navCards.length,
//                 itemBuilder: (context, index) => GestureDetector(
//                   onTap: () {
//                     Navigator.pushNamed(context, navCards[index]['route']!);
//                   },
//                   child: Container(
//                     margin: const EdgeInsets.symmetric(horizontal: 10),
//                     width: MediaQuery.of(context).size.width * 0.7,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       image: DecorationImage(
//                         image: AssetImage(
//                           navCards[index]['image'] ??
//                               'assets/images/default.jpg',
//                         ),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     child: Container(
//                       alignment: Alignment.bottomLeft,
//                       padding: const EdgeInsets.all(12),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         gradient: LinearGradient(
//                           begin: Alignment.topCenter,
//                           end: Alignment.bottomCenter,
//                           colors: [
//                             Colors.transparent,
//                             Colors.black.withAlpha(150),
//                           ],
//                         ),
//                       ),
//                       child: Text(
//                         navCards[index]['title']!,
//                         style: GoogleFonts.bebasNeue(
//                           fontSize: 35,
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
