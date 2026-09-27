import 'package:cota_clara/features/notifications/models/notification_item.dart';
import 'package:flutter/material.dart';

final mockNotifications = [
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
      NotificationItem(
        id: '2',
        title: 'Documentação pendente',
        description:
            'Continue o envio dos documentos para a liberação do crédito.',
        quotaContext: 'Cota de imóvel • 6503',
        timeLabel: '08h15',
        icon: Icons.folder_open_outlined,
        status: NotificationStatus.unread,
      ),
    ],
  ),
  NotificationGroup(
    title: 'ESTA SEMANA',
    items: [
      NotificationItem(
        id: '3',
        title: 'Assembleia agendada',
        description: 'A próxima assembleia será em 25 de setembro, às 19h.',
        quotaContext: 'Cota de imóvel • 6503',
        timeLabel: 'Ontem',
        icon: Icons.event_outlined,
        status: NotificationStatus.unread,
      ),
      NotificationItem(
        id: '4',
        title: 'Lance registrado',
        description: 'Sua oferta de R\$ 12.000,00 foi registrada com sucesso.',
        quotaContext: 'Cota de imóvel • 6503',
        timeLabel: '16 set.',
        icon: Icons.gavel_outlined,
        status: NotificationStatus.read,
      ),
    ],
  ),
  NotificationGroup(
    title: 'ANTERIORES',
    items: [
      NotificationItem(
        id: '5',
        title: 'Pagamento confirmado',
        description: 'O pagamento da parcela de agosto foi confirmado.',
        quotaContext: 'Cota de imóvel • 6503',
        timeLabel: '13 ago.',
        icon: Icons.check_circle_outline,
        status: NotificationStatus.read,
      ),
    ],
  ),
];
