import 'package:avs/data/repositories/request_repository.dart';
import 'package:avs/logic/bloc/request_bloc.dart';
import 'package:avs/logic/bloc/request_bloc_states.dart';
import 'package:avs/presentation/widgets/new_request_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllRequestPage extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
  AllRequestPage();
  @override
  Widget build(BuildContext context) {
    // ScrollController _scrollController = ScrollController();
    return BlocProvider(
      create: (context) =>
          RequestBloc(RequestRepository())..add(RequestEvent()),
      child: BlocConsumer<RequestBloc, RequestsBlocState>(
          listener: (context, state) {
        if (state is RequestsLoadingState) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              duration: Duration(seconds: 2),
            ),
          );
        } else if (state is RequestsSuccessState) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('Loaded Successfully'),
            duration: Duration(seconds: 2),
          ));
        } else if (state is RequestsErrorState) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text(state.error),
            duration: Duration(seconds: 2),
          ));
        }
        return;
      }, builder: (context, state) {
        final list = BlocProvider.of<RequestBloc>(context).requestList;
        if (state is RequestsInitialState ||
            state is RequestsLoadingState && list.isEmpty) {
          return Center(
              child: Container(
                  height: 100, width: 100, child: CircularProgressIndicator()));
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
                  BlocProvider.of<RequestBloc>(context).add(RequestEvent());
                }
              }),
            itemBuilder: (context, index) {
              return NewRequestItem(
                firstName: list[index].contact.firstName,
                lastName: list[index].contact.lastName,
                streetAddress: list[index].address.streetAddress,
                lga: list[index].address.lga,
                verificationNumber: list[index].verificationNumber,
                state: list[index].address.state,
                status: list[index].status,
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(height: 20),
            itemCount: list.length);
      }),
    );
  }
}
