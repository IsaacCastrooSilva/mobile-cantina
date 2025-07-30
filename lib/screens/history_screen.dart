import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  final List<Map<String, dynamic>> _orders = const [
    {
      'id': '#001',
      'date': '15/12/2024',
      'items': ['Salada Caesar', 'Smoothie Verde'],
      'total': 43.40,
      'status': 'Entregue'
    },
    {
      'id': '#002',
      'date': '12/12/2024',
      'items': ['Bowl de Açaí', 'Suco Natural'],
      'total': 30.50,
      'status': 'Entregue'
    },
    {
      'id': '#003',
      'date': '10/12/2024',
      'items': ['Sanduíche Natural'],
      'total': 12.90,
      'status': 'Cancelado'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0A0E27),
              Color(0xFF1A1F3A),
              Color(0xFF2D1B69),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(context),
              Expanded(
                child: ListView.builder(
                  padding: Responsive.paddingHorizontal(context, 6.4),
                  itemCount: _orders.length,
                  itemBuilder: (context, index) => _buildOrderCard(context, _orders[index], index),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const FaIcon(FontAwesomeIcons.arrowLeft, color: Colors.white),
          ).animate().fadeIn().slideX(begin: -0.3),
          const Spacer(),
          Text(
            'Histórico',
            style: GoogleFonts.poppins(
              fontSize: Responsive.sp(context, 20),
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ).animate().fadeIn(delay: 200.ms),
          const Spacer(),
          const SizedBox(width: 48),
        ],
      ),
    );
  }

  Widget _buildOrderCard(BuildContext context, Map<String, dynamic> order, int index) {
    final isDelivered = order['status'] == 'Entregue';
    
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Pedido ${order['id']}',
                style: GoogleFonts.poppins(
                  fontSize: Responsive.sp(context, 16),
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: isDelivered ? Colors.green : Colors.red,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  order['status'],
                  style: GoogleFonts.poppins(
                    fontSize: Responsive.sp(context, 12),
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            order['date'],
            style: GoogleFonts.poppins(
              fontSize: Responsive.sp(context, 14),
              color: Colors.white.withOpacity(0.6),
            ),
          ),
          const SizedBox(height: 12),
          ...order['items'].map<Widget>((item) => Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(
              '• $item',
              style: GoogleFonts.poppins(
                fontSize: Responsive.sp(context, 14),
                color: Colors.white.withOpacity(0.8),
              ),
            ),
          )).toList(),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: GoogleFonts.poppins(
                  fontSize: Responsive.sp(context, 16),
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              Text(
                'R\$ ${order['total'].toStringAsFixed(2)}',
                style: GoogleFonts.poppins(
                  fontSize: Responsive.sp(context, 18),
                  fontWeight: FontWeight.bold,
                  color: AppTheme.secondaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    ).animate(delay: (index * 100).ms).fadeIn().slideY(begin: 0.3);
  }
}