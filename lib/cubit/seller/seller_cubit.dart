import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'seller_state.dart';

class SellerCubit extends Cubit<SellerState> {
  SellerCubit() : super(const SellerInitial());
}