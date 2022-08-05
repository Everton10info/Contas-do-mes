
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view-models/view_model_transaction.dart';

class DriverCard extends StatelessWidget {
  const DriverCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  
  final int index;

  @override
  Widget build(BuildContext context) {
    var viewModelTransaction = Provider.of<ViewModelTransaction>(context);
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 71, 35, 230),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      (index + 1).toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: ' ${viewModelTransaction.allList[index].date}\n',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          TextSpan(
                            text: '${viewModelTransaction.allList[index].nameTransaction}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                   /*  image: DecorationImage(
                      image: AssetImage(),
                    ), */
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.white,
            thickness: 1.3,
            height: 30,
          ),
          Row(
            children: const [
              Chip(
                label: Text(
                  'dfgfgsd pts',
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
                visualDensity: VisualDensity.compact,
                padding: EdgeInsets.zero,
                backgroundColor: Colors.grey,
              ),
              SizedBox(
                width: 8,
              ),
              Chip(
                label: Text(
                  'eeee',
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
                visualDensity: VisualDensity.compact,
                padding: EdgeInsets.zero,
                backgroundColor: Colors.grey,
              ),
              SizedBox(
                width: 8,
              ),
              Chip(
                label: Text(
                  'Bio',
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
                visualDensity: VisualDensity.compact,
                padding: EdgeInsets.zero,
                backgroundColor: Colors.grey,
              ),
            ],
          )
        ],
      ),
    );
  }
}
