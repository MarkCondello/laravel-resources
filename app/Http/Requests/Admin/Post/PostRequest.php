<?php

namespace App\Http\Requests\Admin\Post;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Request;

class PostRequest extends FormRequest
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
            'title' => 'bail|required|min:4|max:80|string',
            // needs to not check uniqueness for its own model
            'slug' => 'required|string|min:4|max:80|unique:posts,slug,' . request()->input('id'),
            'body' => 'nullable|min:4|string',
        ];
    }
}
