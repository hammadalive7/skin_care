import 'package:flutter/material.dart';

class SkinConcernBody extends StatefulWidget {
  const SkinConcernBody({super.key});

  @override
  State<SkinConcernBody> createState() => _SkinConcernBodyState();
}

class _SkinConcernBodyState extends State<SkinConcernBody> {

  var skinconcerns = ["Acne", "Anti-Aging", "Dark Spots", "Dryness", "Dullness", "Oiliness", "Pores", "Redness", "Sensitivity", "Sun Protection", "Uneven Skin Tone", "Wrinkles"];
  var lifestyle = ["Hot Climate", "Active", "Cold Climate", "Stress", "Travel", "Pregnancy", "Allergic", "Smoking", "Alcohol", "Sleep Deprivation", "Diet", "Medication"];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Lifestyle", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              const SizedBox(height: 10,),
              //grid view of lifestyle options to choose from
              GridView.builder(
                shrinkWrap: true,
                itemCount: lifestyle.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2.5,
                ),
                itemBuilder: (BuildContext context, int index) {
                  var lifestyles = lifestyle[index];

                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white, // Set the background color as needed
                    ),
                    child: Card(
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(lifestyles) // Accessing RxInt value
                            // Add other UI elements as needed
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20,),
              const Text("Skin Concerns", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              const SizedBox(height: 10,),
              //grid view of lifestyle options to choose from
              GridView.builder(
                shrinkWrap: true,
                itemCount: skinconcerns.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2.5,
                ),
                itemBuilder: (BuildContext context, int index) {
                  var skinconcern = skinconcerns[index];

                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white, // Set the background color as needed
                    ),
                    child: Card(
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(skinconcern) // Accessing RxInt value
                            // Add other UI elements as needed
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),


            ],
          )
        ),
      ),
    );
  }
}
