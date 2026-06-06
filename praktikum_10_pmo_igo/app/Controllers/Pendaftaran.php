<?php

namespace App\Controllers;

// use CodeIgniter\HTTP\ResponseInterface;
use CodeIgniter\RESTful\ResourceController;

class Pendaftaran extends ResourceController
{
    protected $modelName = 'App\Models\PendaftaranModel';
    protected $format    = 'json';

    public function index()
    {
        return $this->respond($this->model->findAll());
    }

    public function show($id = null)
    {
        if (!$this->model->find($id)) {
            return $this->fail('Data pendaftar tidak ditemukan');
        }
        return $this->respond($this->model->find($id));
    }

    public function create()
    {
        $data = $this->request->getJSON(true) ?? $this->request->getPost();
        if (!$this->validate($this->model->validationRules, $this->model->validationMessages)) {
            return $this->fail($this->validator->getErrors());
        }

        if ($this->model->insert($data)) {
            $data['id'] = $this->model->getInsertID();
            $response = [
                'status'   => 'success',
                'code'     => 201,
                'messages' => 'Data berhasil ditambahkan',
                'data'     => $data
            ];
            return $this->respondCreated($response);
        }

        return $this->fail("Gagal menyimpan data ke database.");
    }

    public function update($id = null)
    {
        $data = $this->request->getJSON(true) ?? $this->request->getRawInput();
        if (!$this->model->find($id)) {
            return $this->failNotFound('Data pendaftar tidak ditemukan');
        }

        $rules = $this->model->validationRules;
        $rules['email'] = "required|valid_email|is_unique[pendaftaran.email,id,{$id}]";

        if (!$this->validate($rules, $this->model->validationMessages)) {
            return $this->fail($this->validator->getErrors());
        }

        if ($this->model->update($id, $data)) {
            $data['id'] = $id;

            $response = [
                'status'   => 'success',
                'code'     => 200,
                'messages' => 'Data berhasil diperbarui',
                'data'     => $data
            ];

            return $this->respond($response, 200);
        }

        return $this->fail("Gagal memperbarui data di database.");
    }

    public function delete($id = null)
    {
        if (!$this->model->find($id)) {
            return $this->failNotFound('Data pendaftar tidak ditemukan');
        }

        if ($this->model->delete($id)) {
            $response = [
                'status'   => 'success',
                'code'     => 200,
                'messages' => "Data pendaftar dengan id " . $id . " berhasil dihapus",
                'data'     => [
                    'id' => $id
                ]
            ];

            return $this->respond($response, 200);
        }

        return $this->fail("Gagal menghapus data di database.");
    }
}