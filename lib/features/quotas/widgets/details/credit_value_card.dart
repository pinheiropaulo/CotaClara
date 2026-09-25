import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CreditValueCard extends StatefulWidget {
  const CreditValueCard({
    this.currentValue = 'R\$ 84.280,00',
    this.contractedValue = 'R\$ 80.000,00',
    this.duration = '180 meses',
    super.key,
  });

  final String currentValue;
  final String contractedValue;
  final String duration;

  @override
  State<CreditValueCard> createState() => _CreditValueCardState();
}

class _CreditValueCardState extends State<CreditValueCard> {
  bool _showValue = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.financialCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  'VALOR ATUAL DA CARTA',
                  style: TextStyle(
                    color: AppColors.accentBlue,
                    fontSize: 12,
                    letterSpacing: 0.8,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              IconButton(
                tooltip: _showValue ? 'Ocultar valor' : 'Exibir valor',
                visualDensity: VisualDensity.compact,
                onPressed: () => setState(() => _showValue = !_showValue),
                icon: Icon(
                  _showValue
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: AppColors.accentBlue,
                  size: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            _showValue ? widget.currentValue : 'R\$ ••••••••',
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 32,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          const Divider(height: 1, color: Color(0x338DBDDC)),
          const SizedBox(height: 12),
          Wrap(
            spacing: 18,
            runSpacing: 8,
            children: [
              _CardDetail(
                icon: Icons.description_outlined,
                label: 'Valor contratado: ${widget.contractedValue}',
              ),
              _CardDetail(icon: Icons.schedule, label: widget.duration),
            ],
          ),
        ],
      ),
    );
  }
}

class _CardDetail extends StatelessWidget {
  const _CardDetail({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: AppColors.accentBlue, size: 18),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(color: AppColors.accentBlue, fontSize: 14),
        ),
      ],
    );
  }
}
