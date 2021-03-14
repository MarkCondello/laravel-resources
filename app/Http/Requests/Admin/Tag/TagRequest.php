<?php

namespace App\Http\Requests\Admin\Tag;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Request;

class TagRequest extends FormRequest
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
        return [
             // needs to not check uniquness for its own model
            'name' => 'required|string|min:4|max:80|unique:tags,name,' . request()->input('id'),
            'description' => 'nullable|min:4|string',
        ];
    }
}
