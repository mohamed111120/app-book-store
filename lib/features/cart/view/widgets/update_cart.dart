import 'package:flutter/material.dart';

class UpdateCart extends StatelessWidget {
  const UpdateCart({super.key, required this.itemQuantity});
  final int itemQuantity ;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 40,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(.5), width: 2)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.add,
            color: Colors.black,
          ),
          Text(
            itemQuantity.toString(),
            style: TextStyle(fontSize: 22),
          ),
          Icon(
            Icons.remove,
            color: Colors.grey.withOpacity(.5),
          ),
        ],
      ),
    );
  }
}
