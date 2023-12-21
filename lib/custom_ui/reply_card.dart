import 'package:flutter/material.dart';

class ReplyCard extends StatelessWidget {
  const ReplyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 70,
        ),
        child: const Card(
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
            ],
          ),
        ),
      ),
    );
  }
}
