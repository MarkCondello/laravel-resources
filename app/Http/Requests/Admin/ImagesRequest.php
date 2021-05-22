<?php

namespace App\Http\Requests\Admin;

use Illuminate\Foundation\Http\FormRequest;

class ImagesRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
           //dd(request()->input('file_name_option'));
        return [
            //'upload_file' => 'required',
            'files.*' => 'required|mimes:jpg,png,jpeg',
            'file_name' => 'required_if:file_name_option,1',
            //'file_name_option' => 'required_if:file_name,' ,

        ];
    }

 
}
