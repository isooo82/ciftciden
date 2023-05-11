import 'package:ciftciden/ui/common_widgets/atoms/custom_common_button.dart';
import 'package:ciftciden/ui/common_widgets/organisms/upper_place_holder_with_houses.dart';
import 'package:ciftciden/ui/constants/paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:sizer/sizer.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  int chosen = 0;
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const UpperPlaceHolderWithHouses(),
          Flexible(
              flex: 4,
              child: Container(
                // color: Colors.white,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            chosen = 0;
                          });
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: chosen == 0
                              ? Colors.blueGrey.shade100
                              : Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          side: const BorderSide(
                            color: Colors.transparent,
                            width: 0.0,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(CiftcidenPaths.sutImage,
                                width: 15.w, height: 10.h),
                            Text(
                              "Süt",
                              style: TextStyle(
                                  fontSize: 20.sp, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            chosen = 1;
                          });
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: chosen == 1
                              ? Colors.blueGrey.shade100
                              : Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          side: const BorderSide(
                            color: Colors.transparent,
                            width: 0.0,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(CiftcidenPaths.yogurtImage,
                                width: 15.w, height: 10.h),
                            Text(
                              "Yoğurt",
                              style: TextStyle(
                                  fontSize: 20.sp, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )),
          Flexible(
              flex: 7,
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 15.w, vertical: 0.5.h),
                child: Container(
                  // color: Colors.white,
                  child: FormBuilder(
                    key: _formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: FormBuilderTextField(

                                decoration: const InputDecoration(
                                  labelText: 'Miktar',
                                  border: OutlineInputBorder(),
                                ),
                                name: 'amount',
                                onChanged: (val) {},
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Container(
                                  // add border
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(18.sp),
                                    child: Text(
                                      chosen == 0 ? 'litre' : 'kg',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 0.5.h),
                        FormBuilderDateTimePicker(
                          name: 'date',
                          initialEntryMode: DatePickerEntryMode.calendar,
                          initialValue: DateTime.now(),
                          inputType: InputType.date,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: 'Tarih',
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                _formKey.currentState!.fields['date']
                                    ?.didChange(null);
                              },
                            ),
                          ),
                          initialDatePickerMode: DatePickerMode.day,
                          initialDate: DateTime
                              .now(), // locale: const Locale.fromSubtags(languageCode: 'fr'),
                        ),
                        SizedBox(height: 0.5.h),
                        FormBuilderDateTimePicker(
                            name: 'time',
                            initialValue: DateTime.now(),
                            inputType: InputType.time,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: 'Saat',
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: () {
                                  _formKey.currentState!.fields['date']
                                      ?.didChange(null);
                                },
                              ),
                            ),
                            initialTime: TimeOfDay.now()
                            // locale: const Locale.fromSubtags(languageCode: 'fr'),
                            ),
                        CustomCommonButton(
                            text: "Siparişi Gönder", onPressed: () {})
                      ],
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
