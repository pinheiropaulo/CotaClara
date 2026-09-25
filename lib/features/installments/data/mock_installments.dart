import 'package:cota_clara/features/installments/models/installment.dart';

const mockInstallments = [
  Installment(
    month: 'Setembro de 2026',
    number: 43,
    total: 180,
    status: InstallmentStatus.pending,
    valueLabel: 'Valor da cota',
    value: 'R\$ 842,50',
    dateLabel: 'Vencimento: 15 set. 2026',
    actionLabel: 'Ver boleto',
  ),
  Installment(
    month: 'Agosto de 2026',
    number: 42,
    total: 180,
    status: InstallmentStatus.paid,
    valueLabel: 'Valor pago',
    value: 'R\$ 835,20',
    dateLabel: 'Paga em 12 ago. 2026',
    actionLabel: 'Comprovante',
  ),
  Installment(
    month: 'Julho de 2026',
    number: 41,
    total: 180,
    status: InstallmentStatus.paid,
    valueLabel: 'Valor pago',
    value: 'R\$ 835,20',
    dateLabel: 'Paga em 10 jul. 2026',
    actionLabel: 'Comprovante',
  ),
  Installment(
    month: 'Junho de 2026',
    number: 40,
    total: 180,
    status: InstallmentStatus.overdue,
    valueLabel: 'Valor com encargos',
    value: 'R\$ 828,90',
    dateLabel: 'Vencimento: 15 jun. 2026',
    actionLabel: 'Atualizar boleto',
  ),
];
