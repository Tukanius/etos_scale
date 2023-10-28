import 'package:flutter/material.dart';
import 'package:etos_scale_windows/widgets/colors.dart';

class CustomContainer extends StatefulWidget {
  const CustomContainer({
    super.key,
  });

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 145,
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: red,
              ),
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Чингэлэг 1',
                    style: TextStyle(
                      color: white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: black.withOpacity(0.2),
                        ),
                        margin: const EdgeInsets.only(right: 5),
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 7, vertical: 4),
                          child: const Text(
                            'CICU',
                            style: TextStyle(
                              color: white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: black.withOpacity(0.2),
                        ),
                        margin: const EdgeInsets.only(right: 5),
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 7, vertical: 4),
                          child: const Text(
                            '123123',
                            style: TextStyle(
                              color: white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: black.withOpacity(0.2),
                        ),
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 7, vertical: 4),
                          child: const Text(
                            '[2]',
                            style: TextStyle(
                              color: white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: black.withOpacity(0.2),
                    ),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 7, vertical: 4),
                      child: const Text(
                        'QWEQ',
                        style: TextStyle(
                          color: white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: red,
              ),
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Чингэлэг 1',
                    style: TextStyle(
                      color: white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: black.withOpacity(0.2),
                        ),
                        margin: const EdgeInsets.only(right: 5),
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 7, vertical: 4),
                          child: const Text(
                            'CICU',
                            style: TextStyle(
                              color: white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: black.withOpacity(0.2),
                        ),
                        margin: const EdgeInsets.only(right: 5),
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 7, vertical: 4),
                          child: const Text(
                            '123123',
                            style: TextStyle(
                              color: white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: black.withOpacity(0.2),
                        ),
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 7, vertical: 4),
                          child: const Text(
                            '[2]',
                            style: TextStyle(
                              color: white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: black.withOpacity(0.2),
                    ),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 7, vertical: 4),
                      child: const Text(
                        'QWEQ',
                        style: TextStyle(
                          color: white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: red,
              ),
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Чингэлэг 1',
                    style: TextStyle(
                      color: white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: black.withOpacity(0.2),
                        ),
                        margin: const EdgeInsets.only(right: 5),
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 7, vertical: 4),
                          child: const Text(
                            'CICU',
                            style: TextStyle(
                              color: white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: black.withOpacity(0.2),
                        ),
                        margin: const EdgeInsets.only(right: 5),
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 7, vertical: 4),
                          child: const Text(
                            '123123',
                            style: TextStyle(
                              color: white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: black.withOpacity(0.2),
                        ),
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 7, vertical: 4),
                          child: const Text(
                            '[2]',
                            style: TextStyle(
                              color: white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: black.withOpacity(0.2),
                    ),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 7, vertical: 4),
                      child: const Text(
                        'QWEQ',
                        style: TextStyle(
                          color: white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: red,
              ),
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Чингэлэг 1',
                    style: TextStyle(
                      color: white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: black.withOpacity(0.2),
                        ),
                        margin: const EdgeInsets.only(right: 5),
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 7, vertical: 4),
                          child: const Text(
                            'CICU',
                            style: TextStyle(
                              color: white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: black.withOpacity(0.2),
                        ),
                        margin: const EdgeInsets.only(right: 5),
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 7, vertical: 4),
                          child: const Text(
                            '123123',
                            style: TextStyle(
                              color: white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: black.withOpacity(0.2),
                        ),
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 7, vertical: 4),
                          child: const Text(
                            '[2]',
                            style: TextStyle(
                              color: white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: black.withOpacity(0.2),
                    ),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 7, vertical: 4),
                      child: const Text(
                        'QWEQ',
                        style: TextStyle(
                          color: white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
