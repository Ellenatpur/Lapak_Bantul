import 'package:flutter/material.dart';
import 'detail_sppt.dart';

class PBB2 extends StatelessWidget {
  const PBB2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        shadowColor: Colors.black26,
        leading: const BackButton(color: Colors.black87),
        title: const Text(
          'PBB',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Search Box (TETAP SEPERTI ASLIMU, TIDAK DIUBAH)
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF1A3A6B), width: 1.5),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: '764177342178410',
                  hintStyle: const TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                  ),
                  prefixIcon: Icon(Icons.search, color: Colors.grey.shade500),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // SPPT 2021
            _buildSpptCard(
              tahun: 'SPPT 2021',
              status: 'Belum lunas',
              statusColor: Colors.red,
              lokasi: 'DS. Ngireng-ireng RT01/RW01',
              njop: 'NJOP Bumi dan Bangunan',
              nominal: '200,000',
              nominalColor: const Color(0xFF1A3A6B),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DetailPbbPage(),
                  ),
                );
              },
            ),

            const SizedBox(height: 12),

            // SPPT 2020
            _buildSpptCard(
              tahun: 'SPPT 2020',
              status: 'Lunas',
              statusColor: Colors.green,
              lokasi: 'DS. Ngireng-ireng RT01/RW01',
              njop: 'NJOP Bumi dan Bangunan',
              nominal: '376,000',
              nominalColor: const Color(0xFF1A3A6B),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DetailSppt()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSpptCard({
    required String tahun,
    required String status,
    required Color statusColor,
    required String lokasi,
    required String njop,
    required String nominal,
    required Color nominalColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tahun + Status
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  tahun,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    status,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // Lokasi
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 16,
                  color: Colors.grey.shade600,
                ),
                const SizedBox(width: 4),
                Text(
                  lokasi,
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                ),
              ],
            ),

            const SizedBox(height: 6),

            // NJOP
            Row(
              children: [
                Icon(
                  Icons.monetization_on_outlined,
                  size: 16,
                  color: Colors.grey.shade600,
                ),
                const SizedBox(width: 4),
                Text(
                  njop,
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: nominalColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    nominal,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),
            const Divider(height: 1, color: Color(0xFFE0E0E0)),
            const SizedBox(height: 8),

            // Lihat Detail
            const Row(
              children: [
                Text(
                  'Lihat Detail',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 4),
                Icon(Icons.chevron_right, size: 18, color: Colors.grey),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Contoh halaman tujuan
class DetailPbbPage extends StatelessWidget {
  const DetailPbbPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail PBB'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
      ),
      body: const Center(child: Text('Halaman Detail PBB')),
    );
  }
}
