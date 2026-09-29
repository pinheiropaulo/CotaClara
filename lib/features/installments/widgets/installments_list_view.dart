import 'package:cota_clara/app/data/mock_api.dart';
import 'package:cota_clara/app/routes/app_routes.dart';
import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:cota_clara/features/installments/models/installment.dart';
import 'package:cota_clara/features/installments/widgets/empty_installments.dart';
import 'package:cota_clara/features/installments/widgets/installment_card.dart';
import 'package:cota_clara/features/installments/widgets/installment_filters.dart';
import 'package:cota_clara/features/installments/widgets/installment_plan_summary.dart';
import 'package:cota_clara/features/installments/widgets/installments_list_header.dart';
import 'package:cota_clara/features/installments/widgets/next_installment_highlight.dart';
import 'package:cota_clara/features/quotas/models/quota_overview.dart';
import 'package:cota_clara/shared/widgets/quota_selection_bottom_sheet.dart';
import 'package:cota_clara/shared/widgets/quota_selection_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InstallmentsListView extends StatelessWidget {
  final bool isLoading;
  final List<Installment> installments;
  final InstallmentFilter selectedFilter;
  final ValueChanged<InstallmentFilter> onFilterSelected;
  final void Function(String) showComingSoon;

  const InstallmentsListView({
    super.key,
    required this.isLoading,
    required this.installments,
    required this.selectedFilter,
    required this.onFilterSelected,
    required this.showComingSoon,
  });

  @override
  Widget build(BuildContext context) {
    final quota = MockApi.instance.currentQuota.value;

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 28),
      children: [
        QuotaSelectionCard(
          title: quota?.title ?? 'Cota de imóvel',
          description: quota != null
              ? 'Grupo ${quota.group} • Cota ${quota.number}'
              : 'Grupo 012160 • Cota 6503',
          icon: quota?.category == QuotaCategory.vehicle
              ? Icons.directions_car_outlined
              : quota?.category == QuotaCategory.services
              ? Icons.handyman_outlined
              : Icons.home_outlined,
          onPressed: () async {
            final selectedQuota = await QuotaSelectionBottomSheet.show(context);
            if (selectedQuota != null) {
              MockApi.instance.selectQuota(selectedQuota.id);
            }
          },
        ),
        const SizedBox(height: 24),
        if (quota != null) ...[
          InstallmentPlanSummary(quota: quota),
          const SizedBox(height: 24),
          NextInstallmentHighlight(
            quota: quota,
            onPayPressed: () => context.push(AppRoutes.bill),
            onDetailsPressed: () => context.push(AppRoutes.bill),
          ),
          const SizedBox(height: 24),
        ],
        InstallmentFilters(
          selected: selectedFilter,
          onSelected: onFilterSelected,
        ),
        const SizedBox(height: 24),
        const InstallmentsListHeader(),
        const SizedBox(height: 12),
        if (isLoading)
          const Padding(
            padding: EdgeInsets.all(24),
            child: Center(child: CircularProgressIndicator()),
          )
        else if (installments.isEmpty)
          const EmptyInstallments()
        else
          for (var index = 0; index < installments.length; index++) ...[
            InstallmentCard(
              installment: installments[index],
              onPressed: () {
                if (installments[index].status == InstallmentStatus.pending) {
                  context.push(AppRoutes.bill);
                  return;
                }
                showComingSoon(installments[index].actionLabel);
              },
            ),
            if (index < installments.length - 1) const SizedBox(height: 12),
          ],
        const SizedBox(height: 24),
        Center(
          child: OutlinedButton.icon(
            onPressed: () => showComingSoon('Parcelas anteriores'),
            icon: const Icon(Icons.history, size: 20),
            label: const Text('Carregar parcelas anteriores'),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.accentBlue,
              backgroundColor: AppColors.surface,
              side: const BorderSide(color: AppColors.border),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
