import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'new_arrivals_state.dart';

class NewArrivalsCubit extends Cubit<NewArrivalsState> {
  NewArrivalsCubit() : super(NewArrivalsInitial());
}
