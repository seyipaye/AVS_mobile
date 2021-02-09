import 'package:avs/data/providers/request_provider.dart';
import 'package:avs/data/repositories/request_repository.dart';
import 'package:avs/logic/bloc/request_bloc.dart';
import 'package:avs/logic/bloc/request_bloc_states.dart';
import 'package:avs/logic/cubits/authentication_cubit.dart';
import 'package:avs/presentation/screens/request_details.dart';
import 'package:avs/presentation/widgets/app_raised_button.dart';
import 'package:avs/presentation/widgets/app_snack_bar.dart';
import 'package:avs/presentation/widgets/error_screens.dart';
import 'package:avs/presentation/widgets/loading_indicator.dart';
import 'package:avs/presentation/widgets/request_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class AssignedRequestPage extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  AssignedRequestPage();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RequestBloc(
        RequestRepository(
          context.read<AuthenticationCubit>(),
        ),
      )..add(AssignedRequestEvent()),
      child: Scaffold(
        body: BlocConsumer<RequestBloc, RequestsBlocState>(
          listener: (context, state) {
            if (state is RequestsErrorState) {
              Scaffold.of(context)
                  .showSnackBar(AppSnackBar.neutral(state.error));
            }
          },
          builder: (context, state) {
            final list = BlocProvider.of<RequestBloc>(context).requestList;
            if (state is RequestsInitialState ||
                state is RequestsLoadingState && list.isEmpty) {
              return Center(child: LoadingIndicator(radius: 35));
            }
            if (state is RequestsErrorState && list.isEmpty) {
              /// Show error loading page with option to retry
              return NoConnectionScreen(onRetryPressed: (context) {});
            }
            if (state is RequestsSuccessState && list.isEmpty) {
              /// Show that the list is empty
              return EmptyRequestScreen(onRetryPressed: (context) {});
            }

            ///Work on the list given on success
            return ListView.separated(
              padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
              physics: BouncingScrollPhysics(),
              controller: _scrollController
                ..addListener(() {
                  if (_scrollController.offset ==
                          _scrollController.position.maxScrollExtent &&
                      !BlocProvider.of<RequestBloc>(context).isLoading) {
                    BlocProvider.of<RequestBloc>(context)
                        .add(AssignedRequestEvent());
                  }
                }),
              itemBuilder: (context, index) {
                return RequestItem(
                  imageUrl: 'https://i.pravatar.cc/400',
                  firstName: list[index].contact.firstName,
                  lastName: list[index].contact.lastName,
                  streetAddress: list[index].address.streetAddress,
                  lga: list[index].address.lga,
                  verificationNumber: list[index].verificationNumber,
                  state: list[index].address.state,
                  status: list[index].status,
                  onTap: () async {
                    final message = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RequestDetailsScreen(),
                        settings: RouteSettings(arguments: list[index]),
                      ),
                    );

                    if (message != null) {
                      // Todo: Refresh List
                    }
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(height: 20),
              itemCount: list.length,
            );
          },
        ),
      ),
    );
  }
}
