import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:deco_trade_hub/features/store/repository/store_repository.dart';
import 'package:deco_trade_hub/services/dependencies/src/dependency_injection.dart';
import 'package:equatable/equatable.dart';
import 'package:shared/shared.dart';

part 'store_form_event.dart';
part 'store_form_state.dart';

@Service()
class StoreFormBloc extends Bloc<StoreFormEvent, StoreFormState> {
  final StoreRepository _storeRepository;

  StoreFormBloc(
    this._storeRepository,
  ) : super(StoreFormState.initial()) {
    // on<StoreFormEvent>((event, emit) {});
    on<StoreNameChanged>(_onStoreNameChanged);
    on<OwnerNameChanged>(_onOwnerNameChanged);
    on<ContactNumChanged>(_onContactNumberChanged);
    on<EmailChanged>(_onEmailChanged);
    on<AddressLine1Changed>(_onAddressLine1Changed);
    on<PostalCodeChanged>(_onPostalCodeChanged);
    on<StoreTypeChanged>(_onStoreTypeChanged);
    on<StoreDescChanged>(_onStoreDescriptionChanged);
    on<TinChanged>(_onTinChanged);
    on<NidChanged>(_onNidChanged);
    on<StoreFormSubmitted>(_onStoreSignUpSubmitted);
    on<StoreFormReset>(_onStoreSignUpReset);
    on<StoreBannerUrlChanged>(_onStoreBannerUrlChanged);
    on<StoreLogoUrlChanged>(_onStoreLogoUrlChanged);
  }

  FutureOr<void> _onStoreNameChanged(
      StoreNameChanged event, Emitter<StoreFormState> emit) {
    emit(state.copyWith(
      storeName: event.storeName,
      status: StoreFormStatus.initial,
    ));
    logI(event.storeName);
  }

  FutureOr<void> _onOwnerNameChanged(
      OwnerNameChanged event, Emitter<StoreFormState> emit) {
    emit(state.copyWith(
      ownerName: event.ownerName,
      status: StoreFormStatus.initial,
    ));
  }

  FutureOr<void> _onContactNumberChanged(
      ContactNumChanged event, Emitter<StoreFormState> emit) {
    emit(state.copyWith(
      contactNumber: event.contactNumber,
      status: StoreFormStatus.initial,
    ));
  }

  FutureOr<void> _onEmailChanged(
      EmailChanged event, Emitter<StoreFormState> emit) {
    emit(state.copyWith(
      email: event.email,
      status: StoreFormStatus.initial,
    ));
    logI(state.email);
  }

  FutureOr<void> _onAddressLine1Changed(
      AddressLine1Changed event, Emitter<StoreFormState> emit) {
    emit(state.copyWith(
      addressLine1: event.addressLine1,
      status: StoreFormStatus.initial,
    ));
  }

  FutureOr<void> _onPostalCodeChanged(
      PostalCodeChanged event, Emitter<StoreFormState> emit) {
    emit(state.copyWith(
      postalCode: event.postalCode,
      status: StoreFormStatus.initial,
    ));
  }

  FutureOr<void> _onStoreTypeChanged(
      StoreTypeChanged event, Emitter<StoreFormState> emit) {
    emit(state.copyWith(
      storeType: event.storeType,
      status: StoreFormStatus.initial,
    ));
  }

  FutureOr<void> _onStoreDescriptionChanged(
      StoreDescChanged event, Emitter<StoreFormState> emit) {
    emit(state.copyWith(
      storeDescription: event.storeDescription,
      status: StoreFormStatus.initial,
    ));
  }

  FutureOr<void> _onTinChanged(TinChanged event, Emitter<StoreFormState> emit) {
    emit(state.copyWith(
      ownerTIN: event.tin,
      status: StoreFormStatus.initial,
    ));
  }

  FutureOr<void> _onNidChanged(NidChanged event, Emitter<StoreFormState> emit) {
    emit(state.copyWith(
      ownerNID: event.nid,
      status: StoreFormStatus.initial,
    ));
  }

  FutureOr<void> _onStoreBannerUrlChanged(
      StoreBannerUrlChanged event, Emitter<StoreFormState> emit) {
    emit(state.copyWith(
      storeBannerUrl: event.storeBannerUrl,
      status: StoreFormStatus.initial,
    ));
  }

  FutureOr<void> _onStoreLogoUrlChanged(
      StoreLogoUrlChanged event, Emitter<StoreFormState> emit) {
    emit(state.copyWith(
      storeLogoUrl: event.storeLogoUrl,
      status: StoreFormStatus.initial,
    ));
  }

  FutureOr<void> _onStoreSignUpSubmitted(
      StoreFormSubmitted event, Emitter<StoreFormState> emit) async {
    emit(state.copyWith(
      status: StoreFormStatus.submitting,
    ));

    try {
      final result = await _storeRepository.createStore(
        storeName: state.storeName,
        ownerName: state.ownerName,
        storeDescription: state.storeDescription ?? '',
        contactNumber: state.contactNumber,
        email: state.email,
        addressLine1: state.addressLine1,
        addressLine2: state.addressLine2 ?? '',
        postalCode: state.postalCode,
        storeType: event.storeType,
        socialMediaLinks: {},
        websiteUrl: state.websiteUrl ?? '',
        storeBannerUrl: state.storeBannerUrl ?? '',
        storeLogoUrl: state.storeLogoUrl ?? '',
        ownerNID: state.ownerNID ?? '',
        ownerTIN: state.ownerTIN ?? '',
      );

      result.fold(
        (failure) {
          emit(state.copyWith(
            status: StoreFormStatus.error,
          ));
        },
        (success) {
          emit(state.copyWith(
            status: StoreFormStatus.success,
          ));
        },
      );
    } catch (e) {
      emit(state.copyWith(
        status: StoreFormStatus.error,
      ));
    }
  }

  FutureOr<void> _onStoreSignUpReset(
      StoreFormReset event, Emitter<StoreFormState> emit) {
    emit(StoreFormState.initial());
  }
}
