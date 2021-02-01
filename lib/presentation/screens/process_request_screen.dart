import 'dart:async';
import 'dart:io';

import 'package:avs/data/models/document.dart';
import 'package:avs/logic/cubits/authentication_cubit.dart';
import 'package:avs/logic/cubits/requests/process_request_cubit.dart';
import 'package:avs/presentation/widgets/input/address_field.dart';
import 'package:avs/presentation/widgets/input/app_text_form_field.dart';
import 'package:avs/utils/constants.dart';
import 'package:avs/utils/styles.dart';
import 'package:avs/utils/validators.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_icons/line_icons.dart';

import '../widgets/app_raised_button.dart';

class ProcessRequestScreen extends StatefulWidget {
  // final Null Function(Promotion) onChanged;
  // final Promotion value;
  // final List<Promotion> _promotions;

  //ProcessRequestSheet(this.value, this.onChanged, this._promotions);
  ProcessRequestScreen();

  @override
  _ProcessRequestSheet createState() => _ProcessRequestSheet();
}

final spacer = SizedBox(height: 20);

enum AddressStatus { Approved, Rejected, Unknown }

class _ProcessRequestSheet extends State<ProcessRequestScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProcessRequestCubit(
        context.read<AuthenticationCubit>(),
        ModalRoute.of(context).settings.arguments,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Process Request'),
          centerTitle: true,
          elevation: 0,
          leading: RotatedBox(
            quarterTurns: 3,
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios_rounded),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          actions: [
            SizedBox(width: 10),
          ],
        ),
        body: BlocConsumer<ProcessRequestCubit, ProcessRequestState>(
            listener: (context, state) {
          if (state.snackBar != null) {
            Scaffold.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                state.snackBar,
              ).closed.then(context.read<ProcessRequestCubit>().clearOverlays);
          }
        }, builder: (context, state) {
          return Form(
            key: formKey,
            autovalidateMode: state.autovalidateMode,
            child: Column(
              children: [
                Center(
                  child: Container(
                    height: 4,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: Color(0xFFBDBDBD),
                    ),
                  ),
                ),
                spacer,
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Status', style: kLabelTextStyle),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Expanded(
                                child: OutlineButton.icon(
                                  label: Text('Approve'),
                                  icon: Radio(
                                    value: AddressStatus.Approved,
                                    groupValue: state.status,
                                    onChanged: context
                                        .watch<ProcessRequestCubit>()
                                        .setSelectedRadio,
                                  ),
                                  onPressed: () {
                                    context
                                        .read<ProcessRequestCubit>()
                                        .setSelectedRadio(
                                            AddressStatus.Approved);
                                  },
                                ),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: OutlineButton.icon(
                                  label: Text('Reject'),
                                  icon: Radio(
                                    value: AddressStatus.Rejected,
                                    groupValue: state.status,
                                    onChanged: context
                                        .watch<ProcessRequestCubit>()
                                        .setSelectedRadio,
                                  ),
                                  onPressed: () {
                                    context
                                        .read<ProcessRequestCubit>()
                                        .setSelectedRadio(
                                            AddressStatus.Rejected);
                                  },
                                ),
                              )
                            ],
                          ),
                          spacer,
                          ReasonsSelector(
                            state,
                            onSaved: context
                                .watch<ProcessRequestCubit>()
                                .onReasonsSaved,
                          ),
                          spacer,
                          AppTextFormField(
                            label: 'Address details',
                            maxLines: 5,
                            keyboardType: TextInputType.multiline,
                            hintText:
                                'Please provide a more detailed assessment of the address',
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'This field is required';
                              } else if (!GetUtils.isLengthGreaterThan(
                                  value, 2)) {
                                return 'Please enter a valid detail';
                              }
                              return null;
                            },
                            onSaved: context
                                .watch<ProcessRequestCubit>()
                                .onDetailSaved,
                          ),
                          spacer,
                          Text('Images', style: kLabelTextStyle),
                          SizedBox(height: 10),
                          DottedBorder(
                            color: AppColors.stroke,
                            dashPattern: [5, 5],
                            strokeWidth: 1,
                            child: InkWell(
                              onTap: () {
                                context
                                    .read<ProcessRequestCubit>()
                                    .uploadImagePressed(context);
                              },
                              child: state.images?.isEmpty ?? true
                                  ? _buildContent(
                                      title: 'Click to upload',
                                      icon: Icon(
                                        Icons.cloud_upload_outlined,
                                        size: 35,
                                      ))
                                  : _buildPreviewWidget(state.images.first),
                            ),
                          ),
                          spacer,
                          AppRaisedButton(
                            //isLoading: state.isLoading,
                            elevation: 0,
                            backgroundColor: AppColors.icons,
                            text: 'Geotag this location',
                            onPressed: (context) {},
                          ),
                          spacer,
                          AppRaisedButton(
                            isLoading: state.isLoading,
                            elevation: 0,
                            backgroundColor: Colors.green,
                            text: 'Submit',
                            onPressed: context
                                .watch<ProcessRequestCubit>()
                                .onSubmitPressed,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                spacer,
              ],
            ),
          );
        }),
      ),
    );
  }

  _buildPreviewWidget(Document image) {
    return Container(
      height: 150,
      padding: const EdgeInsets.all(10),
      child: AspectRatio(
        aspectRatio: 1,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Image.file(
            File(image.value),
            fit: BoxFit.cover,
          ),
        ),
      ),
      // child: CircleAvatar(
      //   backgroundImage: FileImage(File(image.value)),
      // ),
    );
  }

  _buildContent({String title, icon}) => Container(
        padding: EdgeInsets.symmetric(vertical: 30),
        alignment: Alignment.center,
        child: Column(
          children: [
            icon,
            spacer,
            Text(
              title,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      );
}

class ReasonsSelector extends StatefulWidget {
  final ProcessRequestState state;
  final FormFieldSetter<List<String>> onSaved;
  final bool clearLabels;

  ReasonsSelector(this.state, {this.onSaved, this.clearLabels = false});

  @override
  _ReasonsSelectorState createState() => _ReasonsSelectorState();
}

class _ReasonsSelectorState extends State<ReasonsSelector> {
  final approvalLabels = [
    'Address is Valid',
    'Candidate Lives here',
    'Address is accessible',
    'Neighbors confirmed that candidate lives here'
  ];

  final rejectionLabels = [
    'Address does not exist',
    'Candidate does not live here',
    'Address is inaccessible',
    'Fraud suspected'
  ];

  List<String> selectedLabels = [];
  List<String> labels;

  _loadLabels() {
    switch (widget.state.status) {
      case AddressStatus.Approved:
        labels = approvalLabels;
        break;
      case AddressStatus.Rejected:
        labels = rejectionLabels;
        break;
      case AddressStatus.Unknown:
        labels = [];
        break;
    }
  }

  @override
  void didUpdateWidget(covariant ReasonsSelector oldWidget) {
    if (oldWidget.state.status != widget.state.status) {
      selectedLabels = [];
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    _loadLabels();
    if (widget.state.status != AddressStatus.Unknown) {
      return FormField(
        onSaved: (_) {
          widget.onSaved(selectedLabels);
        },
        builder: (formState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  'Select reason for ${widget.state.status == AddressStatus.Approved ? 'approval' : 'rejection'}',
                  style: kLabelTextStyle),
              Wrap(
                runSpacing: 0,
                spacing: 10,
                children: labels.map((label) {
                  return FilterChip(
                    label: Text(label, maxLines: 2, softWrap: true),
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          selectedLabels.add(label);
                        } else {
                          selectedLabels.removeWhere((itemLabel) {
                            return itemLabel == label;
                          });
                        }
                      });
                    },
                    selected: selectedLabels.contains(label),
                    checkmarkColor: AppColors.primaryColor,
                    selectedColor: AppColors.stroke,
                    shape: StadiumBorder(
                        side: BorderSide(color: AppColors.stroke)),
                    backgroundColor: Colors.transparent,
                  );
                }).toList(),
              )
            ],
          );
        },
      );
    }
    return SizedBox.shrink();
  }
}
