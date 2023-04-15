import 'package:flutter/material.dart';
// import 'package:better_player/better_player.dart';

class CourseInfoScreen extends StatefulWidget {
  @override
  _CourseInfoScreenState createState() => _CourseInfoScreenState();
}

class _CourseInfoScreenState extends State<CourseInfoScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xFF063278),
        ),
        body: Stack(
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 50),
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'PLAYER DEVELOPMENT PROJECT',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff000000),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Understanding Female Footballers',
                              style: TextStyle(
                                height: 1,
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff073278),
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.sms,
                                  color: Color(0xff073278),
                                  size: 18,
                                ),
                                Text(
                                  ' No Comments ',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                    letterSpacing: 0.20,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              color: Color(0xff073278),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'This article was shared by Player ',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Color(0xff000000),
                                  fontStyle: FontStyle.italic),
                            ),
                            Text(
                              'Development Project.',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xff000000),
                                  fontStyle: FontStyle.italic),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            // AspectRatio(
                            //   aspectRatio: 16 / 9,
                            //   child: BetterPlayer.network(
                            //     "https://youtu.be/nXbXNB9E71o",
                            //     betterPlayerConfiguration:
                            //         BetterPlayerConfiguration(
                            //       aspectRatio: 16 / 9,
                            //     ),
                            //   ),
                            // ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Understanding our players is key to being a good coach; every individual is different, and we must tailor our approach to meet their needs. According to Maia Vink, Assistant Federation Development Manager and Girls’ and Women’s Lead for Capital Football, it may also be necessary to adjust our coaching methods when working with female players. Below, Vink explains the subtle differences in the ways women and men think, and how we can use this knowledge to better motivate female players, build positive relationships, and create effective learning environments.',
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0xff000000),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'In This Article',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff073278),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '\u2022 Understanding the female brain',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff073278),
                              ),
                            ),
                            Text(
                              '\u2022 Forging productive relationships',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff073278),
                              ),
                            ),
                            Text(
                              '\u2022 Providing optimal learning environments for female footballers',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff073278),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'The Female Brain',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff073278),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Over 99% of male and female genetic coding is identical. But the slight differences can impact the way men and women think. “Their brains work differently,” explains Vink. “Female brains are generally more rational; women like to think about the bigger picture; their brain chemistry means they tend to be more empathetic.',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff000000),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '“Men, on the other hand, are often more action-led and impulsive. Women and men aren’t the same, so it’s important that coaches get to know their players. It’s essential that we understand how the female athlete is different if we’re to be the best coach for them.”',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff000000),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Building Positive Relationships',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff073278),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'This understanding of the female brain should, in turn, influence how we build relationships with female players. “Females are generally more interested in people than their male counterparts,” says Vink. “They try harder to connect, and really make an effort to get to know their coach.',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff000000),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '“However, while women are certainly competitive, their empathy means they are often intolerant of over-competitiveness. It’s quite a big demotivator.” This, explains Vink, is something coaches should be particularly mindful of on gameday, when, in the heat of the moment, we may inadvertently become more forceful or obtrusive in our interventions.',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff000000),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '“In terms of survival strategies, females also tend towards a more collaborative approach,” she adds. “While men often have an ‘alpha male’ in the pack, women won’t necessarily converge around one key leader.',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff000000),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '“Thus, we might find that having two or three captains, or a leadership group, is a stronger way to lead a team than the traditional one-captain approach seen in the male game.”',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff000000),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Creating Effective Learning Conditions',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff073278),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'According to Vink, women also process information differently: “Our brains like to think in terms of the big picture,” she explains. “Women love to know why they’re doing something and understand the rationale behind it.',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff000000),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '“So, if you tell your female players why you’re delivering a certain practice — for example, ‘Our topic today is playing out from the back, and this is what we hope to achieve…’ — they will understand their role within the practice and really commit to learning. A major strength of the female player is that they love to learn.”',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff000000),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Finally, Vink notes that female players are often highly perceptive of the emotions of their teammates and coaches, and reminds us to consider our actions and mannerisms, especially in stressful situations: “You don’t want your players feeling stressed,” she says. “So be aware of how you hold yourself, and the gestures that you make. Female players can be quite feelings-based; it’s important to understand that.”',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff000000),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'The Key Points',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff073278),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '\u2022 There are subtle differences between the female brain and the male brain.',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff000000),
                              ),
                            ),
                            Text(
                              '\u2022 Women tend to be more rational, think in terms of the bigger picture, and possess greater empathy.',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff000000),
                              ),
                            ),
                            Text(
                              '\u2022 Female players are usually people-focussed, and likely to respond well to collaboration.',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff000000),
                              ),
                            ),
                            Text(
                              '\u2022 Remember the ‘why’: female athletes love to learn, and often find motivation in knowing the purpose behind their practice.',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff000000),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Divider(
                              color: Color(0xff073278),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Responses',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff073278),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(5),
                                      ),
                                      CircleAvatar(
                                        radius: 20,
                                        backgroundImage: AssetImage(
                                            'assets/images/userImage.png'),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            left: 8,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                "Jone",
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xff073278)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "Comment",
                                              textAlign: TextAlign.left,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xff073278)),
                                            )
                                          ],
                                        ),
                                        TextField(
                                          keyboardType: TextInputType.multiline,
                                          maxLines: 5,
                                          decoration: InputDecoration(
                                            fillColor: Colors.white,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            TextButton(
                                              style: TextButton.styleFrom(
                                                primary: Colors.white,
                                                backgroundColor:
                                                    Color(0xff66C23D),
                                              ),
                                              onPressed: () {},
                                              child: Text(
                                                'Post',
                                                style: TextStyle(
                                                  fontSize: 15,
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
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
