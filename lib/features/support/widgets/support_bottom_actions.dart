import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SupportBottomActions extends StatelessWidget {
  const SupportBottomActions({super.key});

  void _showComingSoon(BuildContext context, String feature) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$feature será implementado em uma próxima etapa.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => _showComingSoon(context, 'Abrir WhatsApp'),
              icon: const Icon(Icons.chat),
              label: const Text('Continuar no WhatsApp'),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () => context.pop(),
              child: const Text('Cancelar'),
            ),
          ),
        ],
      ),
    );
  }
}
