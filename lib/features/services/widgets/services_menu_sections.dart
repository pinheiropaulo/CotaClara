import 'package:cota_clara/app/routes/app_routes.dart';
import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:cota_clara/features/services/widgets/quick_action_card.dart';
import 'package:cota_clara/features/services/widgets/service_list_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class QuickActionsSection extends StatelessWidget {
  final Function(String) onShowComingSoon;

  const QuickActionsSection({super.key, required this.onShowComingSoon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Mais utilizados',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: QuickActionCard(
                icon: Icons.receipt_long_outlined,
                label: 'Segunda via',
                onPressed: () => context.push(AppRoutes.installments),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: QuickActionCard(
                icon: Icons.credit_card_outlined,
                label: 'Forma de\npagamento',
                onPressed: () => onShowComingSoon('Forma de pagamento'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: QuickActionCard(
                icon: Icons.payments_outlined,
                label: 'Liberação\nde crédito',
                onPressed: () => context.push(AppRoutes.creditRelease),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class PaymentsSection extends StatelessWidget {
  final Function(String) onShowComingSoon;

  const PaymentsSection({super.key, required this.onShowComingSoon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Pagamentos',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        ServiceListItem(
          icon: Icons.receipt_long_outlined,
          title: 'Parcelas e boletos',
          subtitle: 'Consulte pagamentos e segundas vias',
          onPressed: () => context.push(AppRoutes.installments),
        ),
        ServiceListItem(
          icon: Icons.account_balance_wallet_outlined,
          title: 'Forma de pagamento',
          subtitle: 'Gerencie como suas parcelas são pagas',
          onPressed: () => onShowComingSoon('Forma de pagamento'),
        ),
        ServiceListItem(
          icon: Icons.description_outlined,
          title: 'Extrato da cota',
          subtitle: 'Veja as movimentações registradas',
          onPressed: () => context.push(AppRoutes.statement),
        ),
      ],
    );
  }
}

class ReceiptsSection extends StatelessWidget {
  final Function(String) onShowComingSoon;

  const ReceiptsSection({super.key, required this.onShowComingSoon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Comprovantes e informes',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        ServiceListItem(
          icon: Icons.verified_outlined,
          title: 'Comprovante anual',
          subtitle: 'Pagamentos realizados no ano',
          onPressed: () => onShowComingSoon('Comprovante anual'),
        ),
        ServiceListItem(
          icon: Icons.request_quote_outlined,
          title: 'Informe de rendimentos',
          subtitle: 'Consulte os informes disponíveis',
          onPressed: () => onShowComingSoon('Informe de rendimentos'),
        ),
      ],
    );
  }
}

class QuotaSection extends StatelessWidget {
  final Function(String) onShowComingSoon;

  const QuotaSection({super.key, required this.onShowComingSoon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Cota',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        ServiceListItem(
          icon: Icons.payments_outlined,
          title: 'Liberação de crédito',
          subtitle: 'Acompanhe sua solicitação',
          badgeText: 'Pendente',
          onPressed: () => context.push(AppRoutes.creditRelease),
        ),
        ServiceListItem(
          icon: Icons.calendar_month_outlined,
          title: 'Assembleias',
          subtitle: 'Próximas datas e resultados',
          onPressed: () => context.push(AppRoutes.assemblies),
        ),
        ServiceListItem(
          icon: Icons.gavel_outlined,
          title: 'Meus lances',
          subtitle: 'Consulte ofertas e resultados',
          onPressed: () => context.push(AppRoutes.myBids),
        ),
      ],
    );
  }
}

class HelpSection extends StatelessWidget {
  final Function(String) onShowComingSoon;

  const HelpSection({super.key, required this.onShowComingSoon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Ajuda',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        ServiceListItem(
          icon: Icons.help_outline,
          title: 'Central de ajuda',
          subtitle: 'Dúvidas sobre sua cota e os serviços',
          onPressed: () => onShowComingSoon('Central de ajuda'),
        ),
      ],
    );
  }
}
