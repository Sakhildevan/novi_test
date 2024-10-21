import 'package:flutter/material.dart';
import 'package:novi_test/utils/config/config.dart';
import 'package:provider/provider.dart';

import '../../../provider/patient_payment.provider.dart';
import '../../../widgets/custom_textfield.dart';

class PaymentDetail extends StatelessWidget {
  const PaymentDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PaymentState>(builder: (BuildContext context, state, _) {
      return Column(
        children: [
          CustomTextField(
            labelText: 'Total Amount',
            hintText: '',
            textFieldInitialValue: state.totalAmount.toString(),
            onChanged: (value) {
              state.updateTotalAmount(value); // Update state on change
            },
          ),
          kDim.kGap10,
          CustomTextField(
            textFieldInitialValue: state.discountAmount,
            onChanged: (value) {
              state.updateDiscountAmount(value); // Update state on change
            },
            labelText: 'Discount Amount',
            hintText: '',
          ),
          kDim.kGap10,
          _radiobuttons(state),
          kDim.kGap10,
          CustomTextField(
            textFieldInitialValue: state.advanceAmount,
            onChanged: (value) {
              state.updateAdvanceAmount(value); // Update state on change
            },
            labelText: 'Advance Amount',
            hintText: '',
          ),
          kDim.kGap10,
          CustomTextField(
            textFieldInitialValue: state.balanceAmount,
            onChanged: (value) {
              state.updateBalanceAmount(value); // Update state on change
            },
            labelText: 'Balance Amount',
            hintText: '',
          ),
          kDim.kGap10,
        ],
      );
    });
  }
}

_radiobuttons(
  PaymentState state,
) {
  return SizedBox(
    height: 80,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Payment Option",
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  Radio<String>(
                      value: 'Cash',
                      groupValue:
                          state.selectedPaymentOption, // No selection handled
                      onChanged: (value) {
                        state.selectPaymentOption(value!);
                      } // No action when selected
                      ),
                  const Text('Cash'),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Radio<String>(
                      value: 'Card',
                      groupValue:
                          state.selectedPaymentOption, // No selection handled
                      onChanged: (value) {
                        state.selectPaymentOption(value!);
                      }),
                  const Text('Card'),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Radio<String>(
                      value: 'UPI',
                      groupValue: state.selectedPaymentOption,
                      onChanged: (value) {
                        state.selectPaymentOption(value!);
                      }),
                  const Text('UPI'),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
