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
                      margin: const EdgeInsets.only(bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
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
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
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
                                widget.data.trailerPlateNumbers.join(","),
                                style: TextStyle(
                                  color: black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Цэвэр жин',
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
                                '${widget.data.weightValue}КГ',
                                style: TextStyle(
                                  color: black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Машины жин',
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
                                '${widget.data.weightValue}КГ',
                                style: TextStyle(
                                  color: black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Бохир жин',
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
                                '------КГ',
                                style: TextStyle(
                                  color: black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Төрөл',
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
                                '------',
                                style: TextStyle(
                                  color: black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
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
                                "Орсон огноо: ${DateFormat("yyyy-MM-dd").format(
                                  DateTime.parse(widget.data.createdAt),
                                )}",
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
                                'Гарсан огноо:',
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
                                'Жолоочийн нэр: Б.Буянжаргал',
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
                                'Тээвэрлэгч: Мэнг Гу Гуо Эр Интер',
                                style: TextStyle(
                                  color: textcolor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Чингэлэг дугаар: ${widget.data.containerNumbers.join(", ")}',
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
                                'Жолоочийн нэр: Б.Буянжаргал',
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
                                'Тээвэрлэгч: Мэнг Гу Гуо Эр Интер',
                                style: TextStyle(
                                  color: textcolor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Чингэлэг дугаар: ${widget.data.containerNumbers.join(", ")}',
                            style: TextStyle(
                              color: textcolor,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
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
