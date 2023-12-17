import 'package:flutter/foundation.dart' show immutable;
import 'package:rmpl_hrm_admin/dialogs/dialogs.dart';

@immutable
class DeleteDialog extends AlertDialogModel<bool> {
  const DeleteDialog({
    required String titleOfObjectToDelete,
  }) : super(
          title: 'Delete $titleOfObjectToDelete?',
          message:
              'Are you sure you want to delete this $titleOfObjectToDelete?',
          buttons: const {
            'cancel': false,
            'delete': true,
          },
        );
}
