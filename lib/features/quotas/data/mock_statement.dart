import 'package:cota_clara/features/quotas/models/statement_entry.dart';

final mockStatementGroups = [
  StatementMonthGroup(
    monthYear: 'Setembro de 2026',
    entries: [
      StatementEntry(
        id: '1',
        title: 'Pagamento de parcela',
        description: 'Parcela 43 de 180 • 12 set. 2026',
        date: DateTime(2026, 9, 12),
        amount: 'R\$ 842,50',
        type: StatementEntryType.payment,
        isPositive: false,
      ),
    ],
  ),
  StatementMonthGroup(
    monthYear: 'Agosto de 2026',
    entries: [
      StatementEntry(
        id: '2',
        title: 'Pagamento de parcela',
        description: 'Parcela 42 de 180 • 12 ago. 2026',
        date: DateTime(2026, 8, 12),
        amount: 'R\$ 835,20',
        type: StatementEntryType.payment,
        isPositive: false,
      ),
      StatementEntry(
        id: '3',
        title: 'Correção de cobrança',
        description: 'Estorno de taxa • 5 ago. 2026',
        date: DateTime(2026, 8, 5),
        amount: '+ R\$ 18,40',
        type: StatementEntryType.adjustment,
        isPositive: true,
      ),
    ],
  ),
  StatementMonthGroup(
    monthYear: 'Julho de 2026',
    entries: [
      StatementEntry(
        id: '4',
        title: 'Pagamento de parcela',
        description: 'Parcela 41 de 180 • 10 jul. 2026',
        date: DateTime(2026, 7, 10),
        amount: 'R\$ 835,20',
        type: StatementEntryType.payment,
        isPositive: false,
      ),
    ],
  ),
];
