import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:omjaycargo/assets/app_colors.dart';
import 'package:omjaycargo/helpers/helper.dart';

import '../assets/app_assets.dart';
import '../generated/l10n.dart';

class ComplainScreen extends StatefulWidget {
  const ComplainScreen({Key? key}) : super(key: key);

  @override
  State<ComplainScreen> createState() => _ComplainScreenState();
}

class _ComplainScreenState extends State<ComplainScreen> {

  final List<String> type = ['domestic_zone', 'international_zone'];
  final List<String> category = ['Select Country', 'India', 'USA', 'UAE'];
  final List<String> subCategory = ['NON-DOC', 'DOC'];
  final List<String> barCode = ['NON-DOC', 'DOC'];

  TextEditingController descriptionController = TextEditingController();

  String? selectedType;
  String? selectedCategory;
  String? selectedSubCategory;
  String? selectedBarcode;
  final TextEditingController weightCtrl = TextEditingController();
  // helper to render label with a raised red star (superscript-like)
  Widget requiredLabel(String label, {bool required = true}) {
    const double labelFontSize = 16;
    final labelStyle = TextStyle(
      color: Colors.blue.shade900,
      fontSize: labelFontSize,
      fontWeight: FontWeight.bold,
    );

    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: label, style: labelStyle),
          if (required)
          // WidgetSpan + Transform.translate to simulate superscript *
            WidgetSpan(
              alignment: PlaceholderAlignment.top,
              child: Transform.translate(
                offset: const Offset(1, -4), // adjust vertical offset to taste
                child: Text(
                  '*',
                  textScaleFactor: 1.0,
                  style: TextStyle(
                    color: AppColors.secoundPrimary,
                    fontSize: labelFontSize * 1.15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  InputDecoration inputDecor() {
    return InputDecoration(
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    );
  }


  // Helper to pick date
  Future<void> pickDate(
      BuildContext context,
      TextEditingController controller,
      ) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      controller.text = DateFormat('yyyy-MM-dd').format(picked);
    }
  }



  @override
  Widget build(BuildContext context) {
    final double horizontalPadding = 16;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.allScreenBGColor,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.bookingStatusCompleted,width:2),
            ),
            padding: const EdgeInsets.all(5),
            child: Image.asset(AppAssets.icBackIcon, height: 10, width: 10),
          ),
        ),
        title: Text(
          S.current.complain,
          style: TextStyle(
            color: AppColors.bookingStatusCompleted,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: 24,
          ),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  // pink soft shadow like screenshot
                  boxShadow: [
                    BoxShadow(
                      color: Colors.pink.shade50,
                      blurRadius: 14,
                      spreadRadius: 4,
                      offset: const Offset(0, 4),
                    ),
                  ],
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              requiredLabel(
                                S.current.type,
                              ), // replace with S.current.zone_type
                              DropdownButtonFormField<String>(
                                isExpanded: true,
                                value: selectedType,
                                items: type
                                    .map(
                                      (e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(
                                      e,
                                      style: const TextStyle(
                                        color: Colors
                                            .black, // dropdown items text
                                        fontSize: 14,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                )
                                    .toList(),
                                onChanged: (v) =>
                                    setState(() => selectedType = v),
                                style: const TextStyle(
                                  color: Colors.black, // selected value text
                                  fontSize: 14,
                                ),
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 8,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                    ), // default border
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ), // normal
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ), // when focused
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: const BorderSide(
                                      color: Colors.black54,
                                    ), // disabled state
                                  ),
                                ),
                                hint: const Text(
                                  'Select Zone',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                dropdownColor: Colors.white,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
        
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              requiredLabel(
                                S.current.category,
                              ),
                              DropdownButtonFormField<String>(
                                isExpanded: true,
                                value: selectedCategory,
                                items: category
                                    .map(
                                      (e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(
                                      e,
                                      style: const TextStyle(
                                        color: Colors
                                            .black, // dropdown items text
                                        fontSize: 14,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                )
                                    .toList(),
                                onChanged: (v) =>
                                    setState(() => selectedCategory = v),
                                style: const TextStyle(
                                  color: Colors.black, // selected value text
                                  fontSize: 14,
                                ),
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 8,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                    ), // default border
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ), // normal
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ), // when focused
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: const BorderSide(
                                      color: Colors.black54,
                                    ), // disabled state
                                  ),
                                ),
                                hint: const Text(
                                  'Select Zone',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                dropdownColor: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
        
                    const SizedBox(height: 12),
        
                    // Second row: Doc Type and Weight
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              requiredLabel(
                                S.current.sub_category,
                              ), // S.current.doc_type
                              DropdownButtonFormField<String>(
                                isExpanded: true,
                                value: selectedSubCategory,
                                items: subCategory
                                    .map(
                                      (e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(
                                      e,
                                      style: const TextStyle(
                                        color: Colors
                                            .black, // dropdown items text
                                        fontSize: 14,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                )
                                    .toList(),
                                onChanged: (v) =>
                                    setState(() => selectedSubCategory = v),
                                style: const TextStyle(
                                  color: Colors.black, // selected value text
                                  fontSize: 14,
                                ),
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 8,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                    ), // default border
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ), // normal
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ), // when focused
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: const BorderSide(
                                      color: Colors.black54,
                                    ), // disabled state
                                  ),
                                ),
                                hint: const Text(
                                  'Select Zone',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                dropdownColor: Colors.white,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              requiredLabel(
                                S.current.barcode,
                                required: false,
                              ), // optional example
                              const SizedBox(height: 8),
                              DropdownButtonFormField<String>(
                                isExpanded: true,
                                value: selectedBarcode,
                                items: barCode
                                    .map(
                                      (e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(
                                      e,
                                      style: const TextStyle(
                                        color: Colors
                                            .black, // dropdown items text
                                        fontSize: 14,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                )
                                    .toList(),
                                onChanged: (v) =>
                                    setState(() => selectedBarcode = v),
                                style: const TextStyle(
                                  color: Colors.black, // selected value text
                                  fontSize: 14,
                                ),
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 8,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                    ), // default border
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ), // normal
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ), // when focused
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: const BorderSide(
                                      color: Colors.black54,
                                    ), // disabled state
                                  ),
                                ),
                                hint: const Text(
                                  'Select Zone',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                dropdownColor: Colors.white,
                              ),
        
                            ],
                          ),
                        ),
                      ],
                    ),
        
                    const SizedBox(height: 18),
        
                    requiredLabel(
                      S.current.description,
                    ), // S.c
                    TextFormField(
                      controller: descriptionController,
                      readOnly: false,
                      decoration: InputDecoration(
                        hint: Text(S.current.description),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.black, width: 1.2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.black, width: 1.5),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6, // reduced height
                        ),
                      ),
                      style: const TextStyle(fontSize: 14),
                    ),
        
                    Helper.verticalSpace(16),
        
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10),
                          ),
                          border: Border.all(color: AppColors.secoundPrimary,width: 2)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Icon(Icons.photo,color: AppColors.primary,size: 56,),
                        ),
                      ),
                    ),
                    Helper.verticalSpace(16),
        
        
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          // handle submit
                          // validate fields and send request or show error
                          // Example:
                          if (selectedType == null ||
                              selectedSubCategory == null ||
                              selectedCategory == null ||
                              selectedBarcode == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Please fill all required fields'),
                              ),
                            );
                            return;
                          }
        
                          // TODO: submit logic
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red.shade600,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 36,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        child: const Text(
                          'SUBMIT',
                          style: TextStyle(color: AppColors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
        
              Helper.verticalSpace(8),
        
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  // pink soft shadow like screenshot
                  boxShadow: [
                    BoxShadow(
                      color: Colors.pink.shade50,
                      blurRadius: 14,
                      spreadRadius: 4,
                      offset: const Offset(0, 4),
                    ),
                  ],
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                 mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(S.current.bulk_complain,style:TextStyle(
                      color: Colors.blue.shade900,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    )),
                    
                    Helper.verticalSpace(8),
        
                    Text(S.current.upload_csv_file,style:TextStyle(
                      color: Colors.blue.shade900,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    )),
        
                    Helper.verticalSpace(16),
        
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10),
                            ),
                            border: Border.all(color: AppColors.secoundPrimary,width: 2)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Icon(Icons.edit_document,color: AppColors.primary,size: 56,),
                        ),
                      ),
                    ),
                    Helper.verticalSpace(16),
        
        
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red.shade600,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 36,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        child: const Text(
                          'SUBMIT',
                          style: TextStyle(color: AppColors.white),
                        ),
                      ),
                    ),
                    
                  ],
                ),
              ),
        
            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey.shade100,
    );
  }
}
