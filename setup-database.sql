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
