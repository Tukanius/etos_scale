import 'package:etos_scale_windows/contants/colors.dart';
import 'package:etos_scale_windows/models/scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class ScaleCard extends StatefulWidget {
  final Scale data;
  const ScaleCard({
    super.key,
    required this.data,
  });

  @override
  State<ScaleCard> createState() => _ScaleCardState();
}

class _ScaleCardState extends State<ScaleCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 215,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 8,
                height: 215,
                decoration: BoxDecoration(
                  color: gray102,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Машины дугаар',
                                  style: TextStyle(
                                    color: textcolor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  widget.data.vehiclePlateNo,
                                  style: TextStyle(
                                    color: black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 40),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Чиргүүлын дугаар',
                                  style: TextStyle(
                                    color: textcolor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  widget.data.trailerPlateNumbers.join(", "),
                                  style: TextStyle(
                                    color: black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 40),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Хэмжилтийн жин',
                                  style: TextStyle(
                                    color: textcolor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '${widget.data.weightValue}',
                                  style: TextStyle(
                                    color: black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            )
                          ]),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Огноо',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: textcolor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                DateFormat("yyyy-MM-dd HH:mm").format(
                                  DateTime.parse(widget.data.createdAt),
                                ),
                                style: TextStyle(
                                  color: black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: gray102,
                      endIndent: 20,
                      indent: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Баримтны дугаар: ${widget.data.receipt?.receiptNo ?? '-'}",
                                style: TextStyle(
                                  color: textcolor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                "Гэрээний дугаар: ${widget.data.receipt?.contractNo ?? '-'}",
                                style: TextStyle(
                                  color: textcolor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Лацны дугаар: ${widget.data.sealNumbers.join(",")}',
                            style: TextStyle(
                              color: textcolor,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Бүтгээгдэхүүн: ${widget.data.receipt?.productName ?? '-'}',
                                style: TextStyle(
                                  color: textcolor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Чингэлэг: ${widget.data.containerNumbers.join(", ")}',
                            style: TextStyle(
                              color: textcolor,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Борлуулагч: ${widget.data.receipt?.supplierName ?? '-'}',
                                style: TextStyle(
                                  color: textcolor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Тээвэрлэгч: ${widget.data.receipt?.transportName ?? '-'}',
                            style: TextStyle(
                              color: textcolor,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Худалдан авагч: ${widget.data.receipt?.buyerName ?? '-'}',
                                style: TextStyle(
                                  color: textcolor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Жолооч: ${widget.data.receipt != null ? '${widget.data.receipt?.driverName ?? '-'}, ${widget.data.receipt?.driverRegisterNo ?? '-'}, ${widget.data.receipt?.driverPhone ?? '-'}' : '-'}',
                            style: TextStyle(
                              color: textcolor,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 215,
                  width: 50,
                  decoration: BoxDecoration(
                    color: colorBlue,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Center(
                    child: SvgPicture.asset('assets/svg/container_printer.svg'),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
