import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:te_breath/te_controllers.dart/te_notes_controller.dart';
import 'package:te_breath/te_date_formatter.dart';
import 'package:te_breath/te_models/te_note_model.dart';
import 'package:te_breath/te_values/te_colors.dart';
import 'package:te_breath/te_values/te_text.dart';

class TeAddNoteScreen extends StatefulWidget {
  final TeNoteModel? teNoteModel;
  const TeAddNoteScreen({super.key, this.teNoteModel});

  @override
  State<TeAddNoteScreen> createState() => _TeAddNoteScreenState();
}

class _TeAddNoteScreenState extends State<TeAddNoteScreen> {
  final teNotesController = Get.find<TeNotesController>();
  final _teDateController = TextEditingController();
  late final RxInt _teBeingType;
  late final RxString _teReasons;
  final _teFoodController = TextEditingController();
  final _teLocationController = TextEditingController();
  late final RxString _teAllergen;
  late final RxString _tePlant;
  late final RxString _teAnimal;

  final RxBool showAddFood = false.obs;
  final RxBool showAddPlant = false.obs;
  final RxBool showAddAnimal = false.obs;

  final _teAddFood = TextEditingController();
  final _teAddPlant = TextEditingController();
  final _teAddAnimal = TextEditingController();

  final _teExpReason = ExpandableController();
  final _teExpFood = ExpandableController();
  final _teExpPlant = ExpandableController();
  final _teExpAnimal = ExpandableController();

  final _reasons = [
    'None',
    'Nasal congestion',
    'Asthmatic shortness of breath',
    'Itchy skin',
    'Tearing or itchy eyes',
    'Abdominal heaviness',
    'Clouded consciousness',
    'Everything is fine, just in a bad mood',
    'Everything is great',
  ];

  late final List<String> _foods;
  late final List<String> _plants;
  late final List<String> _animals;

  @override
  void initState() {
    _teDateController.text =
        widget.teNoteModel == null ? '' : widget.teNoteModel!.textDate;
    _teBeingType =
        (widget.teNoteModel == null ? 0 : widget.teNoteModel!.noteBeingType)
            .obs;
    _teReasons = (widget.teNoteModel == null
            ? 'Reasons'
            : widget.teNoteModel!.noteReason)
        .obs;
    _teFoodController.text =
        widget.teNoteModel == null ? '' : widget.teNoteModel!.noteFood;
    _teLocationController.text =
        widget.teNoteModel == null ? '' : widget.teNoteModel!.noteLocation;
    _teAllergen =
        (widget.teNoteModel == null ? 'Food' : widget.teNoteModel!.noteAllergen)
            .obs;
    _tePlant =
        (widget.teNoteModel == null ? 'Plants' : widget.teNoteModel!.notePlants)
            .obs;
    _teAnimal = (widget.teNoteModel == null
            ? 'Animals'
            : widget.teNoteModel!.noteAnimals)
        .obs;

    _foods = [
      'Bread',
      'Milk',
      'Cheese',
      'Apple',
      'Banana',
      'Orange',
      'Nuts',
      'Carrot',
      'Fish',
      'Cabbage',
      'Beef',
      'Pork',
      'Chicken',
      'Potato',
      'Egg',
      'Onion',
    ];
    final strg = GetStorage();
    final svdFood = strg.read<List<dynamic>>('savedFood') ?? [];

    _foods.addAll(svdFood.map((e) => e.toString()).toList());

    _plants = [
      'Oak',
      'Alder',
      'Pine',
      'Poplar',
      'Birch',
      'Ash',
      'Maple',
      'Elm',
      'Juniper',
      'Lilac',
      'Ragweed',
      'Wormwood',
      'Grasses',
    ];
    final svdPlant = strg.read<List<dynamic>>('savedPlant') ?? [];
    _plants.addAll(svdPlant.map((e) => e.toString()).toList());

    _animals = [
      'Cat',
      'Dog',
      'Hamster',
      'Horse',
    ];
    final svdAnimal = strg.read<List<dynamic>>('savedAnimal') ?? [];
    _animals.addAll(svdAnimal.map((e) => e.toString()).toList());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TeColors.lightGraySec,
      appBar: AppBar(
        backgroundColor: TeColors.lightGraySec,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Get.back(id: 1);
          },
          child: Container(
            height: 32,
            width: 32,
            alignment: Alignment.center,
            child: SvgPicture.asset('te_assets/icons/back.svg'),
          ),
        ),
        title: Text(
          widget.teNoteModel == null ? 'Add new note' : 'Edit note',
          style: TeText.navbar.copyWith(color: TeColors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 25,
              ),
              Text(
                'Date',
                style: TeText.header5.copyWith(color: TeColors.black),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _teDateController,
                inputFormatters: [DateTextFormatter()],
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: TeColors.lightBlueSec,
                  hintText: 'dd.mm.yyyy',
                  hintStyle: TeText.body3.copyWith(color: TeColors.lightGray),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                ),
              ),
              SizedBox(
                height: 21,
              ),
              Text(
                'Well-being',
                style: TeText.header5.copyWith(color: TeColors.black),
              ),
              SizedBox(
                height: 21,
              ),
              Row(
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      if (_teBeingType.value != 0) {
                        _teBeingType.value = 0;
                      }
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          'te_assets/images/excellent.png',
                          height: 32,
                          width: 32,
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Obx(
                          () => Text(
                            'Excellent',
                            style: TeText.body3.copyWith(
                                color: _teBeingType.value == 0
                                    ? TeColors.black
                                    : TeColors.lightGray),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      if (_teBeingType.value != 1) {
                        _teBeingType.value = 1;
                      }
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          'te_assets/images/good.png',
                          height: 32,
                          width: 32,
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Obx(
                          () => Text(
                            'Good',
                            style: TeText.body3.copyWith(
                                color: _teBeingType.value == 1
                                    ? TeColors.black
                                    : TeColors.lightGray),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      if (_teBeingType.value != 2) {
                        _teBeingType.value = 2;
                      }
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          'te_assets/images/fair.png',
                          height: 32,
                          width: 32,
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Obx(
                          () => Text(
                            'Fair',
                            style: TeText.body3.copyWith(
                                color: _teBeingType.value == 2
                                    ? TeColors.black
                                    : TeColors.lightGray),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      if (_teBeingType.value != 3) {
                        _teBeingType.value = 3;
                      }
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          'te_assets/images/poor.png',
                          height: 32,
                          width: 32,
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Obx(
                          () => Text(
                            'Poor',
                            style: TeText.body3.copyWith(
                                color: _teBeingType.value == 3
                                    ? TeColors.black
                                    : TeColors.lightGray),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 21,
              ),
              Text(
                'Why?',
                style: TeText.header5.copyWith(color: TeColors.black),
              ),
              SizedBox(
                height: 21,
              ),
              Flexible(
                child: ExpandableNotifier(
                  controller: _teExpReason,
                  child: Expandable(
                    collapsed: GestureDetector(
                      onTap: () {
                        _teExpReason.toggle();
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: TeColors.purple,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Obx(
                                () => Text(
                                  _teReasons.value,
                                  style: TeText.header5
                                      .copyWith(color: TeColors.white),
                                ),
                              ),
                            ),
                            RotatedBox(
                              quarterTurns: 2,
                              child: Container(
                                  height: 32,
                                  width: 32,
                                  alignment: Alignment.center,
                                  child: SvgPicture.asset(
                                      'te_assets/icons/up.svg')),
                            ),
                          ],
                        ),
                      ),
                    ),
                    expanded: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _teExpReason.toggle();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 6, horizontal: 16),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: TeColors.purple,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Obx(
                                    () => Text(
                                      _teReasons.value,
                                      style: TeText.header5
                                          .copyWith(color: TeColors.white),
                                    ),
                                  ),
                                ),
                                Container(
                                    height: 32,
                                    width: 32,
                                    alignment: Alignment.center,
                                    child: SvgPicture.asset(
                                        'te_assets/icons/up.svg')),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: TeColors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 4),
                                blurRadius: 4,
                                color: Color.fromRGBO(64, 53, 138, 0.1),
                              )
                            ],
                          ),
                          child: ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: _reasons.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                _teReasons.value = _reasons[index];
                                _teExpReason.toggle();
                              },
                              behavior: HitTestBehavior.opaque,
                              child: Text(
                                _reasons[index],
                                style: TeText.body1
                                    .copyWith(color: TeColors.black),
                              ),
                            ),
                            separatorBuilder: (context, index) => SizedBox(
                              height: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 21,
              ),
              Text(
                'Food',
                style: TeText.header5.copyWith(color: TeColors.black),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _teFoodController,
                maxLines: 3,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: TeColors.lightBlueSec,
                  hintText: 'Describe what did you eat..',
                  hintStyle: TeText.body3.copyWith(color: TeColors.lightGray),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                ),
              ),
              SizedBox(
                height: 21,
              ),
              Text(
                'Location',
                style: TeText.header5.copyWith(color: TeColors.black),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _teLocationController,
                maxLines: 3,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: TeColors.lightBlueSec,
                  hintText: 'Describe where you were..',
                  hintStyle: TeText.body3.copyWith(color: TeColors.lightGray),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                ),
              ),
              SizedBox(
                height: 21,
              ),
              Text(
                'Allergen',
                style: TeText.header5.copyWith(color: TeColors.black),
              ),
              SizedBox(
                height: 21,
              ),
              Flexible(
                child: ExpandableNotifier(
                  controller: _teExpFood,
                  child: Expandable(
                    collapsed: GestureDetector(
                      onTap: () {
                        _teAddFood.text = '';
                        showAddFood.value = false;
                        _teExpFood.toggle();
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: TeColors.purple,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Obx(
                                () => Text(
                                  _teAllergen.value,
                                  style: TeText.header5
                                      .copyWith(color: TeColors.white),
                                ),
                              ),
                            ),
                            RotatedBox(
                              quarterTurns: 2,
                              child: Container(
                                  height: 32,
                                  width: 32,
                                  alignment: Alignment.center,
                                  child: SvgPicture.asset(
                                      'te_assets/icons/up.svg')),
                            ),
                          ],
                        ),
                      ),
                    ),
                    expanded: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _teExpFood.toggle();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 6, horizontal: 16),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: TeColors.purple,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Obx(
                                    () => Text(
                                      _teAllergen.value,
                                      style: TeText.header5
                                          .copyWith(color: TeColors.white),
                                    ),
                                  ),
                                ),
                                Container(
                                    height: 32,
                                    width: 32,
                                    alignment: Alignment.center,
                                    child: SvgPicture.asset(
                                        'te_assets/icons/up.svg')),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: TeColors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 4),
                                blurRadius: 4,
                                color: Color.fromRGBO(64, 53, 138, 0.1),
                              )
                            ],
                          ),
                          child: ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: _foods.length + 1,
                            shrinkWrap: true,
                            itemBuilder: (context, index) =>
                                index == _foods.length
                                    ? GestureDetector(
                                        onTap: () {
                                          showAddFood.value = true;
                                        },
                                        behavior: HitTestBehavior.opaque,
                                        child: Text(
                                          'Add new product',
                                          style: TeText.body1
                                              .copyWith(color: TeColors.black),
                                        ),
                                      )
                                    : GestureDetector(
                                        onTap: () {
                                          _teAllergen.value = _foods[index];
                                          _teExpFood.toggle();
                                        },
                                        behavior: HitTestBehavior.opaque,
                                        child: Text(
                                          _foods[index],
                                          style: TeText.body1
                                              .copyWith(color: TeColors.black),
                                        ),
                                      ),
                            separatorBuilder: (context, index) => SizedBox(
                              height: 20,
                            ),
                          ),
                        ),
                        Obx(
                          () => SizedBox(
                            height: showAddFood.value ? 10 : 0,
                          ),
                        ),
                        Obx(
                          () => showAddFood.value
                              ? TextFormField(
                                  controller: _teAddFood,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: TeColors.lightBlueSec,
                                    hintText: 'Type your product..',
                                    hintStyle: TeText.body3
                                        .copyWith(color: TeColors.lightGray),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                  ),
                                )
                              : SizedBox(),
                        ),
                        Obx(
                          () => SizedBox(
                            height: showAddFood.value ? 10 : 0,
                          ),
                        ),
                        Obx(
                          () => showAddFood.value
                              ? GestureDetector(
                                  onTap: () {
                                    _foods.add(_teAddFood.text);
                                    setState(() {});
                                    final strg = GetStorage();
                                    final svdFood =
                                        strg.read<List<dynamic>>('savedFood') ??
                                            [];
                                    svdFood.add(_teAddFood.text);
                                    strg.write('savedFood', svdFood);
                                    _teAddFood.text = '';
                                    showAddFood.value = false;
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 13),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: TeColors.yellow,
                                    ),
                                    child: Text(
                                      'Add new product',
                                      style: TeText.header2
                                          .copyWith(color: TeColors.purple),
                                    ),
                                  ),
                                )
                              : SizedBox(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 17,
              ),
              Flexible(
                child: ExpandableNotifier(
                  controller: _teExpPlant,
                  child: Expandable(
                    collapsed: GestureDetector(
                      onTap: () {
                        _teAddPlant.text = '';
                        showAddPlant.value = false;
                        _teExpPlant.toggle();
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: TeColors.purple,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Obx(
                                () => Text(
                                  _tePlant.value,
                                  style: TeText.header5
                                      .copyWith(color: TeColors.white),
                                ),
                              ),
                            ),
                            RotatedBox(
                              quarterTurns: 2,
                              child: Container(
                                  height: 32,
                                  width: 32,
                                  alignment: Alignment.center,
                                  child: SvgPicture.asset(
                                      'te_assets/icons/up.svg')),
                            ),
                          ],
                        ),
                      ),
                    ),
                    expanded: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _teExpPlant.toggle();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 6, horizontal: 16),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: TeColors.purple,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Obx(
                                    () => Text(
                                      _tePlant.value,
                                      style: TeText.header5
                                          .copyWith(color: TeColors.white),
                                    ),
                                  ),
                                ),
                                Container(
                                    height: 32,
                                    width: 32,
                                    alignment: Alignment.center,
                                    child: SvgPicture.asset(
                                        'te_assets/icons/up.svg')),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: TeColors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 4),
                                blurRadius: 4,
                                color: Color.fromRGBO(64, 53, 138, 0.1),
                              )
                            ],
                          ),
                          child: ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: _plants.length + 1,
                            shrinkWrap: true,
                            itemBuilder: (context, index) =>
                                index == _plants.length
                                    ? GestureDetector(
                                        onTap: () {
                                          showAddPlant.value = true;
                                        },
                                        behavior: HitTestBehavior.opaque,
                                        child: Text(
                                          'Add new product',
                                          style: TeText.body1
                                              .copyWith(color: TeColors.black),
                                        ),
                                      )
                                    : GestureDetector(
                                        onTap: () {
                                          _tePlant.value = _plants[index];
                                          _teExpPlant.toggle();
                                        },
                                        behavior: HitTestBehavior.opaque,
                                        child: Text(
                                          _plants[index],
                                          style: TeText.body1
                                              .copyWith(color: TeColors.black),
                                        ),
                                      ),
                            separatorBuilder: (context, index) => SizedBox(
                              height: 20,
                            ),
                          ),
                        ),
                        Obx(
                          () => SizedBox(
                            height: showAddPlant.value ? 10 : 0,
                          ),
                        ),
                        Obx(
                          () => showAddPlant.value
                              ? TextFormField(
                                  controller: _teAddPlant,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: TeColors.lightBlueSec,
                                    hintText: 'Type your plant..',
                                    hintStyle: TeText.body3
                                        .copyWith(color: TeColors.lightGray),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                  ),
                                )
                              : SizedBox(),
                        ),
                        Obx(
                          () => SizedBox(
                            height: showAddPlant.value ? 10 : 0,
                          ),
                        ),
                        Obx(
                          () => showAddPlant.value
                              ? GestureDetector(
                                  onTap: () {
                                    _plants.add(_teAddPlant.text);
                                    setState(() {});
                                    final strg = GetStorage();
                                    final svdPlant = strg.read<List<dynamic>>(
                                            'savedPlant') ??
                                        [];
                                    svdPlant.add(_teAddPlant.text);
                                    strg.write('savedPlant', svdPlant);
                                    _teAddPlant.text = '';
                                    showAddPlant.value = false;
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 13),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: TeColors.yellow,
                                    ),
                                    child: Text(
                                      'Add new plant',
                                      style: TeText.header2
                                          .copyWith(color: TeColors.purple),
                                    ),
                                  ),
                                )
                              : SizedBox(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 17,
              ),
              Flexible(
                child: ExpandableNotifier(
                  controller: _teExpAnimal,
                  child: Expandable(
                    collapsed: GestureDetector(
                      onTap: () {
                        _teAddAnimal.text = '';
                        showAddAnimal.value = false;
                        _teExpAnimal.toggle();
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: TeColors.purple,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Obx(
                                () => Text(
                                  _teAnimal.value,
                                  style: TeText.header5
                                      .copyWith(color: TeColors.white),
                                ),
                              ),
                            ),
                            RotatedBox(
                              quarterTurns: 2,
                              child: Container(
                                  height: 32,
                                  width: 32,
                                  alignment: Alignment.center,
                                  child: SvgPicture.asset(
                                      'te_assets/icons/up.svg')),
                            ),
                          ],
                        ),
                      ),
                    ),
                    expanded: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _teExpPlant.toggle();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 6, horizontal: 16),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: TeColors.purple,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Obx(
                                    () => Text(
                                      _teAnimal.value,
                                      style: TeText.header5
                                          .copyWith(color: TeColors.white),
                                    ),
                                  ),
                                ),
                                Container(
                                    height: 32,
                                    width: 32,
                                    alignment: Alignment.center,
                                    child: SvgPicture.asset(
                                        'te_assets/icons/up.svg')),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: TeColors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 4),
                                blurRadius: 4,
                                color: Color.fromRGBO(64, 53, 138, 0.1),
                              )
                            ],
                          ),
                          child: ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: _animals.length + 1,
                            shrinkWrap: true,
                            itemBuilder: (context, index) =>
                                index == _animals.length
                                    ? GestureDetector(
                                        onTap: () {
                                          showAddAnimal.value = true;
                                        },
                                        behavior: HitTestBehavior.opaque,
                                        child: Text(
                                          'Add new product',
                                          style: TeText.body1
                                              .copyWith(color: TeColors.black),
                                        ),
                                      )
                                    : GestureDetector(
                                        onTap: () {
                                          _teAnimal.value = _animals[index];
                                          _teExpAnimal.toggle();
                                        },
                                        behavior: HitTestBehavior.opaque,
                                        child: Text(
                                          _animals[index],
                                          style: TeText.body1
                                              .copyWith(color: TeColors.black),
                                        ),
                                      ),
                            separatorBuilder: (context, index) => SizedBox(
                              height: 20,
                            ),
                          ),
                        ),
                        Obx(
                          () => SizedBox(
                            height: showAddAnimal.value ? 10 : 0,
                          ),
                        ),
                        Obx(
                          () => showAddAnimal.value
                              ? TextFormField(
                                  controller: _teAddAnimal,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: TeColors.lightBlueSec,
                                    hintText: 'Type your plant..',
                                    hintStyle: TeText.body3
                                        .copyWith(color: TeColors.lightGray),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                  ),
                                )
                              : SizedBox(),
                        ),
                        Obx(
                          () => SizedBox(
                            height: showAddAnimal.value ? 10 : 0,
                          ),
                        ),
                        Obx(
                          () => showAddAnimal.value
                              ? GestureDetector(
                                  onTap: () {
                                    _animals.add(_teAddAnimal.text);
                                    setState(() {});
                                    final strg = GetStorage();
                                    final svdAnimal = strg.read<List<dynamic>>(
                                            'savedAnimal') ??
                                        [];
                                    svdAnimal.add(_teAddPlant.text);
                                    strg.write('savedAnimal', svdAnimal);
                                    _teAddAnimal.text = '';
                                    showAddAnimal.value = false;
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 13),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: TeColors.yellow,
                                    ),
                                    child: Text(
                                      'Add new animal',
                                      style: TeText.header2
                                          .copyWith(color: TeColors.purple),
                                    ),
                                  ),
                                )
                              : SizedBox(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () async {
                  if (_teDateController.text.isEmpty ||
                      _teFoodController.text.isEmpty ||
                      _teLocationController.text.isEmpty ||
                      _teReasons.value == 'Reasons' ||
                      _teAllergen.value == 'Food' ||
                      _tePlant.value == 'Plants' ||
                      _tePlant.value == 'Animals') {
                    Get.showSnackbar(GetSnackBar(
                      duration: Duration(milliseconds: 3000),
                      backgroundColor: TeColors.purple,
                      messageText: Text(
                        'Please fill out the entire form.',
                        style: TeText.header5.copyWith(color: TeColors.white),
                      ),
                    ));
                  } else {
                    final dateArray = _teDateController.text.split('.');
                    final teDate = DateTime(
                      int.parse(dateArray[2]),
                      int.parse(dateArray[1][0] == '0'
                          ? dateArray[1][1]
                          : dateArray[1]),
                      int.parse(dateArray[0][0] == '0'
                          ? dateArray[0][1]
                          : dateArray[0]),
                    );
                    if (widget.teNoteModel == null) {
                      await teNotesController.addNote(TeNoteModel(
                        id: 0,
                        noteDate: teDate,
                        noteBeingType: _teBeingType.value,
                        noteReason: _teReasons.value,
                        noteFood: _teFoodController.text,
                        noteLocation: _teLocationController.text,
                        noteAllergen: _teAllergen.value,
                        notePlants: _tePlant.value,
                        noteAnimals: _teAnimal.value,
                      ));
                    } else {
                      await teNotesController.updateNotes(TeNoteModel(
                        id: widget.teNoteModel!.id,
                        noteDate: teDate,
                        noteBeingType: _teBeingType.value,
                        noteReason: _teReasons.value,
                        noteFood: _teFoodController.text,
                        noteLocation: _teLocationController.text,
                        noteAllergen: _teAllergen.value,
                        notePlants: _tePlant.value,
                        noteAnimals: _teAnimal.value,
                      ));
                    }

                    teNotesController.getNotes();

                    Get.back(id: 1);
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 13),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: TeColors.yellow,
                  ),
                  child: Text(
                    'Save',
                    style: TeText.header2.copyWith(color: TeColors.purple),
                  ),
                ),
              ),
              SizedBox(
                height: 21,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
