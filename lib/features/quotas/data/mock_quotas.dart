import '../models/quota_overview.dart';

const mockQuotas = [
  QuotaOverview(
    category: QuotaCategory.property,
    title: 'Cota de imóvel',
    group: '012160',
    number: '6503',
    creditValue: 'R\$ 80.000,00',
    dueDate: '15 set.',
    status: QuotaStatus.active,
  ),
  QuotaOverview(
    category: QuotaCategory.vehicle,
    title: 'Cota de veículo',
    group: '000680',
    number: '1672',
    creditValue: 'R\$ 45.000,00',
    dueDate: '7 out.',
    status: QuotaStatus.active,
  ),
  QuotaOverview(
    category: QuotaCategory.services,
    title: 'Cota de serviços',
    group: '000770',
    number: '1389',
    creditValue: 'R\$ 20.000,00',
    dueDate: '20 set.',
    status: QuotaStatus.underReview,
  ),
];
