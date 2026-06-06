<?php

namespace App\Models;

use CodeIgniter\Model;

class PendaftaranModel extends Model
{
    protected $DBGroup          = 'default';
    protected $table            = 'pendaftaran';
    protected $primaryKey       = 'id';
    protected $useAutoIncrement = true;
    protected $returnType       = 'App\Entities\Pendaftaran';
    protected $useSoftDeletes   = false;
    protected $protectFields    = true;
    protected $allowedFields    = [
        'nama',
        'email',
        'no_telepon',
        'jenis_kelamin',
        'bahasa',
        'agama',
        'tanggal_daftar',
        'jam_daftar'
    ];

    protected bool $allowEmptyInserts = false;
    protected bool $updateOnlyChanged = true;

    protected array $casts = [];
    protected array $castHandlers = [];

    // Dates
    protected $useTimestamps = false;
    protected $dateFormat    = 'datetime';
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';
    protected $deletedField  = 'deleted_at';

    // Validation
    protected $validationRules      = [
        'nama'           => 'required|min_length[3]|max_length[255]',
        'email'          => 'required|valid_email|is_unique[pendaftaran.email]',
        'no_telepon'     => 'required|integer',
        'jenis_kelamin'  => 'required',
        'bahasa'         => 'required',
        'agama'          => 'required',
        'tanggal_daftar' => 'required',
        'jam_daftar'     => 'required',
    ];
    protected $validationMessages   = [
        'nama' => [
            'required'  => 'Silakan masukan nama Anda',
            'min_length' => 'Nama minimal 3 karakter',
            'max_length' => 'Nama minimal 255 karakter',

        ],
        'email' => [
            'required'    => 'Silakan masukan email Anda',
            'valid_email' => 'Silakan masukan email yang valid',
            'is_unique'  => 'Email sudah terdaftar, silakan masukan email yang lain',
        ],
        'no_telepon' => [
            'required' => 'Silakan masukan nomor telepon Anda',
            'integer' => 'Silakan masukan berupa angka',
        ],
        'jenis_kelamin' => [
            'required' => 'Silakan masukan jenis_kelamin Anda',
        ],
        'bahasa' => [
            'required' => 'Silakan masukan bahasa Anda',
        ],
        'agama' => [
            'required' => 'Silakan masukan agama Anda',
        ],
        'tanggal_daftar' => [
            'required' => 'Silakan masukan tanggal_daftar Anda',
        ],
        'jam_daftar' => [
            'required' => 'Silakan masukan jam_daftar Anda',
        ],
    ];
    protected $skipValidation       = false;
    protected $cleanValidationRules = true;

    // Callbacks
    protected $allowCallbacks = true;
    protected $beforeInsert   = [];
    protected $afterInsert    = [];
    protected $beforeUpdate   = [];
    protected $afterUpdate    = [];
    protected $beforeFind     = [];
    protected $afterFind      = [];
    protected $beforeDelete   = [];
    protected $afterDelete    = [];

    public function update($id = null, $data = null): bool
    {
        if ($id !== null) {
            $this->validationRules['email'] = "required|valid_email|is_unique[pendaftaran.email,id,{$id}]";
        }

        return parent::update($id, $data);
    }
}