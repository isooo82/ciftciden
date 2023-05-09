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
                color: Colors.white,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlinedButton(
                        onPressed: () {},
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(CiftcidenPaths.sutImage,
                                width: 15.w, height: 10.h),
                            Text(
                              "Süt",
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlinedButton(
                        onPressed: () {},
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(CiftcidenPaths.yogurtImage,
                                width: 15.w, height: 10.h),
                            Text(
                              "Yoğurt",
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline),
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
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: Container(
                  color: Colors.white,
                  child: FormBuilder(
                    key: _formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: FormBuilderTextField(
                                name: 'amount',
                                onChanged: (val) {
                                  print(
                                      val); // Print the text value write into TextField
                                },
                              ),
                            ),
                            const Expanded(
                              child: Text(
                                'text',
                              ),
                            ),
                          ],
                        ),
                        FormBuilderDateTimePicker(
                          name: 'date',
                          initialEntryMode: DatePickerEntryMode.calendar,
                          initialValue: DateTime.now(),
                          inputType: InputType.both,
                          decoration: InputDecoration(
                            labelText: 'Appointment Time',
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                _formKey.currentState!.fields['date']
                                    ?.didChange(null);
                              },
                            ),
                          ),
                          initialTime: const TimeOfDay(hour: 8, minute: 0),
                          // locale: const Locale.fromSubtags(languageCode: 'fr'),
                        ),
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
