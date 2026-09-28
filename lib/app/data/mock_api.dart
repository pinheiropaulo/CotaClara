import 'package:cota_clara/features/billing/models/bill.dart';
import 'package:cota_clara/features/installments/models/installment.dart';
import 'package:cota_clara/features/notifications/models/notification_item.dart';
import 'package:cota_clara/features/quotas/models/quota_details_data.dart';
import 'package:cota_clara/features/quotas/models/quota_overview.dart';
import 'package:cota_clara/features/quotas/models/statement_entry.dart';
import 'package:flutter/material.dart';

class MockApi {
  // Singleton pattern
  MockApi._privateConstructor();
  static final MockApi instance = MockApi._privateConstructor();

  // Reactive State for active quota
  final ValueNotifier<QuotaOverview?> currentQuota =
      ValueNotifier<QuotaOverview?>(null);

  // Future simulator
  Future<T> _simulateDelay<T>(T data) async {
    await Future.delayed(
      const Duration(milliseconds: 300),
    ); // Simulate network latency
    return data;
  }

  // Quotas Database
  final List<QuotaOverview> _quotas = const [
    QuotaOverview(
      id: 'property_1',
      category: QuotaCategory.property,
      title: 'Cota de imóvel',
      group: '012160',
      number: '6503',
      creditValue: 'R\$ 150.000,00',
      dueDate: '15 set.',
      status: QuotaStatus.active,
      installmentValue: 'R\$ 842,50',
      nextInstallmentStatus: 'Pendente',
      duration: '240 meses',
      isContemplated: false,
    ),
    QuotaOverview(
      id: 'vehicle_1',
      category: QuotaCategory.vehicle,
      title: 'Cota de veículo',
      group: '000680',
      number: '1672',
      creditValue: 'R\$ 80.000,00',
      dueDate: '7 out.',
      status: QuotaStatus.active,
      installmentValue: 'R\$ 400,00',
      nextInstallmentStatus: 'Em aberto',
      duration: '90 meses',
      isContemplated: true,
    ),
    QuotaOverview(
      id: 'services_1',
      category: QuotaCategory.services,
      title: 'Cota de serviços',
      group: '000770',
      number: '1389',
      creditValue: 'R\$ 20.000,00',
      dueDate: '20 set.',
      status: QuotaStatus.underReview,
      installmentValue: 'R\$ 200,00',
      nextInstallmentStatus: 'Em análise',
      duration: '36 meses',
      isContemplated: false,
    ),
    QuotaOverview(
      id: 'blocked_1',
      category: QuotaCategory.property,
      title: 'Cota de imóvel (Em atraso)',
      group: '020400',
      number: '9901',
      creditValue: 'R\$ 200.000,00',
      dueDate: '10 set.',
      status: QuotaStatus.blocked,
      installmentValue: 'R\$ 1.150,00',
      nextInstallmentStatus: 'Em atraso',
      duration: '180 meses',
      isContemplated: false,
    ),
  ];

  static const Map<String, QuotaDetailsData> _quotaDetailsById = {
    'property_1': QuotaDetailsData(
      quotaId: 'property_1',
      contractedCreditValue: 'R\$ 150.000,00',
      currentCreditValue: 'R\$ 150.000,00',
      duration: '240 meses',
      updatePercentage: '+0,00%',
      accumulatedUpdate: 'R\$ 0,00',
      lastUpdate: '1 de setembro de 2026',
      completedInstallments: 42,
      totalInstallments: 240,
      paidAmount: 'R\$ 35.385,00',
      nextInstallmentValue: 'R\$ 842,50',
      nextInstallmentDueDate: '15 de setembro de 2026',
      nextInstallmentStatus: 'Pendente',
    ),
    'vehicle_1': QuotaDetailsData(
      quotaId: 'vehicle_1',
      contractedCreditValue: 'R\$ 80.000,00',
      currentCreditValue: 'R\$ 80.000,00',
      duration: '90 meses',
      updatePercentage: '+0,00%',
      accumulatedUpdate: 'R\$ 0,00',
      lastUpdate: '1 de outubro de 2026',
      completedInstallments: 18,
      totalInstallments: 90,
      paidAmount: 'R\$ 7.200,00',
      nextInstallmentValue: 'R\$ 400,00',
      nextInstallmentDueDate: '7 de outubro de 2026',
      nextInstallmentStatus: 'Pendente',
    ),
    'services_1': QuotaDetailsData(
      quotaId: 'services_1',
      contractedCreditValue: 'R\$ 20.000,00',
      currentCreditValue: 'R\$ 20.000,00',
      duration: '36 meses',
      updatePercentage: '+0,00%',
      accumulatedUpdate: 'R\$ 0,00',
      lastUpdate: '1 de setembro de 2026',
      completedInstallments: 4,
      totalInstallments: 36,
      paidAmount: 'R\$ 800,00',
      nextInstallmentValue: 'R\$ 200,00',
      nextInstallmentDueDate: '20 de setembro de 2026',
      nextInstallmentStatus: 'Em análise',
    ),
    'blocked_1': QuotaDetailsData(
      quotaId: 'blocked_1',
      contractedCreditValue: 'R\$ 200.000,00',
      currentCreditValue: 'R\$ 200.000,00',
      duration: '180 meses',
      updatePercentage: '+0,00%',
      accumulatedUpdate: 'R\$ 0,00',
      lastUpdate: '1 de setembro de 2026',
      completedInstallments: 20,
      totalInstallments: 180,
      paidAmount: 'R\$ 23.000,00',
      nextInstallmentValue: 'R\$ 1.150,00',
      nextInstallmentDueDate: '10 de setembro de 2026',
      nextInstallmentStatus: 'Em atraso',
    ),
  };

  // Initialize
  void init() {
    if (currentQuota.value == null && _quotas.isNotEmpty) {
      currentQuota.value = _quotas.first;
    }
  }

  // Select Quota
  void selectQuota(String id) {
    currentQuota.value = _quotas.firstWhere(
      (q) => q.id == id,
      orElse: () => _quotas.first,
    );
  }

  Future<List<QuotaOverview>> getQuotas() async {
    return _simulateDelay(_quotas);
  }

  Future<List<QuotaOverview>> getUpcomingDueQuotas() async {
    final upcomingQuotas = _quotas
        .where((quota) => quota.status == QuotaStatus.active)
        .toList(growable: false);
    return _simulateDelay(upcomingQuotas);
  }

  QuotaDetailsData quotaDetailsFor(String quotaId) {
    return _quotaDetailsById[quotaId] ?? _quotaDetailsById['property_1']!;
  }

  Future<QuotaDetailsData> getQuotaDetails(String quotaId) async {
    return _simulateDelay(quotaDetailsFor(quotaId));
  }

  // Installments per quota
  Future<List<Installment>> getInstallments(String quotaId) async {
    final quota = _quotas.firstWhere(
      (q) => q.id == quotaId,
      orElse: () => _quotas.first,
    );
    final totalDuration = int.tryParse(quota.duration.split(' ')[0]) ?? 180;

    final baseInstallments = <Installment>[
      Installment(
        month: 'Setembro de 2026',
        number: 43,
        total: totalDuration,
        status: InstallmentStatus.pending,
        valueLabel: 'Valor da cota',
        value: quota.installmentValue,
        dateLabel: 'Vencimento: 15 set. 2026',
        actionLabel: 'Ver boleto',
      ),
      Installment(
        month: 'Agosto de 2026',
        number: 42,
        total: totalDuration,
        status: InstallmentStatus.paid,
        valueLabel: 'Valor pago',
        value: quota.installmentValue,
        dateLabel: 'Paga em 12 ago. 2026',
        actionLabel: 'Comprovante',
      ),
      Installment(
        month: 'Julho de 2026',
        number: 41,
        total: totalDuration,
        status: InstallmentStatus.paid,
        valueLabel: 'Valor pago',
        value: quota.installmentValue,
        dateLabel: 'Paga em 10 jul. 2026',
        actionLabel: 'Comprovante',
      ),
      Installment(
        month: 'Junho de 2026',
        number: 40,
        total: totalDuration,
        status: InstallmentStatus.overdue,
        valueLabel: 'Valor em atraso',
        value: quota.installmentValue,
        dateLabel: 'Vencimento: 15 jun. 2026',
        actionLabel: 'Atualizar boleto',
      ),
    ];
    return _simulateDelay(baseInstallments);
  }

  // Statement per quota
  Future<List<StatementMonthGroup>> getStatement(String quotaId) async {
    final quota = _quotas.firstWhere(
      (q) => q.id == quotaId,
      orElse: () => _quotas.first,
    );

    final data = [
      StatementMonthGroup(
        monthYear: 'Setembro 2026',
        entries: [
          StatementEntry(
            id: '1',
            title: 'Pagamento de parcela',
            description: 'Parcela 43',
            amount: quota.installmentValue,
            type: StatementEntryType.payment,
            date: DateTime(2026, 9, 15),
            isPositive: false,
          ),
        ],
      ),
      StatementMonthGroup(
        monthYear: 'Agosto 2026',
        entries: [
          StatementEntry(
            id: '2',
            title: 'Pagamento de parcela',
            description: 'Parcela 42',
            amount: quota.installmentValue,
            type: StatementEntryType.payment,
            date: DateTime(2026, 8, 12),
            isPositive: false,
          ),
        ],
      ),
    ];
    return _simulateDelay(data);
  }

  // Notifications
  Future<List<NotificationGroup>> getNotifications() async {
    final data = const [
      NotificationGroup(
        title: 'HOJE',
        items: [
          NotificationItem(
            id: '1',
            title: 'Sua parcela vence em 3 dias',
            description: 'A parcela de setembro, no valor de R\$ 842,50, vence em 15 de setembro.',
            quotaContext: 'Cota de imóvel • 6503',
            timeLabel: '09h32',
            icon: Icons.receipt_long_outlined,
            status: NotificationStatus.unread,
          ),
        ],
      ),
    ];
    return _simulateDelay(data);
  }

  // Bill
  Future<Bill> getBill(String quotaId) async {
    final quota = _quotas.firstWhere(
      (q) => q.id == quotaId,
      orElse: () => _quotas.first,
    );
    final data = Bill(
      month: 'setembro',
      value: quota.installmentValue,
      dueDate: '${quota.dueDate} de 2026',
      installment: '42 de ${quota.duration.split(' ')[0]}',
      displayCode: '00190.00009 01234.567891\n23456.789012 3\n12340000084250',
      copyCode: '00190000090123456789123456789012312340000084250',
    );
    return _simulateDelay(data);
  }
}
