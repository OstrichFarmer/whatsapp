import 'package:flutter/material.dart';

class OwnMessageCard extends StatelessWidget {
  const OwnMessageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 45,
        ),
        child: const Card(
          color: Color(0XFFDCF8C6),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 10,
                  bottom: 20,
                  right: 90,
                  top: 10,
                ),
                child: Text(
                    "Heyd kjn jubjbkj2bkbflk2bnklbnlkenf;oj2pojpo2ejopfn2lofbuiob2kjvcb2iubwf2j4bfiubvewjkbfdsakjboiboubb"),
              ),
              Positioned(
                right: 3,
                bottom: 4,
                child: Row(
                  children: [
                    Text(
                      "22:18pm",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontStyle: FontStyle.italic),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.done_all,
                      size: 20,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
