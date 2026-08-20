-- Buat tabel pengajuan
CREATE TABLE IF NOT EXISTS public.pengajuan (
  id            BIGSERIAL PRIMARY KEY,
  nama_barang   TEXT NOT NULL,
  departemen    TEXT NOT NULL,
  jumlah        INTEGER DEFAULT 1,
  harga         NUMERIC DEFAULT 0,
  urgensi       TEXT DEFAULT 'Normal',
  ulasan        TEXT DEFAULT '',
  min_stock     INTEGER DEFAULT 5,
  tanggal       TEXT DEFAULT '',
  pengaju       TEXT DEFAULT '',
  wa_pengaju    TEXT DEFAULT '',
  ttd_pengaju   TEXT DEFAULT '',
  persetujuan   TEXT DEFAULT 'Pending',
  ttd_admin     TEXT DEFAULT '',
  pembelian     TEXT DEFAULT 'Belum Dibeli'
);

-- Aktifkan RLS
ALTER TABLE public.pengajuan ENABLE ROW LEVEL SECURITY;

-- Policy: semua user bisa baca data
CREATE POLICY "Allow read" ON public.pengajuan
  FOR SELECT USING (true);

-- Policy: semua user bisa insert data
CREATE POLICY "Allow insert" ON public.pengajuan
  FOR INSERT WITH CHECK (true);

-- Policy: semua user bisa update data
CREATE POLICY "Allow update" ON public.pengajuan
  FOR UPDATE USING (true);

-- Policy: semua user bisa delete data
CREATE POLICY "Allow delete" ON public.pengajuan
  FOR DELETE USING (true);


-- =====================================================
-- TABEL PENGADUAN (DASHBOARD KELUHAN)
-- =====================================================
CREATE TABLE IF NOT EXISTS public.pengaduan (
  id             BIGINT PRIMARY KEY,
  barang_lokasi  TEXT NOT NULL,
  keluhan        TEXT NOT NULL,
  tanggal        TEXT DEFAULT '',
  status         TEXT DEFAULT 'Baru', -- 'Baru', 'Menunggu', 'Diperbaiki', 'Selesai'
  pengaju        TEXT DEFAULT '',
  email_pengaju  TEXT DEFAULT '',
  kategori       TEXT DEFAULT 'Lainnya' -- 'Elektronik', 'Peralatan Kelas', 'Fasilitas Umum', 'Lainnya'
);

-- Aktifkan RLS untuk pengaduan
ALTER TABLE public.pengaduan ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow read pengaduan" ON public.pengaduan FOR SELECT USING (true);
CREATE POLICY "Allow insert pengaduan" ON public.pengaduan FOR INSERT WITH CHECK (true);
CREATE POLICY "Allow update pengaduan" ON public.pengaduan FOR UPDATE USING (true);
CREATE POLICY "Allow delete pengaduan" ON public.pengaduan FOR DELETE USING (true);
