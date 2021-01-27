import 'dart:io';

import 'package:avs/data/models/document.dart';
import 'package:avs/logic/cubits/authentication_cubit.dart';
import 'package:avs/logic/cubits/document_upload_cubit.dart';
import 'package:avs/presentation/screens/authentication_screen.dart';
import 'package:avs/presentation/widgets/app_raised_button.dart';
import 'package:avs/presentation/widgets/app_snack_bar.dart';
import 'package:avs/presentation/widgets/auth_header.dart';
import 'package:avs/presentation/widgets/input/app_dropdown_button.dart';
import 'package:avs/presentation/widgets/input/app_text_form_field.dart';
import 'package:avs/utils/constants.dart';
import 'package:avs/utils/styles.dart';
import 'package:avs/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

const List<Document> documents = [
  Document(
      type: DocumentType.NIN,
      title: 'National Identification Number',
      label: 'Enter NIN',
      backendType: 'NIN'),
  Document(
      type: DocumentType.DRIVERS_LICENSE,
      title: "Driver's License",
      label: "Upload Driver's Card",
      backendType: 'DRIVER’S LICENSE'),
  Document(
      type: DocumentType.INTERNATIONAL_PASSPORT,
      title: 'International Passport',
      label: "Upload International passport",
      backendType: 'INTERNATIONAL PASSPORT'),
  Document(
      type: DocumentType.VOTERS_CARD,
      title: "Voter's Card",
      label: "Upload Voter's Card",
      backendType: 'VOTER’S CARD'),
];

class DocumentUploadPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final PageController controller;
  final userRepository;
  final AuthenticationCubit authenticationCubit;

  DocumentUploadPage(
    this.controller,
    this.authenticationCubit,
    this.userRepository,
  );

  final List<DropdownMenuItem> documentItems = documents
      .map(
        (e) => DropdownMenuItem(
          value: e,
          child: Text(
            e.title,
          ),
        ),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DocumentUploadCubit(
        userRepository,
        authenticationCubit,
        controller: controller,
      ),
      child: Column(
        children: [
          AuthAppBar(
            title: 'Awesome ${authenticationCubit.user?.firstName}',
            subTitle: 'Please upload your documents',
          ),
          SizedBox(height: 20.0),
          // Body
          Expanded(
            child: _buildForm(),
          )
        ],
      ),
    );
  }

  SingleChildScrollView _buildForm() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: BlocConsumer<DocumentUploadCubit, DocumentUploadState>(
        listener: (context, state) {
          if (state.hasError) {
            Scaffold.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                AppSnackBar.error(state.errorMessage),
              );
          }
        },
        builder: (context, state) {
          final cubit = context.watch<DocumentUploadCubit>();

          //print(state);
          return Form(
            key: formKey,
            autovalidateMode: state.autovalidateMode,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 125,
                  width: 125,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: state.photoFile == null
                            ? FittedBox(
                                fit: BoxFit.fill,
                                child: Icon(
                                  Icons.account_circle_rounded,
                                  color: AppColors.stroke,
                                ),
                              )
                            : _buildPreviewWidget(state.photoFile),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: InkWell(
                          onTap: () {
                            cubit.onUploadPhotoPressed(context);
                          },
                          customBorder: CircleBorder(),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: SvgPicture.asset(
                              'assets/upload.svg',
                              height: 30,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                authSpacer,
                Text(
                  'Please upload a clear photograph of yourself',
                ),
                authSpacer,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Identification Document',
                    style: kLabelTextStyle,
                  ),
                ),
                SizedBox(height: 10),
                RichText(
                  //textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(color: Colors.black),
                    text:
                        'Please upload one of your identification documents. ',
                    children: [
                      TextSpan(
                        style: TextStyle(fontSize: 12),
                        text:
                            '(Images should be in jpg, pdf or png, and not more than 5MB)',
                        //style: TextStyle(color: AppColors.primaryColor),
                      ),
                    ],
                  ),
                ),
                authSpacer,
                AppDropDownButton<Document>(
                  label: 'Document Type',
                  hint: "Select identity document type",
                  validator: Validator.isDocument,
                  onChanged: (doc) => cubit.selectedDoc = doc,
                  items: documentItems,
                ),
                state.selectedDoc != null
                    ? _buildDocSelectionWidget(state, cubit)
                    : authSpacer,
                AppRaisedButton(
                  text: 'Continue',
                  isLoading: state.isLoading,
                  onPressed: cubit.handleContinue, //nextPage,
                ),
                authSpacer,
              ],
            ),
          );
        },
      ),
    );
  }

  _buildDocSelectionWidget(
      DocumentUploadState state, DocumentUploadCubit cubit) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        authSpacer,
        Text(
          state.selectedDoc.label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            //color: AppColors.label,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        state.selectedDoc.type == DocumentType.NIN
            ? AppTextFormField(
                onSaved: (String val) =>
                    cubit.selectedDoc = state.selectedDoc.copyWith(value: val),
                validator: Validator.isNIN,
              )
            : AppTextFormField(
                readOnly: true,
                key: GlobalKey(),
                initialValue: state.selectedDoc.value ?? '',
                enableInteractiveSelection: false,
                suffixIcon: Icon(Icons.upload_file),
                onTap: cubit.onUploadDocPressed,
                validator: Validator.isLessThan5MB,
              ),
        authSpacer
      ],
    );
  }

  _buildPreviewWidget(PickedFile photoFile) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: CircleAvatar(
        backgroundImage: FileImage(File(photoFile.path)),
      ),
    );
  }
}
