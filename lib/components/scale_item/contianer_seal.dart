import 'package:etos_scale_windows/components/ui/form_text_field.dart';
import 'package:etos_scale_windows/contants/colors.dart';
import 'package:flutter/material.dart';

class ContainerSeal extends StatefulWidget {
  final int index;
  final Color? color;
  const ContainerSeal({super.key, required this.index, this.color});

  @override
  State<ContainerSeal> createState() => _ContainerSealState();
}

class _ContainerSealState extends State<ContainerSeal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: gray101,
      ),
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Лац ${widget.index + 1}",
            style: TextStyle(
              color: black,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          FormTextField(
            name: "sealNumber${widget.index}_4",
            labelText: "",
            filled: true,
            fillColor: gray102,
            textColor: black,
            labelColor: black,
            bgColor: Colors.transparent,
            // validator: FormBuilderValidators.compose([
            //   widget.index == 0
            //       ? FormBuilderValidators.required(errorText: 'Алдаа!')
            //       : (value) {
            //           return validateContainer(
            //             (value != null ? value as String : value)
            //                 as String?,
            //           );
            //         }
            // ]),
          ),
        ],
      ),
    );
  }
}
