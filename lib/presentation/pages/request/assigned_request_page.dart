import 'package:avs/data/providers/request_provider.dart';
import 'package:avs/data/repositories/request_repository.dart';
import 'package:avs/logic/bloc/request_bloc.dart';
import 'package:avs/logic/bloc/request_bloc_states.dart';
import 'package:avs/logic/cubits/authentication_cubit.dart';
import 'package:avs/presentation/screens/request_details.dart';
import 'package:avs/presentation/widgets/new_request_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AssignedRequestPage extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  AssignedRequestPage();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RequestBloc(
        RequestRepository(
          RequestProvider(
            context.read<AuthenticationCubit>(),
          ),
        ),
      )..add(AssignedRequestEvent()),
      child: BlocBuilder<RequestBloc, RequestsBlocState>(
          //   listener: (context, state) {
          // if (state is RequestsLoadingState) {
          //   Scaffold.of(context).showSnackBar(
          //     SnackBar(
          //       content: Text(state.message),
          //       duration: Duration(seconds: 2),
          //     ),
          //   );
          // } else if (state is RequestsSuccessState) {
          //   Scaffold.of(context).showSnackBar(SnackBar(
          //     content: Text('Loaded Successfully'),
          //     duration: Duration(seconds: 2),
          //   ));
          // } else if (state is RequestsErrorState) {
          //   Scaffold.of(context).showSnackBar(SnackBar(
          //     content: Text(state.error),
          //     duration: Duration(seconds: 2),
          //   ));
          // }
          // return;
          // },
          builder: (context, state) {
        final list = BlocProvider.of<RequestBloc>(context).requestList;
        if (state is RequestsInitialState ||
            state is RequestsLoadingState && list.isEmpty) {
          return Center(
              child: Container(
                  height: 100, width: 100, child: CircularProgressIndicator()));
        }
        if (state is RequestsErrorState && list.isEmpty) {
          /// Show error loading page with option to retry
        }
        if (state is RequestsSuccessState && list.isEmpty) {
          /// Show that the list is empty
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
              return NewRequestItem(
                imageUrl: 'https://i.pravatar.cc/400',
                firstName: list[index].contact.firstName,
                lastName: list[index].contact.lastName,
                streetAddress: list[index].address.streetAddress,
                lga: list[index].address.lga,
                verificationNumber: list[index].verificationNumber,
                state: list[index].address.state,
                status: list[index].status,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RequestDetailsScreen(),
                      settings: RouteSettings(arguments: list[index]),
                    ),
                  );
                },
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(height: 20),
            itemCount: list.length);
      }),
    );
  }
}
