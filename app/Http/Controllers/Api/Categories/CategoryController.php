<?php

namespace App\Http\Controllers\Api\Categories;

use App\Models\Category;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Resources\CategoryResource;

class CategoryController extends Controller
{
    public function index()
    {
        return CategoryResource::collection(
            Category::with('children', 'children.children')->parents()->ordered()->get()
        );
    }

    public function create(Request $request)
    {
        $validateData = $request->validate([

            'name' => 'required',
            'slug' => 'required|unique:categories',
        ]);

        $validateData['parent_id'] = $request->parent_id;

        Category::create($validateData);

        return response()->json([

            'success' => true,

        ],200);

    }
}
