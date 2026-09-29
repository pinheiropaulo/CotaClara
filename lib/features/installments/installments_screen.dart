import 'package:cota_clara/app/data/mock_api.dart';
import 'package:cota_clara/app/routes/app_navigation.dart';
import 'package:cota_clara/app/routes/app_routes.dart';
import 'package:cota_clara/features/installments/models/installment.dart';
import 'package:cota_clara/features/installments/widgets/installment_filters.dart';
import 'package:cota_clara/features/installments/widgets/installments_list_view.dart';
import 'package:cota_clara/shared/widgets/app_task_top_bar.dart';
import 'package:flutter/material.dart';

class InstallmentsScreen extends StatefulWidget {
  const InstallmentsScreen({super.key});

  @override
  State<InstallmentsScreen> createState() => _InstallmentsScreenState();
}

class _InstallmentsScreenState extends State<InstallmentsScreen> {
  InstallmentFilter _selectedFilter = InstallmentFilter.all;

  @override
  void initState() {
    super.initState();
    MockApi.instance.currentQuota.addListener(_onQuotaChanged);
    _loadInstallments();
  }

  @override
  void dispose() {
    MockApi.instance.currentQuota.removeListener(_onQuotaChanged);
    super.dispose();
  }

  void _onQuotaChanged() {
    setState(() {});
    _loadInstallments();
  }

  List<Installment> _installments = [];
  bool _isLoading = true;

  Future<void> _loadInstallments() async {
    setState(() => _isLoading = true);
    final data = await MockApi.instance.getInstallments(
      MockApi.instance.currentQuota.value!.id,
    );
    if (mounted) {
      setState(() {
        _installments = data;
        _isLoading = false;
      });
    }
  }

  List<Installment> get _visibleInstallments =>
      _installments.where(_selectedFilter.accepts).toList(growable: false);

  void _showComingSoon(String feature) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$feature será implementado em uma próxima etapa.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 430),
            child: Column(
              children: [
                AppTaskTopBar(
                  title: 'Parcelas',
                  onBackPressed: () => context.goBackOr(AppRoutes.quotaDetails),
                  onHelpPressed: () => _showComingSoon('Ajuda com parcelas'),
                  helpTooltip: 'Ajuda e orientações',
                ),
                Expanded(
                  child: InstallmentsListView(
                    isLoading: _isLoading,
                    installments: _visibleInstallments,
                    selectedFilter: _selectedFilter,
                    onFilterSelected: (filter) {
                      setState(() => _selectedFilter = filter);
                    },
                    showComingSoon: _showComingSoon,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
