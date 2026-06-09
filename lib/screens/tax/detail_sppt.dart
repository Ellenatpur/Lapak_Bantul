import 'package:flutter/material.dart';

class DetailSppt extends StatelessWidget {
  const DetailSppt({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        shadowColor: Colors.black26,
        leading: const BackButton(color: Colors.black87),
        title: const SizedBox.shrink(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),

              // No. NOP
              Text(
                'No. NOP 378429749820294337',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade500,
                ),
              ),

              const SizedBox(height: 6),

              // Nama
              const Text(
                'AHMAD NABIL BAHROIN\nROGER SUMATRA',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  height: 1.3,
                ),
              ),

              const SizedBox(height: 8),

              // Alamat Lengkap WP
              RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                  children: const [
                    TextSpan(
                      text: 'Alamat Lengkap WP : ',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    TextSpan(
                      text:
                          'Kab Bantul, Kec. Sewon, DS. Ngireng-ireng, RT01/RW01',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),
              const Divider(color: Color(0xFFE0E0E0)),

              // Lokasi
              _buildDetailItem(
                label: 'Lokasi',
                value: 'DS. Ngireng-ireng, RT01/RW01',
                valueBold: true,
                valueFontSize: 16,
              ),

              const Divider(color: Color(0xFFE0E0E0)),

              // Status
              _buildStatusItem(),

              const Divider(color: Color(0xFFE0E0E0)),

              // Denda
              _buildDetailItem(
                label: 'Denda',
                value: 'Rp. 0',
                valueBold: true,
                valueFontSize: 16,
              ),

              const Divider(color: Color(0xFFE0E0E0)),

              // NJOP Bumi
              _buildDetailItem(
                label: 'NJOP Bumi',
                value: 'Rp. 300,000',
                valueBold: true,
                valueFontSize: 16,
              ),

              const Divider(color: Color(0xFFE0E0E0)),

              // NJOP Bangunan
              _buildDetailItem(
                label: 'NJOP Bangunan',
                value: 'Rp. 0',
                valueBold: true,
                valueFontSize: 16,
              ),

              const Divider(color: Color(0xFFE0E0E0)),

              // Luas Bumi
              _buildDetailItem(
                label: 'Luas Bumi',
                value: '227m',
                valueBold: true,
                valueFontSize: 16,
              ),

              const Divider(color: Color(0xFFE0E0E0)),

              // Luas Bangunan
              _buildDetailItem(
                label: 'Luas Bangunan',
                value: '',
                valueBold: true,
                valueFontSize: 16,
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailItem({
    required String label,
    required String value,
    bool valueBold = false,
    double valueFontSize = 14,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey.shade500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: valueFontSize,
              fontWeight: valueBold ? FontWeight.bold : FontWeight.normal,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Status',
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey.shade500,
            ),
          ),
          const SizedBox(height: 6),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'Sudah Lunas',
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}