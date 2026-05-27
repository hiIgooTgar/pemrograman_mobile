<?php

namespace App\Database\Seeds;

use CodeIgniter\Database\Seeder;

class Pendaftaran extends Seeder
{
    public function run()
    {
        $data = [
            [
                'nama'           => 'Igo Tegar Prambudhy',
                'email'          => 'igostrongg@gmail.com',
                'no_telepon'     => '089510181631',
                'jenis_kelamin'  => 'Laki-Laki',
                'bahasa'         => 'Indonesia,Inggris,Portugis,Mandarin,Tagalog',
                'agama'          => 'Islam',
                'tanggal_daftar' => '2025-08-12',
                'jam_daftar'     => '10:30:35',
            ],
            [
                'nama'           => 'Axel Candra Putra',
                'email'          => 'axelputra@gmail.com',
                'no_telepon'     => '085172351234',
                'jenis_kelamin'  => 'Laki-Laki',
                'bahasa'         => 'Indonesia,Inggris,Mandarin,Melayu',
                'agama'          => 'Katholik',
                'tanggal_daftar' => '2025-05-15',
                'jam_daftar'     => '11:20:15',
            ],
            [
                'nama'           => 'Indah Ayu Putri Ningsih',
                'email'          => 'indahayu@gmail.com',
                'no_telepon'     => '081572513514',
                'jenis_kelamin'  => 'Perempuan',
                'bahasa'         => 'Indonesia,Inggris,Thailand,Melayu',
                'agama'          => 'Hindu',
                'tanggal_daftar' => '2025-11-24',
                'jam_daftar'     => '10:25:15',
            ],
            [
                'nama'           => 'Theo Edward',
                'email'          => 'theoedward@gmail.com',
                'no_telepon'     => '081533215341',
                'jenis_kelamin'  => 'Laki-Laki',
                'bahasa'         => 'Indonesia,Inggris,Mandarin,Portugis',
                'agama'          => 'Kristen',
                'tanggal_daftar' => '2025-06-11',
                'jam_daftar'     => '08:20:45',
            ],
            [
                'nama'           => 'Pricia Sintia Sinatu',
                'email'          => 'priciasinatu@gmail.com',
                'no_telepon'     => '089614251725',
                'jenis_kelamin'  => 'Perempuan',
                'bahasa'         => 'Indonesia,Inggris,Mandarin,Melayu',
                'agama'          => 'Kristen',
                'tanggal_daftar' => '2025-08-24',
                'jam_daftar'     => '11:15:45',
            ],
        ];

        $this->db->table('pendaftaran')->insertBatch($data);
    }
}