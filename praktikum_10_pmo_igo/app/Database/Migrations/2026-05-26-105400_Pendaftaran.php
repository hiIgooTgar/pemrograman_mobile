<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class Pendaftaran extends Migration
{
    public function up()
    {
        $this->forge->addField([
            'id' => [
                'type'           => 'INT',
                'auto_increment' => true,
            ],
            'nama' => [
                'type'       => 'VARCHAR',
                'constraint' => 255,
            ],
            'email' => [
                'type'       => 'VARCHAR',
                'constraint' => 255,
            ],
            'no_telepon' => [
                'type'       => 'VARCHAR',
                'constraint' => 32,
            ],
            'jenis_kelamin' => [
                'type'       => 'ENUM',
                'constraint' => ['Laki-Laki', 'Perempuan'],
            ],
            'bahasa' => [
                'type'       => 'TEXT',
                'null' => false,
            ],
            'agama' => [
                'type'       => 'ENUM',
                'constraint' => ['Islam', 'Kristen', 'Katholik', 'Hindu', 'Buddha', 'Konghucu'],
            ],
            'tanggal_daftar' => [
                'type' => 'DATE',
                'null' => false,
            ],
            'jam_daftar' => [
                'type' => 'TIME',
                'null' => false,
            ],
        ]);
        $this->forge->addKey('id', true);
        $this->forge->createTable('pendaftaran');
    }

    public function down()
    {
        $this->forge->dropTable('pendaftaran');
    }
}